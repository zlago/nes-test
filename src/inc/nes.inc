; - 
; - nes i/o definitions and constants
; - written by zlago
; - etc etc
; - 

; = PPU registers =

; various PPU control bits
PPUCTRL = $2000
CTRLF_NAMETABLE  = %00000011 ; nametable select mask
CTRLF_X          = %00000001 ; adds +256 to X scroll
CTRLF_Y          = %00000010 ; adds +240 to Y scroll
CTRLF_INC1       = %00000000 ; sets PPUDATA to increment 1 mode
CTRLF_INC32      = %00000100 ; sets PPUDATA to increment 32 mode
CTRLF_SPR_TABLE0 = %00000000 ; selects $0000 for SPR tiles
CTRLF_SPR_TABLE1 = %00001000 ; selects $1000 for SPR tiles
CTRLF_BG_TABLE0  = %00000000 ; selects $0000 for BG tiles
CTRLF_BG_TABLE1  = %00010000 ; selects $1000 for BG tiles
CTRLF_SPR_SIZE8  = %00000000 ; makes sprites short
CTRLF_SPR_SIZE16 = %00100000 ; makes sprites tall
CTRLF_NMI        = %10000000 ; enables NMI

; BG/SPR enable, tint, monochrome
PPUMASK = $2001
MASKF_MONO       = %00000001 ; enables monochrome
MASKF_BG_NOCLIP  = %00000000 ; disables background clipping
MASKF_BG_CLIP    = %00000010 ; clips leftmost 8 background pixels
MASKF_SPR_NOCLIP = %00000000 ; disables sprite clipping
MASKF_SPR_CLIP   = %00000100 ; clips leftmost 8 sprite pixels
MASKF_BG_OFF     = %00000000 ; disables background
MASKF_BG_ON      = %00001000 ; enables background
MASKF_SPR_OFF    = %00000000 ; disables sprites
MASKF_SPR_ON     = %00010000 ; enables sprites
MASKF_R          = %00100000 ; tints red
MASKF_G          = %01000000 ; tints green
MASKF_B          = %10000000 ; tints blue

; status, how do i say it..
PPUSTATUS = $2002
STATUSF_OVERFLOW = %00100000 ; the unreliable sprite overflow flag (see docs)
STATUSF_SPRITE0  = %01000000 ; sprite 0 hit occured
STATUSF_VBLANK   = %10000000 ; VBlank occured

; object attribute memory regs
OAMADDR = $2003
OAMDATA = $2004
; Y, tile, attr, X

; scroll reg
PPUSCROLL = $2005

; VRAM access regs
PPUADDR = $2006
PPUDATA = $2007
PPU_TABLE0     = $0000 ; character table 0
PPU_TABLE1     = $1000 ; character table 1
PPU_NAMETABLE0 = $2000 ; nametable 0
PPU_NAMETABLE1 = $2400 ; nametable 1
PPU_NAMETABLE2 = $2800 ; nametable 2
PPU_NAMETABLE3 = $2c00 ; nametable 3
PPU_PAL        = $3f00 ; palette RAM

; = APU registers =

; square waves
SQ1_VOL   = $4000 ; duty, length enable and volume
SQ1_SWEEP = $4001 ; freq sweep
SQ1_LO    = $4002 ; timer low
SQ1_HI    = $4003 ; length counter, timer high
SQ2_VOL   = $4004 ; duty, length enable and volume
SQ2_SWEEP = $4005 ; freq sweep
SQ2_LO    = $4006 ; timer low
SQ2_HI    = $4007 ; length counter, timer high

; triangle
TRI_LINEAR = $4008 ; length enable, linear counter
TRI_LO     = $400a ; timer low
TRI_HI     = $400b ; length counter, timer high

; noise
NOISE_VOL = $400c ; length enable, volume
NOISE_LO  = $400e ; mode, noise period
NOISE_HI  = $400f ; length counter

; dmc
DMC_FREQ  = $4010 ; IRQ enable, loop, frequency
DMC_RAW   = $4011 ; current 7 bit PCM output
DMC_START = $4012 ; (sample address+$c000)/64
DMC_LEN   = $4013 ; (sample length/16)+1

; channel enable
SND_CHN = $4015
CHNF_SQ1       =    %00001 ; square 1 enable
CHNF_SQ2       =    %00010 ; square 2 enable
CHNF_TRI       =    %00100 ; triangle enable
CHNF_NOISE     =    %01000 ; noise    enable
CHNF_DMC       =    %10000 ; dmc     restart
CHNF_FRAME_IRQ = %01000000 ; frame counter irq
CHNF_DMC_IRQ   = %10000000 ; dmc irq

; = DMA register =
OAM_DMA = $4014

; = external I/O registers =
JOY1 = $4016
JOY2 = $4017

; standard controller
JOY_A      = %10000000
JOY_B      = %01000000
JOY_SELECT = %00100000
JOY_START  = %00010000
JOY_UP     = %00001000
JOY_DOWN   = %00000100
JOY_LEFT   = %00000010
JOY_RIGHT  = %00000001

; SNES controller
SNES_B = %10000000
SNES_Y = %01000000

SNES_A = %10000000
SNES_X = %01000000
SNES_L = %00100000
SNES_R = %00010000