        ifnd    MACROS_I
MACROS_I set    1

********************************************************************************
* SIN/COS lookup
********************************************************************************

SIN_LEN = $400
SIN_AMP = $4000
SIN_MASK = (SIN_LEN-1)*2

********************************************************************************
; Sin lookup (signed)
;-------------------------------------------------------------------------------
; \1 - table offset (masked to word offset, so lower bit ignored)
; \2 - dest
; \3 - amplitude (optional)
; a0 - sin tbl
;-------------------------------------------------------------------------------
SIN     macro
        ifnc    "\1","\2"
        move.w  \1,\2
        endc
        and.w   #SIN_MASK,\2
        move.w  (a0,\2),\2
        ifnc    "\3",""
        _SIN_SHIFT \3,\2
        endc
        endm

********************************************************************************
; Cos lookup (signed)
;-------------------------------------------------------------------------------
; \1 - table offset (masked to word offset, so lower bit ignored)
; \2 - dest
; \3 - amplitude (optional)
; a1 - cos tbl
;-------------------------------------------------------------------------------
COS     macro
        ifnc    "\1","\2"
        move.w  \1,\2
        endc
        and.w   #SIN_MASK,\2
        move.w  (a1,\2),\2
        ifnc    "\3",""
        _SIN_SHIFT \3,\2
        endc
        endm

********************************************************************************
; Sin lookup (usigned)
;-------------------------------------------------------------------------------
; \1 - table offset (masked to word offset, so lower bit ignored)
; \2 - dest
; \3 - amplitude (optional)
; a0 - sin tbl
;-------------------------------------------------------------------------------
SINU    macro
        ifnc    "\1","\2"
        move.w  \1,\2
        endc
        and.w   #SIN_MASK,\2
        move.w  (a0,\2),\2
        add.w   #SIN_AMP,\2
        ifnc    "\3",""
        _SIN_SHIFTU \3,\2
        endc
        endm

********************************************************************************
; Cos lookup (unsigned)
;-------------------------------------------------------------------------------
; \1 - table offset (masked to word offset, so lower bit ignored)
; \2 - dest
; \3 - amplitude (optional)
; a1 - cos tbl
;-------------------------------------------------------------------------------
COSU    macro
        ifnc    "\1","\2"
        move.w  \1,\2
        endc
        and.w   #SIN_MASK,\2
        move.w  (a1,\2),\2
        add.w   #SIN_AMP,\2
        ifnc    "\3",""
        _SIN_SHIFTU \3,\2
        endc
        endm

; Shift to range (used in SIN/COS)
_SIN_SHIFT macro
        rept    8
; shift left and swap for >8
        if      (\1)<SIN_AMP>>8
        ifeq    (SIN_AMP>>(9+REPTN))-(\1)
        ext.l   \2
        lsl.l   #7-REPTN,\2
        add.l   #$8000,\2 ; round
        swap    \2
        endc
; shift right
        else
        ifeq    (SIN_AMP>>(REPTN+1))-(\1)
        add.w   #1<<REPTN,\2 ; round
        asr.w   #(REPTN+1),\2
        endc
        endc            ; shift size
        endr
        endm

; Shift to range (used in SINU/COSU)
_SIN_SHIFTU macro
        rept    8
; shift left and swap for >8
        if      (\1)<SIN_AMP>>8
        ifeq    (SIN_AMP>>(9+REPTN))-(\1)
        swap    \2
        clr.w   \2
        swap    \2
        lsl.l   #7-REPTN,\2
        add.l   #$8000,\2 ; round
        swap    \2
        endc
; shift right
        else
        ifeq    (SIN_AMP>>(REPTN+1))-(\1)
        add.w   #1<<REPTN,\2 ; round
        lsr.w   #(REPTN+1),\2
        endc
        endc            ; shift size
        endr
        endm

********************************************************************************
* Blitter
********************************************************************************

BLIT_WAIT macro
.\@:    btst    #DMAB_BLTDONE,dmaconr(a6)
        bne.s   .\@
        endm

BLIT_WAIT_HOG macro
        move.w  #DMAF_SETCLR!DMAF_BLITHOG,dmacon(a6)
.\@:    btst    #DMAB_BLTDONE,dmaconr(a6)
        bne.s   .\@
        move.w  #DMAF_BLITHOG,dmacon(a6)
        endm

BLIT_HOG macro
        move.w  #DMAF_SETCLR!DMAF_BLITHOG,dmacon(a6)
        endm

BLIT_UNHOG macro
        move.w  #DMAF_BLITHOG,dmacon(a6)
        endm

********************************************************************************
; Build bltcon0 value
;-------------------------------------------------------------------------------
; \1 - enabled channels
; \2 - minterm
; \3 - A shift
;-------------------------------------------------------------------------------
BLTCON  macro
        ifnc    "\3",""
        move.w  #BLTEN_\1!(\2)&$ff!(\3<<12),bltcon0(a6)
        else
        move.w  #BLTEN_\1!(\2)&$ff,bltcon0(a6)
        endc
        endm

********************************************************************************
; Build bltcon0 and bltcon1 value
;-------------------------------------------------------------------------------
; \1 - enabled channels
; \2 - minterm
; \3 - A shift
; \4 - B shift
;-------------------------------------------------------------------------------
BLTCONL macro
        ifnc    "\3",""
        ifnc    "\4",""
        move.l  #(BLTEN_\1!(\2)&$ff!((\3)<<12))<<16!((\4)<<12),bltcon0(a6)
        else
        move.l  #(BLTEN_\1!(\2)&$ff!((\3)<<12))<<16,bltcon0(a6)
        endc
        else
        move.l  #(BLTEN_\1!(\2)&$ff)<<16,bltcon0(a6)
        endc
        endm

********************************************************************************
* Fixed point
********************************************************************************

I2FP16  macro
        swap    \1
        clr.w   \1
        endm

********************************************************************************
; Fixed point to integer (15)
; \1 - Fixed point value (mutated)
;-------------------------------------------------------------------------------
FP2I15  macro
        add.l   \1,\1
        swap    \1
        endm

********************************************************************************
; Fixed point to integer (14)
; \1 - Fixed point value (mutated)
;-------------------------------------------------------------------------------
FP2I14  macro
        lsl.l   #2,\1
        swap    \1
        endm

********************************************************************************
; Fixed point to integer (8)
; \1 - Fixed point value (mutated)
;-------------------------------------------------------------------------------
FP2I8   macro
        lsr.l   #8,\2
        endm

; Rounded for more accuracy

FP2I16R macro
        add.l   #$8000,\1
        swap    \1
        endm

FP2I15R macro
        add.l   \1,\1
        add.l   #$8000,\1
        swap    \1
        endm

FP2I14R macro
        lsl.l   #2,\1
        add.l   #$8000,\1
        swap    \1
        endm

FP2I8R  macro
        add.l   #$80,\2
        lsr.l   #8,\2
        endm


FPMULS15 macro
        muls.w  \1,\2
        FP2I15  \2
        endm

FPMULS15_16 macro
        muls.w  \1,\2
        add.l   \2,\2
        endm

FPMULS15_16R macro
        muls.w  \1,\2
        addq.l  #1,\2                           ; Round: add 1 to bit 0 before shift
        add.l   \2,\2                           ; Shift left by 1
        endm

FPMULS15R macro
        muls.w  \1,\2
        FP2I15R \2
        endm

FPMULU15 macro
        mulu.w  \1,\2
        FP2I15  \2
        endm

FPMULS14 macro
        muls.w  \1,\2
        FP2I14  \2
        endm

FPMULU14 macro
        mulu.w  \1,\2
        FP2I14  \2
        endm

FPMULS8 macro
        muls    \1,\2
        asr.l   #8,\2
        endm

FPMULU8 macro
        mulu    \1,\2
        lsr.l   #8,\2
        endm


********************************************************************************
; Copper
********************************************************************************

;--------------------------------------------------------------------------------
; Copper instruction data

COP_MOVE: macro
        dc.w    (\2)&$1fe,\1
        endm

COP_WAIT: macro
        dc.w    (((\1)&$ff)<<8)+((\2)&$fe)+1,$fffe
        endm

COP_WAITV: macro
        COP_WAIT \1&$ff,8
        endm

COP_WAITH: macro
        dc.w    ((\1&$80)<<8)+(\2&$fe)+1,$80fe
        endm

COP_WAITBLIT: macro
        dc.l    $10000
        endm

COP_SKIP: macro
        dc.w    (((\1)&$ff)<<8)+((\2)&$fe)+1,$ffff
        endm

COP_SKIPV: macro
        COP_SKIP \1,4
        endm

COP_SKIPH: macro
        dc.w    (((\1)&$80)<<8)+((\2)&$fe)+1,$80ff
        endm

COP_NOP: macro
        COP_MOVE 0,$1fe
        endm

COP_END: macro
        dc.l    $fffffffe
        endm

;--------------------------------------------------------------------------------
; Copper write to buffer:

COPW_WAITBLIT macro
        move.l  #$10000,(a0)+
        endm

COPW_END macro
        move.l  #-2,(a0)+
        endm

COPW_MOVEI macro
        move.l  #(\2<<16)!\1,(a0)+
        endm

COPW_MOVEW macro
        move.w  #\2,(a0)+
        move.w  \1,(a0)+
        endm

COPW_NOP macro
        move.l  #$1fe<<16,(a0)+
        endm


********************************************************************************
; Write hi/lo pair to copper
;-------------------------------------------------------------------------------
SET_COP_PTR macro
        move.w  \1,6(\2)
        swap    \1
        move.w  \1,2(\2)
        swap    \1
        add.l   #8,\2
        endm

********************************************************************************
* Clamping
********************************************************************************
CLAMP_MIN_W macro
        cmp.w   \1,\2
        bge     .noClamp\@
        move.w  \1,\2
.noClamp\@:
        endm

CLAMP_MAX_W macro
        cmp.w   \1,\2
        ble     .noClamp\@
        move.w  \1,\2
.noClamp\@:
        endm

CLAMP_MAX_WU macro
        cmp.w   \1,\2
        bls     .noClamp\@
        move.w  \1,\2
.noClamp\@:
        endm


********************************************************************************
* Register push/pop
********************************************************************************

PUSHM_COUNT set 0

********************************************************************************
; Push a set of registers onto the stack - undo with POPM
;-------------------------------------------------------------------------------
PUSHM   macro
        ifgt    NARG-1
        fail    "!!!! TOO MANY ARGUMENTS TO PUSHM !!!!"
        endc
PUSHM_COUNT set PUSHM_COUNT+1
PUSHM_\<PUSHM_COUNT>: reg \1
        movem.l PUSHM_\<PUSHM_COUNT>,-(sp)
        endm

********************************************************************************
; Undo most recent PUSHM.  'POPM NOBUMP' allows multiple exit points.
;-------------------------------------------------------------------------------
POPM    macro
        movem.l (sp)+,PUSHM_\<PUSHM_COUNT>
        ifnc    "\1","NOBUMP"
PUSHM_COUNT set PUSHM_COUNT+1                   ;error if re-used
        endc
        endm

********************************************************************************
PUSHALL macro
        PUSHM   d0-a6
        endm


********************************************************************************
; Scripting
********************************************************************************

********************************************************************************
; Initialise new script
;-------------------------------------------------------------------------------
; \1 = script routine
;-------------------------------------------------------------------------------
SCRIPT_INIT macro
        move.l  #\1+6,ScriptPtr                 ; initial offset after SCRIPT_START (8 bytes)
        endm

********************************************************************************
; Include this at start of your script routine
;-------------------------------------------------------------------------------
SCRIPT_START macro
        move.l  ScriptPtr,-(sp)                 ; jump to current offset in script
        rts
        endm

********************************************************************************
; Include this at end of your script routine, before rts
;-------------------------------------------------------------------------------
SCRIPT_END macro
        move.l  #.\@,ScriptPtr                  ; initial offset after script_jump (8 bytes)
.\@:
        endm

********************************************************************************
; Wait for frame in script
;-------------------------------------------------------------------------------
; \1 = frame count
;-------------------------------------------------------------------------------
SCRIPT_WAIT macro
        move.l  #.\@check,ScriptPtr             ; start script at this check on next frame
.\@check:
        cmp.w   #\1,Frame
        bge.s   .\@next
        rts                                     ; return from script if condition is not met
.\@next:
        endm


WAIT_EOF macro
        move.w  #$138,d0
.l\@:   move.l  4(a6),d1
        lsr.l   #1,d1
        lsr.w   #7,d1
        cmp.w   d0,d1
        bne.s   .l\@
        endm

        endif                                   ; MACROS_I
