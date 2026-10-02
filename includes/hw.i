; Combined hardware include

        ifnd    _HW_I
_HW_I   set     1

custom = $dff000
CUSTOM = $DFF000
ciaa = $bfe001
ciab = $bfd000
execbase = $4

VEC_L1INT = $64
VEC_L2INT = $68
VEC_L3INT = $6c
VEC_L4INT = $70
VEC_L5INT = $74
VEC_L6INT = $78
VEC_L7INT = $7c


********************************************************************************
* Custom regs
********************************************************************************

bltddat = $000          ; Blitter dest. early read (dummy address)
dmaconr = $002          ; Dma control (and blitter status) read
vposr = $004            ; Read vertical most sig. bits (and frame flop)
vhposr = $006           ; Read vert and horiz position of beam
dskdatr = $008          ; Disk data early read (dummy address)
joy0dat = $00a          ; Joystick-mouse 0 data (vert, horiz)
joy1dat = $00c          ; Joystick-mouse 1 data (vert, horiz)
clxdat = $00e           ; Collision data reg. (read and clear)
adkconr = $010          ; Audio,disk control register read
pot0dat = $012          ; Pot counter data left pair (vert, horiz)
pot1dat = $014          ; Pot counter data right pair (vert, horiz)
potinp = $016           ; Pot pin data read
serdatr = $018          ; Serial port data and status read
dskbytr = $01a          ; Disk data byte and status read
intenar = $01c          ; Interrupt enable bits read
intreqr = $01e          ; Interrupt request bits read
dskpt = $020            ; Disk pointer
dskpth = $020           ; Disk pointer (high 5 bits, was 3 bits)
dskptl = $022           ; Disk pointer (low 15 bits)
dsklen = $024           ; Disk length
dskdat = $026           ; Disk DMA data write
refptr = $028           ; Refresh pointer
vposw = $02a            ; Write vert most sig. bits (and frame flop)
vhposw = $02c           ; Write vert and horiz pos of beam
copcon = $02e           ; Coprocessor control
serdat = $030           ; Serial port data and stop bits write
serper = $032           ; Serial port period and control
potgo = $034            ; Pot count start,pot pin drive enable data
joytest = $036          ; Write to all 4 joystick-mouse counters at once
strequ = $038           ; Strobe for horiz sync with VB and EQU
strvbl = $03a           ; Strobe for horiz sync with VB (vert blank)
strhor = $03c           ; Strobe for horiz sync
strlong = $03e          ; Strobe for identification of long horiz line
bltcon0 = $040          ; Blitter control register 0
bltcon1 = $042          ; Blitter control register 1
bltafwm = $044          ; Blitter first word mask for source A
bltalwm = $046          ; Blitter last word mask for source A
bltcpt = $048           ; Blitter pointer to source C
bltcpth = $048          ; Blitter pointer to source C (high 5 bits, was 3 bits)
bltcptl = $04a          ; Blitter pointer to source C (low 15 bits)
bltbpt = $04c           ; Blitter pointer to source B
bltbpth = $04c          ; Blitter pointer to source B (high 5 bits, was 3 bits)
bltbptl = $04e          ; Blitter pointer to source B (low 15 bits)
bltapt = $050           ; Blitter pointer to source A
bltapth = $050          ; Blitter pointer to source A (high 5 bits, was 3 bits)
bltaptl = $052          ; Blitter pointer to source A (low 15 bits)
bltdpt = $054           ; Blitter pointer to dest D
bltdpth = $054          ; Blitter pointer to dest D (high 5 bits, was 3 bits)
bltdptl = $056          ; Blitter pointer to dest D (low 15 bits)
bltsize = $058          ; Blitter start and size (win/width,height)
bltcon0l = $05a         ; control 0, lower 8 bits (minterms)
bltsizv = $05c          ; V size (for 15 bit vertical size)
bltsizh = $05e          ; H size and start (for 11 bit H size)
bltcmod = $060          ; Blitter modulo for source C
bltbmod = $062          ; Blitter modulo for source B
bltamod = $064          ; Blitter modulo for source A
bltdmod = $066          ; Blitter modulo for dest D
bltcdat = $070          ; Blitter source C data register
bltbdat = $072          ; Blitter source B data register
bltadat = $074          ; Blitter source A data register
sprhdat = $078          ; . logic UHRES sprite pointer and data identifier
bplhdat = $07a          ; . logic UHRES bit plane identifier
deniseid = $07c         ; revision level for Denise/Lisa (video out chip)
dsksync = $07e          ; Disk sync pattern reg for disk read
cop1lc = $080           ; Coprocessor 1st location
cop1lch = $080          ; Coprocessor 1st location (high 5 bits,was 3 bits)
cop1lcl = $082          ; Coprocessor 1st location (low 15 bits)
cop2lc = $084           ; Coprocessor 2nd locatio
cop2lch = $084          ; Coprocessor 2nd location(high 5 bits,was 3 bits)
cop2lcl = $086          ; Coprocessor 2nd location (low 15 bits)
copjmp1 = $088          ; Coprocessor restart at 1st location
copjmp2 = $08a          ; Coprocessor restart at 2nd location
copins = $08c           ; Coprocessor inst fetch identify
diwstrt = $08e          ; Display window start (upper left vert,horiz pos)
diwstop = $090          ; Display window stop (lower right vert,horiz pos)
ddfstrt = $092          ; Display bit plane data fetch start,horiz pos
ddfstop = $094          ; Display bit plane data fetch stop,horiz pos
dmacon = $096           ; DMA control write (clear or set)
clxcon = $098           ; Collision control
intena = $09a           ; Interrupt enable bits (clear or set bits)
intreq = $09c           ; Interrupt request bits (clear or set bits)
adkcon = $09e           ; Audio,disk,UART control
aud0lc = $0a0           ; Audio channel 0 location
aud0lch = $0a0          ; Audio channel 0 location (high 5 bits was 3 bits)
aud0lcl = $0a2          ; Audio channel 0 location (low 15 bits)
aud0len = $0a4          ; Audio channel 0 length
aud0per = $0a6          ; Audio channel 0 period
aud0vol = $0a8          ; Audio channel 0 volume
aud0dat = $0aa          ; Audio channel 0 data
aud1lc = $0b0           ; Audio channel 1 location
aud1lch = $0b0          ; Audio channel 1 location (high 5 bits was 3 bits)
aud1lcl = $0b2          ; Audio channel 1 location (low 15 bits)
aud1len = $0b4          ; Audio channel 1 length
aud1per = $0b6          ; Audio channel 1 period
aud1vol = $0b8          ; Audio channel 1 volume
aud1dat = $0ba          ; Audio channel 1 data
aud2lc = $0c0           ; Audio channel 2 location
aud2lch = $0c0          ; Audio channel 2 location (high 5 bits was 3 bits)
aud2lcl = $0c2          ; Audio channel 2 location (low 15 bits)
aud2len = $0c4          ; Audio channel 2 length
aud2per = $0c6          ; Audio channel 2 period
aud2vol = $0c8          ; Audio channel 2 volume
aud2dat = $0ca          ; Audio channel 2 data
aud3lc = $0d0           ; Audio channel 3 location
aud3lch = $0d0          ; Audio channel 3 location (high 5 bits was 3 bits)
aud3lcl = $0d2          ; Audio channel 3 location (low 15 bits)
aud3len = $0d4          ; Audio channel 3 length
aud3per = $0d6          ; Audio channel 3 period
aud3vol = $0d8          ; Audio channel 3 volume
aud3dat = $0da          ; Audio channel 3 data
bplpt = $0e0            ; Bitplane pointers
bpl1pt = $0e0           ; Bitplane pointer 1
bpl1pth = $0e0          ; Bitplane pointer 1 (high 5 bits was 3 bits)
bpl1ptl = $0e2          ; Bitplane pointer 1 (low 15 bits)
bpl2pt = $0e4           ; Bitplane pointer 2
bpl2pth = $0e4          ; Bitplane pointer 2 (high 5 bits was 3 bits)
bpl2ptl = $0e6          ; Bitplane pointer 2 (low 15 bits)
bpl3pt = $0e8           ; Bitplane pointer 3
bpl3pth = $0e8          ; Bitplane pointer 3 (high 5 bits was 3 bits)
bpl3ptl = $0ea          ; Bitplane pointer 3 (low 15 bits)
bpl4pt = $0ec           ; Bitplane pointer 4
bpl4pth = $0ec          ; Bitplane pointer 4 (high 5 bits was 3 bits)
bpl4ptl = $0ee          ; Bitplane pointer 4 (low 15 bits)
bpl5pt = $0f0           ; Bitplane pointer 5
bpl5pth = $0f0          ; Bitplane pointer 5 (high 5 bits was 3 bits)
bpl5ptl = $0f2          ; Bitplane pointer 5 (low 15 bits)
bpl6pt = $0f4           ; Bitplane pointer 6
bpl6pth = $0f4          ; Bitplane pointer 6 (high 5 bits was 3 bits)
bpl6ptl = $0f6          ; Bitplane pointer 6 (low 15 bits)
bpl7pt = $0f8           ; 7
bpl7pth = $0f8          ; 7 (high 5 bits was 3 bits)
bpl7ptl = $0fa          ; 7 (low 15 bits)
bpl8pt = $0fc           ; 8
bpl8pth = $0fc          ; 8 (high 5 bits was 3 bits)
bpl8ptl = $0fe          ; 8 (low 15 bits)
bplcon0 = $100          ; Bitplane control (miscellaneous control bits)
bplcon1 = $102          ; Bitplane control (scroll value)
bplcon2 = $104          ; Bitplane control (video priority control)
bplcon3 = $106          ; Bitplane control (enhanced features)
bpl1mod = $108          ; Bitplane modulo (odd planes)
bpl2mod = $10a          ; Bitplane modulo (even planes)
bplcon4 = $10c          ; (bitplane and sprite-masks)
clxcon2 = $10e          ; control
bpldat = $110           ; Bitplane data (parallel to serial convert)
bpl1dat = $110          ; Bitplane 1 data (parallel to serial convert)
bpl2dat = $112          ; Bitplane 2 data (parallel to serial convert)
bpl3dat = $114          ; Bitplane 3 data (parallel to serial convert)
bpl4dat = $116          ; Bitplane 4 data (parallel to serial convert)
bpl5dat = $118          ; Bitplane 5 data (parallel to serial convert)
bpl6dat = $11a          ; Bitplane 6 data (parallel to serial convert)
bpl7dat = $11c          ; data (parallel to serial convert)
bpl8dat = $11e          ; data (parallel to serial convert)
sprpt = $120            ; Sprite pointers
spr0pt = $120           ; Sprite 0 pointer
spr0pth = $120          ; Sprite 0 pointer (high 5 bits was 3 bits)
spr0ptl = $122          ; Sprite 0 pointer (low 15 bits)
spr1pt = $124           ; Sprite 1 pointer
spr1pth = $124          ; Sprite 1 pointer (high 5 bits was 3 bits)
spr1ptl = $126          ; Sprite 1 pointer (low 15 bits)
spr2pt = $128           ; Sprite 2 pointer
spr2pth = $128          ; Sprite 2 pointer (high 5 bits was 3 bits)
spr2ptl = $12a          ; Sprite 2 pointer (low 15 bits)
spr3pt = $12c           ; Sprite 3 pointer
spr3pth = $12c          ; Sprite 3 pointer (high 5 bits was 3 bits)
spr3ptl = $12e          ; Sprite 3 pointer (low 15 bits)
spr4pt = $130           ; Sprite 4 pointer
spr4pth = $130          ; Sprite 4 pointer (high 5 bits was 3 bits)
spr4ptl = $132          ; Sprite 4 pointer (low 15 bits)
spr5pt = $134           ; Sprite 5 pointer
spr5pth = $134          ; Sprite 5 pointer (high 5 bits was 3 bits)
spr5ptl = $136          ; Sprite 5 pointer (low 15 bits)
spr6pt = $138           ; Sprite 6 pointer
spr6pth = $138          ; Sprite 6 pointer (high 5 bits was 3 bits)
spr6ptl = $13a          ; Sprite 6 pointer (low 15 bits)
spr7pt = $13c           ; Sprite 7 pointer
spr7pth = $13c          ; Sprite 7 pointer (high 5 bits was 3 bits)
spr7ptl = $13e          ; Sprite 7 pointer (low 15 bits)
spr0pos = $140          ; Sprite 0 vert,horiz start pos data
spr0ctl = $142          ; Sprite 0 position and control data
spr0data = $144         ; Sprite 0 image data register A
spr0datb = $146         ; Sprite 0 image data register B
spr1pos = $148          ; Sprite 1 vert,horiz start pos data
spr1ctl = $14a          ; Sprite 1 position and control data
spr1data = $14c         ; Sprite 1 image data register A
spr1datb = $14e         ; Sprite 1 image data register B
spr2pos = $150          ; Sprite 2 vert,horiz start pos data
spr2ctl = $152          ; Sprite 2 position and control data
spr2data = $154         ; Sprite 2 image data register A
spr2datb = $156         ; Sprite 2 image data register B
spr3pos = $158          ; Sprite 3 vert,horiz start pos data
spr3ctl = $15a          ; Sprite 3 position and control data
spr3data = $15c         ; Sprite 3 image data register A
spr3datb = $15e         ; Sprite 3 image data register B
spr4pos = $160          ; Sprite 4 vert,horiz start pos data
spr4ctl = $162          ; Sprite 4 position and control data
spr4data = $164         ; Sprite 4 image data register A
spr4datb = $166         ; Sprite 4 image data register B
spr5pos = $168          ; Sprite 5 vert,horiz start pos data
spr5ctl = $16a          ; Sprite 5 position and control data
spr5data = $16c         ; Sprite 5 image data register A
spr5datb = $16e         ; Sprite 5 image data register B
spr6pos = $170          ; Sprite 6 vert,horiz start pos data
spr6ctl = $172          ; Sprite 6 position and control data
spr6data = $174         ; Sprite 6 image data register A
spr6datb = $176         ; Sprite 6 image data register B
spr7pos = $178          ; Sprite 7 vert,horiz start pos data
spr7ctl = $17a          ; Sprite 7 position and control data
spr7data = $17c         ; Sprite 7 image data register A
spr7datb = $17e         ; Sprite 7 image data register B
color00 = $180          ; Color table 0
color01 = $182          ; Color table 1
color02 = $184          ; Color table 2
color03 = $186          ; Color table 3
color04 = $188          ; Color table 4
color05 = $18a          ; Color table 5
color06 = $18c          ; Color table 6
color07 = $18e          ; Color table 7
color08 = $190          ; Color table 8
color09 = $192          ; Color table 9
color10 = $194          ; Color table 10
color11 = $196          ; Color table 11
color12 = $198          ; Color table 12
color13 = $19a          ; Color table 13
color14 = $19c          ; Color table 14
color15 = $19e          ; Color table 15
color16 = $1a0          ; Color table 16
color17 = $1a2          ; Color table 17
color18 = $1a4          ; Color table 18
color19 = $1a6          ; Color table 19
color20 = $1a8          ; Color table 20
color21 = $1aa          ; Color table 21
color22 = $1ac          ; Color table 22
color23 = $1ae          ; Color table 23
color24 = $1b0          ; Color table 24
color25 = $1b2          ; Color table 25
color26 = $1b4          ; Color table 26
color27 = $1b6          ; Color table 27
color28 = $1b8          ; Color table 28
color29 = $1ba          ; Color table 29
color30 = $1bc          ; Color table 30
color31 = $1be          ; Color table 31
htotal = $1c0           ; number count, horiz line (VARBEAMEN=1)
hsstop = $1c2           ; line position for HSYNC stop
hbstrt = $1c4           ; line position for HBLANK start
hbstop = $1c6           ; line position for HBLANK stop
vtotal = $1c8           ; numbered vertical line (VARBEAMEN=1)
vsstop = $1ca           ; line position for VSYNC stop
vbstrt = $1cc           ; line for VBLANK start
vbstop = $1ce           ; line for VBLANK stop
sprhstrt = $1d0         ; sprite vertical start
sprhstop = $1d2         ; sprite vertical stop
bplhstrt = $1d4         ; bit plane vertical start
bplhstop = $1d6         ; bit plane vertical stop
hhposw = $1d8           ; mode hires H beam counter write
hhposr = $1da           ; mode hires H beam counter read
beamcon0 = $1dc         ; Beam counter control register (SHRES,UHRES,PAL)
hsstrt = $1de           ; sync start (VARHSY)
vsstrt = $1e0           ; sync start (VARVSY)
hcenter = $1e2          ; position for Vsync on interlace
diwhigh = $1e4          ; window - upper bits for start/stop
bplhmod = $1e6          ; bit plane modulo
sprhpt = $1e8           ; sprite pointer
sprhpth = $1e8          ; sprite pointer (high 5 bits)
sprhptl = $1ea          ; sprite pointer (low 15 bits)
bplhpt = $1ec           ;
bplhpth = $1ec          ; (UHRES) bitplane pointer (hi 5 bits)
bplhptl = $1ee          ; (UHRES) bitplane pointer (lo 15 bits)
fmode = $1fc            ; register

BLTDDAT = $000          ; BLITTER DEST. EARLY READ (DUMMY ADDRESS)
DMACONR = $002          ; DMA CONTROL (AND BLITTER STATUS) READ
VPOSR = $004            ; READ VERTICAL MOST SIG. BITS (AND FRAME FLOP)
VHPOSR = $006           ; READ VERT AND HORIZ POSITION OF BEAM
DSKDATR = $008          ; DISK DATA EARLY READ (DUMMY ADDRESS)
JOY0DAT = $00A          ; JOYSTICK-MOUSE 0 DATA (VERT, HORIZ)
JOY1DAT = $00C          ; JOYSTICK-MOUSE 1 DATA (VERT, HORIZ)
CLXDAT = $00E           ; COLLISION DATA REG. (READ AND CLEAR)
ADKCONR = $010          ; AUDIO,DISK CONTROL REGISTER READ
POT0DAT = $012          ; POT COUNTER DATA LEFT PAIR (VERT, HORIZ)
POT1DAT = $014          ; POT COUNTER DATA RIGHT PAIR (VERT, HORIZ)
POTINP = $016           ; POT PIN DATA READ
SERDATR = $018          ; SERIAL PORT DATA AND STATUS READ
DSKBYTR = $01A          ; DISK DATA BYTE AND STATUS READ
INTENAR = $01C          ; INTERRUPT ENABLE BITS READ
INTREQR = $01E          ; INTERRUPT REQUEST BITS READ
DSKPT = $020            ; DISK POINTER
DSKPTH = $020           ; DISK POINTER (HIGH 5 BITS, WAS 3 BITS)
DSKPTL = $022           ; DISK POINTER (LOW 15 BITS)
DSKLEN = $024           ; DISK LENGTH
DSKDAT = $026           ; DISK DMA DATA WRITE
REFPTR = $028           ; REFRESH POINTER
VPOSW = $02A            ; WRITE VERT MOST SIG. BITS (AND FRAME FLOP)
VHPOSW = $02C           ; WRITE VERT AND HORIZ POS OF BEAM
COPCON = $02E           ; COPROCESSOR CONTROL
SERDAT = $030           ; SERIAL PORT DATA AND STOP BITS WRITE
SERPER = $032           ; SERIAL PORT PERIOD AND CONTROL
POTGO = $034            ; POT COUNT START,POT PIN DRIVE ENABLE DATA
JOYTEST = $036          ; WRITE TO ALL 4 JOYSTICK-MOUSE COUNTERS AT ONCE
STREQU = $038           ; STROBE FOR HORIZ SYNC WITH VB AND EQU
STRVBL = $03A           ; STROBE FOR HORIZ SYNC WITH VB (VERT BLANK)
STRHOR = $03C           ; STROBE FOR HORIZ SYNC
STRLONG = $03E          ; STROBE FOR IDENTIFICATION OF LONG HORIZ LINE
BLTCON0 = $040          ; BLITTER CONTROL REGISTER 0
BLTCON1 = $042          ; BLITTER CONTROL REGISTER 1
BLTAFWM = $044          ; BLITTER FIRST WORD MASK FOR SOURCE A
BLTALWM = $046          ; BLITTER LAST WORD MASK FOR SOURCE A
BLTCPT = $048           ; BLITTER POINTER TO SOURCE C
BLTCPTH = $048          ; BLITTER POINTER TO SOURCE C (HIGH 5 BITS, WAS 3 BITS)
BLTCPTL = $04A          ; BLITTER POINTER TO SOURCE C (LOW 15 BITS)
BLTBPT = $04C           ; BLITTER POINTER TO SOURCE B
BLTBPTH = $04C          ; BLITTER POINTER TO SOURCE B (HIGH 5 BITS, WAS 3 BITS)
BLTBPTL = $04E          ; BLITTER POINTER TO SOURCE B (LOW 15 BITS)
BLTAPT = $050           ; BLITTER POINTER TO SOURCE A
BLTAPTH = $050          ; BLITTER POINTER TO SOURCE A (HIGH 5 BITS, WAS 3 BITS)
BLTAPTL = $052          ; BLITTER POINTER TO SOURCE A (LOW 15 BITS)
BLTDPT = $054           ; BLITTER POINTER TO DEST D
BLTDPTH = $054          ; BLITTER POINTER TO DEST D (HIGH 5 BITS, WAS 3 BITS)
BLTDPTL = $056          ; BLITTER POINTER TO DEST D (LOW 15 BITS)
BLTSIZE = $058          ; BLITTER START AND SIZE (WIN/WIDTH,HEIGHT)
BLTCON0L = $05A         ; CONTROL 0, LOWER 8 BITS (MINTERMS)
BLTSIZV = $05C          ; V SIZE (FOR 15 BIT VERTICAL SIZE)
BLTSIZH = $05E          ; H SIZE AND START (FOR 11 BIT H SIZE)
BLTCMOD = $060          ; BLITTER MODULO FOR SOURCE C
BLTBMOD = $062          ; BLITTER MODULO FOR SOURCE B
BLTAMOD = $064          ; BLITTER MODULO FOR SOURCE A
BLTDMOD = $066          ; BLITTER MODULO FOR DEST D
BLTCDAT = $070          ; BLITTER SOURCE C DATA REGISTER
BLTBDAT = $072          ; BLITTER SOURCE B DATA REGISTER
BLTADAT = $074          ; BLITTER SOURCE A DATA REGISTER
SPRHDAT = $078          ; . LOGIC UHRES SPRITE POINTER AND DATA IDENTIFIER
BPLHDAT = $07A          ; . LOGIC UHRES BIT PLANE IDENTIFIER
DENISEID = $07C         ; REVISION LEVEL FOR DENISE/LISA (VIDEO OUT CHIP)
DSKSYNC = $07E          ; DISK SYNC PATTERN REG FOR DISK READ
COP1LC = $080           ; COPROCESSOR 1ST LOCATION
COP1LCH = $080          ; COPROCESSOR 1ST LOCATION (HIGH 5 BITS,WAS 3 BITS)
COP1LCL = $082          ; COPROCESSOR 1ST LOCATION (LOW 15 BITS)
COP2LC = $084           ; COPROCESSOR 2ND LOCATIO
COP2LCH = $084          ; COPROCESSOR 2ND LOCATION(HIGH 5 BITS,WAS 3 BITS)
COP2LCL = $086          ; COPROCESSOR 2ND LOCATION (LOW 15 BITS)
COPJMP1 = $088          ; COPROCESSOR RESTART AT 1ST LOCATION
COPJMP2 = $08A          ; COPROCESSOR RESTART AT 2ND LOCATION
COPINS = $08C           ; COPROCESSOR INST FETCH IDENTIFY
DIWSTRT = $08E          ; DISPLAY WINDOW START (UPPER LEFT VERT,HORIZ POS)
DIWSTOP = $090          ; DISPLAY WINDOW STOP (LOWER RIGHT VERT,HORIZ POS)
DDFSTRT = $092          ; DISPLAY BIT PLANE DATA FETCH START,HORIZ POS
DDFSTOP = $094          ; DISPLAY BIT PLANE DATA FETCH STOP,HORIZ POS
DMACON = $096           ; DMA CONTROL WRITE (CLEAR OR SET)
CLXCON = $098           ; COLLISION CONTROL
INTENA = $09A           ; INTERRUPT ENABLE BITS (CLEAR OR SET BITS)
INTREQ = $09C           ; INTERRUPT REQUEST BITS (CLEAR OR SET BITS)
ADKCON = $09E           ; AUDIO,DISK,UART CONTROL
AUD0LC = $0A0           ; AUDIO CHANNEL 0 LOCATION
AUD0LCH = $0A0          ; AUDIO CHANNEL 0 LOCATION (HIGH 5 BITS WAS 3 BITS)
AUD0LCL = $0A2          ; AUDIO CHANNEL 0 LOCATION (LOW 15 BITS)
AUD0LEN = $0A4          ; AUDIO CHANNEL 0 LENGTH
AUD0PER = $0A6          ; AUDIO CHANNEL 0 PERIOD
AUD0VOL = $0A8          ; AUDIO CHANNEL 0 VOLUME
AUD0DAT = $0AA          ; AUDIO CHANNEL 0 DATA
AUD1LC = $0B0           ; AUDIO CHANNEL 1 LOCATION
AUD1LCH = $0B0          ; AUDIO CHANNEL 1 LOCATION (HIGH 5 BITS WAS 3 BITS)
AUD1LCL = $0B2          ; AUDIO CHANNEL 1 LOCATION (LOW 15 BITS)
AUD1LEN = $0B4          ; AUDIO CHANNEL 1 LENGTH
AUD1PER = $0B6          ; AUDIO CHANNEL 1 PERIOD
AUD1VOL = $0B8          ; AUDIO CHANNEL 1 VOLUME
AUD1DAT = $0BA          ; AUDIO CHANNEL 1 DATA
AUD2LC = $0C0           ; AUDIO CHANNEL 2 LOCATION
AUD2LCH = $0C0          ; AUDIO CHANNEL 2 LOCATION (HIGH 5 BITS WAS 3 BITS)
AUD2LCL = $0C2          ; AUDIO CHANNEL 2 LOCATION (LOW 15 BITS)
AUD2LEN = $0C4          ; AUDIO CHANNEL 2 LENGTH
AUD2PER = $0C6          ; AUDIO CHANNEL 2 PERIOD
AUD2VOL = $0C8          ; AUDIO CHANNEL 2 VOLUME
AUD2DAT = $0CA          ; AUDIO CHANNEL 2 DATA
AUD3LC = $0D0           ; AUDIO CHANNEL 3 LOCATION
AUD3LCH = $0D0          ; AUDIO CHANNEL 3 LOCATION (HIGH 5 BITS WAS 3 BITS)
AUD3LCL = $0D2          ; AUDIO CHANNEL 3 LOCATION (LOW 15 BITS)
AUD3LEN = $0D4          ; AUDIO CHANNEL 3 LENGTH
AUD3PER = $0D6          ; AUDIO CHANNEL 3 PERIOD
AUD3VOL = $0D8          ; AUDIO CHANNEL 3 VOLUME
AUD3DAT = $0DA          ; AUDIO CHANNEL 3 DATA
BPLPT = $0E0            ; BITPLANE POINTERS
BPL1PT = $0E0           ; BITPLANE POINTER 1
BPL1PTH = $0E0          ; BITPLANE POINTER 1 (HIGH 5 BITS WAS 3 BITS)
BPL1PTL = $0E2          ; BITPLANE POINTER 1 (LOW 15 BITS)
BPL2PT = $0E4           ; BITPLANE POINTER 2
BPL2PTH = $0E4          ; BITPLANE POINTER 2 (HIGH 5 BITS WAS 3 BITS)
BPL2PTL = $0E6          ; BITPLANE POINTER 2 (LOW 15 BITS)
BPL3PT = $0E8           ; BITPLANE POINTER 3
BPL3PTH = $0E8          ; BITPLANE POINTER 3 (HIGH 5 BITS WAS 3 BITS)
BPL3PTL = $0EA          ; BITPLANE POINTER 3 (LOW 15 BITS)
BPL4PT = $0EC           ; BITPLANE POINTER 4
BPL4PTH = $0EC          ; BITPLANE POINTER 4 (HIGH 5 BITS WAS 3 BITS)
BPL4PTL = $0EE          ; BITPLANE POINTER 4 (LOW 15 BITS)
BPL5PT = $0F0           ; BITPLANE POINTER 5
BPL5PTH = $0F0          ; BITPLANE POINTER 5 (HIGH 5 BITS WAS 3 BITS)
BPL5PTL = $0F2          ; BITPLANE POINTER 5 (LOW 15 BITS)
BPL6PT = $0F4           ; BITPLANE POINTER 6
BPL6PTH = $0F4          ; BITPLANE POINTER 6 (HIGH 5 BITS WAS 3 BITS)
BPL6PTL = $0F6          ; BITPLANE POINTER 6 (LOW 15 BITS)
BPL7PT = $0F8           ; 7
BPL7PTH = $0F8          ; 7 (HIGH 5 BITS WAS 3 BITS)
BPL7PTL = $0FA          ; 7 (LOW 15 BITS)
BPL8PT = $0FC           ; 8
BPL8PTH = $0FC          ; 8 (HIGH 5 BITS WAS 3 BITS)
BPL8PTL = $0FE          ; 8 (LOW 15 BITS)
BPLCON0 = $100          ; BITPLANE CONTROL (MISCELLANEOUS CONTROL BITS)
BPLCON1 = $102          ; BITPLANE CONTROL (SCROLL VALUE)
BPLCON2 = $104          ; BITPLANE CONTROL (VIDEO PRIORITY CONTROL)
BPLCON3 = $106          ; BITPLANE CONTROL (ENHANCED FEATURES)
BPL1MOD = $108          ; BITPLANE MODULO (ODD PLANES)
BPL2MOD = $10A          ; BITPLANE MODULO (EVEN PLANES)
BPLCON4 = $10C          ; (BITPLANE AND SPRITE-MASKS)
CLXCON2 = $10E          ; CONTROL
BPLDAT = $110           ; BITPLANE DATA (PARALLEL TO SERIAL CONVERT)
BPL1DAT = $110          ; BITPLANE 1 DATA (PARALLEL TO SERIAL CONVERT)
BPL2DAT = $112          ; BITPLANE 2 DATA (PARALLEL TO SERIAL CONVERT)
BPL3DAT = $114          ; BITPLANE 3 DATA (PARALLEL TO SERIAL CONVERT)
BPL4DAT = $116          ; BITPLANE 4 DATA (PARALLEL TO SERIAL CONVERT)
BPL5DAT = $118          ; BITPLANE 5 DATA (PARALLEL TO SERIAL CONVERT)
BPL6DAT = $11A          ; BITPLANE 6 DATA (PARALLEL TO SERIAL CONVERT)
BPL7DAT = $11C          ; DATA (PARALLEL TO SERIAL CONVERT)
BPL8DAT = $11E          ; DATA (PARALLEL TO SERIAL CONVERT)
SPRPT = $120            ; SPRITE POINTERS
SPR0PT = $120           ; SPRITE 0 POINTER
SPR0PTH = $120          ; SPRITE 0 POINTER (HIGH 5 BITS WAS 3 BITS)
SPR0PTL = $122          ; SPRITE 0 POINTER (LOW 15 BITS)
SPR1PT = $124           ; SPRITE 1 POINTER
SPR1PTH = $124          ; SPRITE 1 POINTER (HIGH 5 BITS WAS 3 BITS)
SPR1PTL = $126          ; SPRITE 1 POINTER (LOW 15 BITS)
SPR2PT = $128           ; SPRITE 2 POINTER
SPR2PTH = $128          ; SPRITE 2 POINTER (HIGH 5 BITS WAS 3 BITS)
SPR2PTL = $12A          ; SPRITE 2 POINTER (LOW 15 BITS)
SPR3PT = $12C           ; SPRITE 3 POINTER
SPR3PTH = $12C          ; SPRITE 3 POINTER (HIGH 5 BITS WAS 3 BITS)
SPR3PTL = $12E          ; SPRITE 3 POINTER (LOW 15 BITS)
SPR4PT = $130           ; SPRITE 4 POINTER
SPR4PTH = $130          ; SPRITE 4 POINTER (HIGH 5 BITS WAS 3 BITS)
SPR4PTL = $132          ; SPRITE 4 POINTER (LOW 15 BITS)
SPR5PT = $134           ; SPRITE 5 POINTER
SPR5PTH = $134          ; SPRITE 5 POINTER (HIGH 5 BITS WAS 3 BITS)
SPR5PTL = $136          ; SPRITE 5 POINTER (LOW 15 BITS)
SPR6PT = $138           ; SPRITE 6 POINTER
SPR6PTH = $138          ; SPRITE 6 POINTER (HIGH 5 BITS WAS 3 BITS)
SPR6PTL = $13A          ; SPRITE 6 POINTER (LOW 15 BITS)
SPR7PT = $13C           ; SPRITE 7 POINTER
SPR7PTH = $13C          ; SPRITE 7 POINTER (HIGH 5 BITS WAS 3 BITS)
SPR7PTL = $13E          ; SPRITE 7 POINTER (LOW 15 BITS)
SPR0POS = $140          ; SPRITE 0 VERT,HORIZ START POS DATA
SPR0CTL = $142          ; SPRITE 0 POSITION AND CONTROL DATA
SPR0DATA = $144         ; SPRITE 0 IMAGE DATA REGISTER A
SPR0DATB = $146         ; SPRITE 0 IMAGE DATA REGISTER B
SPR1POS = $148          ; SPRITE 1 VERT,HORIZ START POS DATA
SPR1CTL = $14A          ; SPRITE 1 POSITION AND CONTROL DATA
SPR1DATA = $14C         ; SPRITE 1 IMAGE DATA REGISTER A
SPR1DATB = $14E         ; SPRITE 1 IMAGE DATA REGISTER B
SPR2POS = $150          ; SPRITE 2 VERT,HORIZ START POS DATA
SPR2CTL = $152          ; SPRITE 2 POSITION AND CONTROL DATA
SPR2DATA = $154         ; SPRITE 2 IMAGE DATA REGISTER A
SPR2DATB = $156         ; SPRITE 2 IMAGE DATA REGISTER B
SPR3POS = $158          ; SPRITE 3 VERT,HORIZ START POS DATA
SPR3CTL = $15A          ; SPRITE 3 POSITION AND CONTROL DATA
SPR3DATA = $15C         ; SPRITE 3 IMAGE DATA REGISTER A
SPR3DATB = $15E         ; SPRITE 3 IMAGE DATA REGISTER B
SPR4POS = $160          ; SPRITE 4 VERT,HORIZ START POS DATA
SPR4CTL = $162          ; SPRITE 4 POSITION AND CONTROL DATA
SPR4DATA = $164         ; SPRITE 4 IMAGE DATA REGISTER A
SPR4DATB = $166         ; SPRITE 4 IMAGE DATA REGISTER B
SPR5POS = $168          ; SPRITE 5 VERT,HORIZ START POS DATA
SPR5CTL = $16A          ; SPRITE 5 POSITION AND CONTROL DATA
SPR5DATA = $16C         ; SPRITE 5 IMAGE DATA REGISTER A
SPR5DATB = $16E         ; SPRITE 5 IMAGE DATA REGISTER B
SPR6POS = $170          ; SPRITE 6 VERT,HORIZ START POS DATA
SPR6CTL = $172          ; SPRITE 6 POSITION AND CONTROL DATA
SPR6DATA = $174         ; SPRITE 6 IMAGE DATA REGISTER A
SPR6DATB = $176         ; SPRITE 6 IMAGE DATA REGISTER B
SPR7POS = $178          ; SPRITE 7 VERT,HORIZ START POS DATA
SPR7CTL = $17A          ; SPRITE 7 POSITION AND CONTROL DATA
SPR7DATA = $17C         ; SPRITE 7 IMAGE DATA REGISTER A
SPR7DATB = $17E         ; SPRITE 7 IMAGE DATA REGISTER B
COLOR00 = $180          ; COLOR TABLE 0
COLOR01 = $182          ; COLOR TABLE 1
COLOR02 = $184          ; COLOR TABLE 2
COLOR03 = $186          ; COLOR TABLE 3
COLOR04 = $188          ; COLOR TABLE 4
COLOR05 = $18A          ; COLOR TABLE 5
COLOR06 = $18C          ; COLOR TABLE 6
COLOR07 = $18E          ; COLOR TABLE 7
COLOR08 = $190          ; COLOR TABLE 8
COLOR09 = $192          ; COLOR TABLE 9
COLOR10 = $194          ; COLOR TABLE 10
COLOR11 = $196          ; COLOR TABLE 11
COLOR12 = $198          ; COLOR TABLE 12
COLOR13 = $19A          ; COLOR TABLE 13
COLOR14 = $19C          ; COLOR TABLE 14
COLOR15 = $19E          ; COLOR TABLE 15
COLOR16 = $1A0          ; COLOR TABLE 16
COLOR17 = $1A2          ; COLOR TABLE 17
COLOR18 = $1A4          ; COLOR TABLE 18
COLOR19 = $1A6          ; COLOR TABLE 19
COLOR20 = $1A8          ; COLOR TABLE 20
COLOR21 = $1AA          ; COLOR TABLE 21
COLOR22 = $1AC          ; COLOR TABLE 22
COLOR23 = $1AE          ; COLOR TABLE 23
COLOR24 = $1B0          ; COLOR TABLE 24
COLOR25 = $1B2          ; COLOR TABLE 25
COLOR26 = $1B4          ; COLOR TABLE 26
COLOR27 = $1B6          ; COLOR TABLE 27
COLOR28 = $1B8          ; COLOR TABLE 28
COLOR29 = $1BA          ; COLOR TABLE 29
COLOR30 = $1BC          ; COLOR TABLE 30
COLOR31 = $1BE          ; COLOR TABLE 31
HTOTAL = $1C0           ; NUMBER COUNT, HORIZ LINE (VARBEAMEN=1)
HSSTOP = $1C2           ; LINE POSITION FOR HSYNC STOP
HBSTRT = $1C4           ; LINE POSITION FOR HBLANK START
HBSTOP = $1C6           ; LINE POSITION FOR HBLANK STOP
VTOTAL = $1C8           ; NUMBERED VERTICAL LINE (VARBEAMEN=1)
VSSTOP = $1CA           ; LINE POSITION FOR VSYNC STOP
VBSTRT = $1CC           ; LINE FOR VBLANK START
VBSTOP = $1CE           ; LINE FOR VBLANK STOP
SPRHSTRT = $1D0         ; SPRITE VERTICAL START
SPRHSTOP = $1D2         ; SPRITE VERTICAL STOP
BPLHSTRT = $1D4         ; BIT PLANE VERTICAL START
BPLHSTOP = $1D6         ; BIT PLANE VERTICAL STOP
HHPOSW = $1D8           ; MODE HIRES H BEAM COUNTER WRITE
HHPOSR = $1DA           ; MODE HIRES H BEAM COUNTER READ
BEAMCON0 = $1DC         ; BEAM COUNTER CONTROL REGISTER (SHRES,UHRES,PAL)
HSSTRT = $1DE           ; SYNC START (VARHSY)
VSSTRT = $1E0           ; SYNC START (VARVSY)
HCENTER = $1E2          ; POSITION FOR VSYNC ON INTERLACE
DIWHIGH = $1E4          ; WINDOW - UPPER BITS FOR START/STOP
BPLHMOD = $1E6          ; BIT PLANE MODULO
SPRHPT = $1E8           ; SPRITE POINTER
SPRHPTH = $1E8          ; SPRITE POINTER (HIGH 5 BITS)
SPRHPTL = $1EA          ; SPRITE POINTER (LOW 15 BITS)
BPLHPT = $1EC           ;
BPLHPTH = $1EC          ; (UHRES) BITPLANE POINTER (HI 5 BITS)
BPLHPTL = $1EE          ; (UHRES) BITPLANE POINTER (LO 15 BITS)
FMODE = $1FC            ; REGISTER

;-------------------------------------------------------------------------------
; structs

* AudChannel
ac_ptr = $00            ; ptr to start of waveform data
ac_len = $04            ; length of waveform in words
ac_per = $06            ; sample period
ac_vol = $08            ; volume
ac_dat = $0a            ; sample pair
ac_SIZEOF = $10

* SpriteDef
sd_pos = $00
sd_ctl = $02
sd_dataa = $04
sd_dataB = $06
sd_SIZEOF = $08


********************************************************************************
* DMA Bits
********************************************************************************

DMAB_SETCLR = 15
DMAB_AUD0 = 0
DMAB_AUD1 = 1
DMAB_AUD2 = 2
DMAB_AUD3 = 3
DMAB_DISK = 4
DMAB_SPRITE = 5
DMAB_BLITTER = 6
DMAB_COPPER = 7
DMAB_RASTER = 8
DMAB_MASTER = 9
DMAB_BLITHOG = 10
DMAB_BLTDONE = 14
DMAB_BLTNZERO = 13

DMAF_SETCLR = $8000
DMAF_AUDIO = $000f
DMAF_AUD0 = $0001
DMAF_AUD1 = $0002
DMAF_AUD2 = $0004
DMAF_AUD3 = $0008
DMAF_DISK = $0010
DMAF_SPRITE = $0020
DMAF_BLITTER = $0040
DMAF_COPPER = $0080
DMAF_RASTER = $0100
DMAF_MASTER = $0200
DMAF_BLITHOG = $0400
DMAF_ALL = $01ff
DMAF_BLTDONE = $4000
DMAF_BLTNZERO = $2000


********************************************************************************
* Int Bits
********************************************************************************

INTB_SETCLR = 15        ;Set/Clear control bit. Determines if bits
INTB_INTEN = 14         ;Master interrupt enable only
INTB_EXTER = 13         ;External interrupt
INTB_DSKSYNC = 12       ;Disk re-SYNChronized
INTB_RBF = 11           ;serial port Receive Buffer Full
INTB_AUD3 = 10          ;Audio channel 3 block finished
INTB_AUD2 = 9           ;Audio channel 2 block finished
INTB_AUD1 = 8           ;Audio channel 1 block finished
INTB_AUD0 = 7           ;Audio channel 0 block finished
INTB_BLIT = 6           ;Blitter finished
INTB_VERTB = 5          ;start of Vertical Blank
INTB_COPER = 4          ;Coprocessor
INTB_PORTS = 3          ;I/O Ports and timers
INTB_SOFTINT = 2        ;software interrupt request
INTB_DSKBLK = 1         ;Disk Block done
INTB_TBE = 0            ;serial port Transmit Buffer Empty

INTF_SETCLR = 1<<15
INTF_INTEN = 1<<14
INTF_EXTER = 1<<13
INTF_DSKSYNC = 1<<12
INTF_RBF = 1<<11
INTF_AUD3 = 1<<10
INTF_AUD2 = 1<<9
INTF_AUD1 = 1<<8
INTF_AUD0 = 1<<7
INTF_BLIT = 1<<6
INTF_VERTB = 1<<5
INTF_COPER = 1<<4
INTF_PORTS = 1<<3
INTF_SOFTINT = 1<<2
INTF_DSKBLK = 1<<1
INTF_TBE = 1<<0


********************************************************************************
* Blitter
********************************************************************************

;-------------------------------------------------------------------------------
; BLTCON0

; NDK

ABC = $80
ABNC = $40
ANBC = $20
ANBNC = $10
NABC = $8
NABNC = $4
NANBC = $2
NANBNC = $1

BC0B_DEST = 8
BC0B_SRCC = 9
BC0B_SRCB = 10
BC0B_SRCA = 11
BC0F_DEST = $100
BC0F_SRCC = $200
BC0F_SRCB = $400
BC0F_SRCA = $800

DEST = $100
SRCC = $200
SRCB = $400
SRCA = $800

ASHIFTSHIFT = 12        /* bits to right align ashift value */
BSHIFTSHIFT = 12        /* bits to right align bshift value */

; Kalms additional

BLTCON0B_ASH3 = 15
BLTCON0B_ASH2 = 14
BLTCON0B_ASH1 = 13
BLTCON0B_ASH0 = 12
BLTCON0B_USEA = 11
BLTCON0B_USEB = 10
BLTCON0B_USEC = 9
BLTCON0B_USED = 8
BLTCON0B_LF7 = 7
BLTCON0B_LF6 = 6
BLTCON0B_LF5 = 5
BLTCON0B_LF4 = 4
BLTCON0B_LF3 = 3
BLTCON0B_LF2 = 2
BLTCON0B_LF1 = 1
BLTCON0B_LF0 = 0

BLTCON0F_ASH3 = 1<<BLTCON0B_ASH3
BLTCON0F_ASH2 = 1<<BLTCON0B_ASH2
BLTCON0F_ASH1 = 1<<BLTCON0B_ASH1
BLTCON0F_ASH0 = 1<<BLTCON0B_ASH0
BLTCON0F_USEA = 1<<BLTCON0B_USEA
BLTCON0F_USEB = 1<<BLTCON0B_USEB
BLTCON0F_USEC = 1<<BLTCON0B_USEC
BLTCON0F_USED = 1<<BLTCON0B_USED
BLTCON0F_LF7 = 1<<BLTCON0B_LF7
BLTCON0F_LF6 = 1<<BLTCON0B_LF6
BLTCON0F_LF5 = 1<<BLTCON0B_LF5
BLTCON0F_LF4 = 1<<BLTCON0B_LF4
BLTCON0F_LF3 = 1<<BLTCON0B_LF3
BLTCON0F_LF2 = 1<<BLTCON0B_LF2
BLTCON0F_LF1 = 1<<BLTCON0B_LF1
BLTCON0F_LF0 = 1<<BLTCON0B_LF0


;-------------------------------------------------------------------------------
; BLTCON1

; NDK

BC1F_DESC = 2

LINEMODE = $1
FILL_OR = $8
FILL_XOR = $10
FILL_CARRYIN = $4
ONEDOT = $2
OVFLAG = $20
SIGNFLAG = $40
BLITREVERSE = $2

SUD = $10
SUL = $8
AUL = $4

OCTANT8 = 24
OCTANT7 = 4
OCTANT6 = 12
OCTANT5 = 28
OCTANT4 = 20
OCTANT3 = 8
OCTANT2 = 0
OCTANT1 = 16

; Kalms additional

BLTCON1B_BSH3 = 15
BLTCON1B_BSH2 = 14
BLTCON1B_BSH1 = 13
BLTCON1B_BSH0 = 12
; in Area mode
BLTCON1B_DOFF = 7
BLTCON1B_EFE = 4
BLTCON1B_IFE = 3
BLTCON1B_FCI = 2
BLTCON1B_DESC = 1
BLTCON1B_LINE = 0
; in Fill mode
BLTCON1B_DPFF = 7
BLTCON1B_SIGN = 6
BLTCON1B_OVF = 5
BLTCON1B_SUD = 4
BLTCON1B_SUL = 3
BLTCON1B_AUL = 2
BLTCON1B_SING = 1
;BLTCON1B_LINE	=	0

BLTCON1F_BSH3 = 1<<BLTCON1B_BSH3
BLTCON1F_BSH2 = 1<<BLTCON1B_BSH2
BLTCON1F_BSH1 = 1<<BLTCON1B_BSH1
BLTCON1F_BSH0 = 1<<BLTCON1B_BSH0
; in Area mode
BLTCON1F_DOFF = 1<<BLTCON1B_DOFF
BLTCON1F_EFE = 1<<BLTCON1B_EFE
BLTCON1F_IFE = 1<<BLTCON1B_IFE
BLTCON1F_FCI = 1<<BLTCON1B_FCI
BLTCON1F_DESC = 1<<BLTCON1B_DESC
BLTCON1F_LINE = 1<<BLTCON1B_LINE
; in Fill mode
BLTCON1F_DPFF = 1<<BLTCON1B_DPFF
BLTCON1F_SIGN = 1<<BLTCON1B_SIGN
BLTCON1F_OVF = 1<<BLTCON1B_OVF
BLTCON1F_SUD = 1<<BLTCON1B_SUD
BLTCON1F_SUL = 1<<BLTCON1B_SUL
BLTCON1F_AUL = 1<<BLTCON1B_AUL
BLTCON1F_SING = 1<<BLTCON1B_SING
;BLTCON1F_LINE	=	1<<BLTCON1B_LINE

;-------------------------------------------------------------------------------
; Minterm bits
; http://eab.abime.net/showthread.php?t=76068
;
; Example use for A XOR B
; move.w	#$0d3c,bltcon0(a6)
; move.w	#BLTEN_ABD+(BLT_A^BLT_B),bltcon0(a6)

BLTEN_AD = (SRCA|DEST)
BLTEN_ABD = (SRCA|SRCB|DEST)
BLTEN_ACD = (SRCA|SRCC|DEST)
BLTEN_BCD = (SRCB|SRCC|DEST)
BLTEN_ABCD = (SRCA|SRCB|SRCC|DEST)

BLT_A = %11110000
BLT_B = %11001100
BLT_C = %10101010


********************************************************************************
* ADK
********************************************************************************

; bit definitions for adkcon register

ADKB_SETCLR = 15        ; standard set/clear bit
ADKB_PRECOMP1 = 14      ; two bits of precompensation
ADKB_PRECOMP0 = 13
ADKB_MFMPREC = 12       ; use mfm style precompensation
ADKB_UARTBRK = 11       ; force uart output to zero
ADKB_WORDSYNC = 10      ; enable DSKSYNC register matching
ADKB_MSBSYNC = 9        ; (Apple GCR Only) sync on MSB for reading
ADKB_FAST = 8           ; 1 -> 2 us/bit (mfm), 2 -> 4 us/bit (gcr)
ADKB_USE3PN = 7         ; use aud chan 3 to modulate period of ??
ADKB_USE2P3 = 6         ; use aud chan 2 to modulate period of 3
ADKB_USE1P2 = 5         ; use aud chan 1 to modulate period of 2
ADKB_USE0P1 = 4         ; use aud chan 0 to modulate period of 1
ADKB_USE3VN = 3         ; use aud chan 3 to modulate volume of ??
ADKB_USE2V3 = 2         ; use aud chan 2 to modulate volume of 3
ADKB_USE1V2 = 1         ; use aud chan 1 to modulate volume of 2
ADKB_USE0V1 = 0         ; use aud chan 0 to modulate volume of 1

ADKF_SETCLR = (1<<15)
ADKF_PRECOMP1 = (1<<14)
ADKF_PRECOMP0 = (1<<13)
ADKF_MFMPREC = (1<<12)
ADKF_UARTBRK = (1<<11)
ADKF_WORDSYNC = (1<<10)
ADKF_MSBSYNC = (1<<9)
ADKF_FAST = (1<<8)
ADKF_USE3PN = (1<<7)
ADKF_USE2P3 = (1<<6)
ADKF_USE1P2 = (1<<5)
ADKF_USE0P1 = (1<<4)
ADKF_USE3VN = (1<<3)
ADKF_USE2V3 = (1<<2)
ADKF_USE1V2 = (1<<1)
ADKF_USE0V1 = (1<<0)

ADKF_PRE000NS = 0       ; 000 ns of precomp
ADKF_PRE140NS = (ADKF_PRECOMP0) ; 140 ns of precomp
ADKF_PRE280NS = (ADKF_PRECOMP1) ; 280 ns of precomp
ADKF_PRE560NS = (ADKF_PRECOMP0!ADKF_PRECOMP1) ; 560 ns of precomp


********************************************************************************
* CIA
********************************************************************************

* cia register offsets
ciapra = $0000
ciaprb = $0100
ciaddra = $0200
ciaddrb = $0300
ciatalo = $0400
ciatahi = $0500
ciatblo = $0600
ciatbhi = $0700
ciatodlow = $0800
ciatodmid = $0900
ciatodhi = $0a00
ciasdr = $0c00
ciaicr = $0d00
ciacra = $0e00
ciacrb = $0f00

* interrupt control register bit numbers
CIAICRB_TA = 0
CIAICRB_TB = 1
CIAICRB_ALRM = 2
CIAICRB_SP = 3
CIAICRB_FLG = 4
CIAICRB_IR = 7
CIAICRB_SETCLR = 7

* control register A bit numbers
CIACRAB_START = 0
CIACRAB_PBON = 1
CIACRAB_OUTMODE = 2
CIACRAB_RUNMODE = 3
CIACRAB_LOAD = 4
CIACRAB_INMODE = 5
CIACRAB_SPMODE = 6
CIACRAB_TODIN = 7

* control register B bit numbers
CIACRBB_START = 0
CIACRBB_PBON = 1
CIACRBB_OUTMODE = 2
CIACRBB_RUNMODE = 3
CIACRBB_LOAD = 4
CIACRBB_INMODE0 = 5
CIACRBB_INMODE1 = 6
CIACRBB_ALARM = 7

* interrupt control register bit masks
CIAICRF_TA = (1<<0)
CIAICRF_TB = (1<<1)
CIAICRF_ALRM = (1<<2)
CIAICRF_SP = (1<<3)
CIAICRF_FLG = (1<<4)
CIAICRF_IR = (1<<7)
CIAICRF_SETCLR = (1<<7)

* control register A bit masks
CIACRAF_START = (1<<0)
CIACRAF_PBON = (1<<1)
CIACRAF_OUTMODE = (1<<2)
CIACRAF_RUNMODE = (1<<3)
CIACRAF_LOAD = (1<<4)
CIACRAF_INMODE = (1<<5)
CIACRAF_SPMODE = (1<<6)
CIACRAF_TODIN = (1<<7)

* control register B bit masks
CIACRBF_START = (1<<0)
CIACRBF_PBON = (1<<1)
CIACRBF_OUTMODE = (1<<2)
CIACRBF_RUNMODE = (1<<3)
CIACRBF_LOAD = (1<<4)
CIACRBF_INMODE0 = (1<<5)
CIACRBF_INMODE1 = (1<<6)
CIACRBF_ALARM = (1<<7)

* control register B INMODE masks
CIACRBF_IN_PHI2 = 0
CIACRBF_IN_CNT = (CIACRBF_INMODE0)
CIACRBF_IN_TA = (CIACRBF_INMODE1)
CIACRBF_IN_CNT_TA = (CIACRBF_INMODE0!CIACRBF_INMODE1)

*:
* Port definitions -- what each bit in a cia peripheral register is tied to
*:

* ciaa port A (0xbfe001)
CIAB_GAMEPORT1 = (7)    * gameport 1, pin 6 (fire button*)
CIAB_GAMEPORT0 = (6)    * gameport 0, pin 6 (fire button*)
CIAB_DSKRDY = (5)       * disk ready*
CIAB_DSKTRACK0 = (4)    * disk on track 00*
CIAB_DSKPROT = (3)      * disk write protect*
CIAB_DSKCHANGE = (2)    * disk change*
CIAB_LED = (1)          * led light control (0==>bright)
CIAB_OVERLAY = (0)      * memory overlay bit

* ciaa port B (0xbfe101) -- parallel port

* ciab port A (0xbfd000) -- serial and printer control
CIAB_COMDTR = (7)       * serial Data Terminal Ready*
CIAB_COMRTS = (6)       * serial Request to Send*
CIAB_COMCD = (5)        * serial Carrier Detect*
CIAB_COMCTS = (4)       * serial Clear to Send*
CIAB_COMDSR = (3)       * serial Data Set Ready*
CIAB_PRTRSEL = (2)      * printer SELECT
CIAB_PRTRPOUT = (1)     * printer paper out
CIAB_PRTRBUSY = (0)     * printer busy

* ciab port B (0xbfd100) -- disk control
CIAB_DSKMOTOR = (7)     * disk motorr*
CIAB_DSKSEL3 = (6)      * disk select unit 3*
CIAB_DSKSEL2 = (5)      * disk select unit 2*
CIAB_DSKSEL1 = (4)      * disk select unit 1*
CIAB_DSKSEL0 = (3)      * disk select unit 0*
CIAB_DSKSIDE = (2)      * disk side select*
CIAB_DSKDIREC = (1)     * disk direction of seek*
CIAB_DSKSTEP = (0)      * disk step heads*

* ciaa port A (0xbfe001)
CIAF_GAMEPORT1 = (1<<7)
CIAF_GAMEPORT0 = (1<<6)
CIAF_DSKRDY = (1<<5)
CIAF_DSKTRACK0 = (1<<4)
CIAF_DSKPROT = (1<<3)
CIAF_DSKCHANGE = (1<<2)
CIAF_LED = (1<<1)
CIAF_OVERLAY = (1<<0)

* ciaa port B (0xbfe101) -- parallel port

* ciab port A (0xbfd000) -- serial and printer control
CIAF_COMDTR = (1<<7)
CIAF_COMRTS = (1<<6)
CIAF_COMCD = (1<<5)
CIAF_COMCTS = (1<<4)
CIAF_COMDSR = (1<<3)
CIAF_PRTRSEL = (1<<2)
CIAF_PRTRPOUT = (1<<1)
CIAF_PRTRBUSY = (1<<0)

* ciab port B (0xbfd100) -- disk control
CIAF_DSKMOTOR = (1<<7)
CIAF_DSKSEL3 = (1<<6)
CIAF_DSKSEL2 = (1<<5)
CIAF_DSKSEL1 = (1<<4)
CIAF_DSKSEL0 = (1<<3)
CIAF_DSKSIDE = (1<<2)
CIAF_DSKDIREC = (1<<1)
CIAF_DSKSTEP = (1<<0)

        endc