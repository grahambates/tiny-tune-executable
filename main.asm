        code_c

        incdir  includes
        include "hw.i"

; Sample data layout:
; 16 low
; 4 high (SAMPLE_HI): see note below
; 4 low (was also high, but skipped to save bytes)
; 32 byte PWM region (SAMPLE_PWM)
; 8 low
; Chan 0 sometimes loops only the first 32 bytes (lead octave up), so that half
; needs a fixed low and high part - otherwise the PWM sweep can take it all the
; way to flat DC (silence).
SAMPLE_LEN = $40
SAMPLE_WORDS = SAMPLE_LEN/2
SAMPLE_HI = 16
SAMPLE_PWM = SAMPLE_HI+8

; Bass envelope: resets when it goes negative, so must give exactly 4 steps.
; Smallest decay with 4*decay > vol; 3*decay <= vol holds for any vol >= 9.
BASS_VOL = 30
BASS_DECAY = BASS_VOL/4+1

; Channel mask: each section one of chans 1-3 drops out or comes back (gray code)
; 8 section cycle, building up from just the lead. Chan 0 on the left:
;   #... ##.. ###. #.#. #.## #### ##.# #..#
CHANNEL_MASK_SHIFT = 5  ; section length: 4 = 1 pattern (3.2s), 5 = 6.4s, 6 = 12.8s

FRAME_WAIT = 5          ; frames to wait between loops

C = DMACON              ; a6 base: choose the most frequently used register to benefit from (a6) EA

;-------------------------------------------------------------------------------
; Tiny exe: build with -Fbin -DEXE256 to emit a hand-rolled hunk header.
; The header allocates code+sample buffer (chip), but HUNK_CODE only contains
; the code, so the sample buffer costs nothing in the file.
        ifd     EXE256
        dc.l    $3f3,0,1,0,0,((CodeEnd-Init)+SAMPLE_LEN+3)/4+$40000000 ; HUNK_HEADER, 1 hunk, chip
        dc.l    $3e9,(CodeEnd-Init)/4 ; HUNK_CODE
        endif

;-------------------------------------------------------------------------------
; Initial registers: (thanks to Losso)
; d0.l = 1 (as long as no CLI params)
; d4.l = 1
; a1 - base of the current BCPL stack frame (http://megaburken.net/~patrik/BCPL/ramlib.doc.txt)
; a2 - pointer to the BCPL Global Vector
; a3 - return address of the caller
; a4 - entry address
; a5 - pointer to a "caller" service routine
; a6 - pointer to a "returner" service routine
;-------------------------------------------------------------------------------
Init:
        lea     CUSTOM+C,a6
        bset.b  d0,$bfe001 ; filter off

; Generate sample:
; first fill with all low bytes
        lea     Sample+SAMPLE_LEN(pc),a0
        moveq   #-127,d6 ; also initial bass vol: negative, so first tick triggers
        moveq   #SAMPLE_LEN-1,d7
.fill:
        move.b  d6,-(a0)
        dbra    d7,.fill ; exits with d7 = $ffff
; next set high bytes
        not.l   SAMPLE_HI(a0) ; $81 -> $7e
        ; Can omit one for a narrower pulse, -4 bytes
        ; not.l   SAMPLE_HI+4(a0) ; $81 -> $7e

        moveq   #SAMPLE_WORDS,d5 ; also = VBLANK
        move.w  d5,INTENA-C(a6) ; disable just VERTB, so the OS VBL handler doesn't ack it before we poll
        ; move.w  #$7fff,DMACON-C(a6) ; Disable bitplane and copper DMA - can omit to leave DOS prompt, -4 bytes
        move.b  d0,DMACON-C(a6) ; Disable bitplane DMA - can omit to leave DOS prompt, -2 bytes

; Init channels:
        moveq   #(4-1)*$10,d3
.chan:
        move.l  a0,AUD0LC-C(a6,d3.w) ; location
        move.w  d5,AUD0LEN-C(a6,d3.w) ; len
        move.w  d5,AUD0VOL-C(a6,d3.w) ; vol
        sub.w   #$10,d3
        bpl.s   .chan   ; exits with d3 = -16 -> arp counter

;-------------------------------------------------------------------------------
; d3 = arp counter (initially -16 from init channel offset)
; d5 = SAMPLE_WORDS, conveniently also INTF_VERTB
; d6 = bass volume (initially -127 from sample low byte, will result in reset)
; d7 = reverse line counter (initially $ffff from sample fill loop counter)
;-------------------------------------------------------------------------------
MainLoop:
        move.w  d7,d0   ; d0 = line>>3, kept for visual progression
        lsr.w   #3,d0
        moveq   #12,d1  ; d1 = pattern offset = ((line>>5)&3)*4
        and.w   d0,d1

; Muted channels = gray(line>>6) on chans 1-3
; Exactly one channel toggles per section
        move.w  d7,d4
        lsr.w   #1,d4
        eor.w   d7,d4
        not.w   d4      ; invert for nicer build-up from lead (costs 2 bytes)
        lsr.w   #CHANNEL_MASK_SHIFT,d4 ; gray bits 0-2 -> chan bits 1-3
        and.w   #%1110,d4 ; channel 0 always on
        move.w  #$820f,DMACON-C(a6) ; set all on (no effect on already-running chans)
        move.w  d4,DMACON-C(a6) ; clear muted

; Set bass notes
        move.w  Bass(pc,d1.w),AUD2PER-C(a6)
        move.w  Bass+2(pc,d1.w),AUD3PER-C(a6)

; Arp lead
        subq.w  #2,d3   ; arp pos 4,2,0
        bpl.s   .arpOk
        moveq   #4,d3
.arpOk:
        sub.w   d3,d1   ; chan 1 arp offset (mirrored table)
        move.w  Notes+4(pc,d1.w),AUD1PER-C(a6)
        add.w   d3,d1   ; chan 0 arp offset (mirrored table)
        add.w   d3,d1
        move.w  Notes(pc,d1.w),AUD0PER-C(a6)

; Lead octave up toggle:
; Halve AUD0LEN to loop the first half of the sample.
; (Halving the period instead doesn't work: most notes would go below Paula's minimum DMA period.)
        move.w  d5,d4   ; full sample length
        ; Octave section?
        tst.b   d7      ;  Was btst #7, fun optimisation as this is the sign bit
        bmi.s   .noOctave
        lsr.w   #1,d4   ; loop half the sample = octave up
.noOctave:
        move.w  d4,AUD0LEN-C(a6)

; Pulse width modulation:
        moveq   #(SAMPLE_LEN/2)-1,d4
        and.w   d7,d4
        not.b   SAMPLE_PWM(a0,d4.w)

; Bass volume decay and reset:
        subq.w  #BASS_DECAY,d6
        bpl.s   .skipBassVol
        moveq   #BASS_VOL,d6 ; reset to initial volume on negative
.skipBassVol:
        move.w  d6,AUD2VOL-C(a6)
        move.w  d6,AUD3VOL-C(a6)

; Wait loop:
        moveq   #FRAME_WAIT-1,d4
.vbwait:
        ; Visualisation:
        ; Variable ROL amount based on line>>3, causes timing variation which gives different patterns :-)
        ; Previously used uninitialised d2 register, which happened to look good on KS1.X!
        rol.b   d0,d1
        move.w  d1,COLOR00-C(a6) ; Set block colour
        move.w  d3,COLOR00-C(a6) ; immediately restore colour using arp position, to give ~8px block with flashing background
        ; Wait vblank:
        and.b   d5,INTREQR+1-C(a6) ; was: btst #5,INTREQR+1-C(a6)
        beq.s   .vbwait
        move.w  d5,INTREQ-C(a6)
        dbra    d4,.vbwait

        dbf     d7,MainLoop ; line counter counts down (falls through after 65536 lines, ~110 min)


; Line counter counts down, so pattern index = 3-p: tables are stored reversed
; (Bass pairs in reverse order, Notes mirrored - with the two arp note reads
; going to swapped channels, this plays exactly the original notes).

; Bass1, Bass2 interleaved
Bass:
        dc.w    $a0,$168<<1
        dc.w    $a0,$1ac<<1
        dc.w    $d6,$21a<<1
        dc.w    $d6,$280<<1

Notes:
        dc.w    $8f,$a0,$b4,$be,$d6,$f0,$10d,$11d,$140

        cnop    0,4
CodeEnd:
        printv  CodeEnd-Init

; generated at runtime - just needs to be free chip RAM after the code
Sample:
        ifnd    EXE256
        ds.b    SAMPLE_LEN ; normal hunk build needs real space
        else
        dc.l    $3f2    ; HUNK_END (required - exe fails to load without it)
        printv  *-Init+32 ; total file size
        endif
