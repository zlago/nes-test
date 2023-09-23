; - 
; - nes i/o definitions and constants
; - written by zlago
; - etc etc
; - 

; = misc CPU stuff =

; bit test flag positions, for ASSERTs i guess
BIT_N = %10000000
BIT_V = %01000000

; vectors
VECTOR_NMI   = $fffa
VECTOR_RESET = $fffc
VECTOR_IRQ   = $fffe
VECTOR_BRK   = $fffe

; flags in P
FLAGF_C = %00000001
FLAGF_Z = %00000010
FLAGF_I = %00000100
FLAGF_D = %00001000
FLAGF_B = %00010000
FLAGF_V = %01000000
FLAGF_N = %10000000
FLAGF_CARRY    = %00000001
FLAGF_ZERO     = %00000010
FLAGF_IRQ      = %00000100
FLAGF_INTERRUPT= %00000100
FLAGF_DECIMAL  = %00001000
FLAGF_BREAK    = %00010000
FLAGF_OVERFLOW = %01000000
FLAGF_NEGATIVE = %10000000

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
	; OAM bytes
	OAM_Y    = 0 ; Y position + 1
	OAM_TILE = 1 ; sprite tile, in 8x16 bit 0 selects the pattern table
	OAM_ATTR = 2 ; sprite attributes
		; OAM attributes
		OAM_ATTR_PAL      = %00000011 ; SPR palette mask
		OAM_ATTR_PRIORITY = %00100000 ; SPR priority, 1 is behind BG
		OAM_ATTR_FLIP_X   = %01000000 ; SPR horizontal flip
		OAM_ATTR_FLIP_Y   = %10000000 ; SPR vertical flip
	OAM_X    = 3 ; X position
	OAM_SIZE = 4 ; this name could change at any time

; scroll reg
PPUSCROLL = $2005 ; X first

; VRAM access regs
PPUADDR = $2006 ; MSB first
PPUDATA = $2007
	; PPU memory map
	PPU_CHR  = $0000 ; character tables
		PPU_CHR0  = $0000 ; character table 0
		PPU_CHR1  = $1000 ; character table 1
	PPU_NAME = $2000 ; nametables
		PPU_NAME0 = $2000 ; nametable 0
		PPU_NAME1 = $2400 ; nametable 1
		PPU_NAME2 = $2800 ; nametable 2
		PPU_NAME3 = $2c00 ; nametable 3
		PPU_ATTR0 = $23c0 ; attribute table 0
		PPU_ATTR1 = $27c0 ; attribute table 1
		PPU_ATTR2 = $2bc0 ; attribute table 2
		PPU_ATTR3 = $2fc0 ; attribute table 3
	PPU_PAL  = $3f00 ; palette RAM
		PPU_PAL_BG  = $3f00 ; BG palettes, 3f00 is the universal bg color
			PPU_PAL_BG_0 = $3f00 ; BG palette 0
			PPU_PAL_BG_1 = $3f04 ; BG palette 1
			PPU_PAL_BG_2 = $3f08 ; BG palette 2
			PPU_PAL_BG_3 = $3f0c ; BG palette 3
		PPU_PAL_SPR = $3f10 ; SPR palettes
			PPU_PAL_SPR_0 = $3f10 ; SPR palette 0
			PPU_PAL_SPR_1 = $3f14 ; SPR palette 1
			PPU_PAL_SPR_2 = $3f18 ; SPR palette 2
			PPU_PAL_SPR_3 = $3f1c ; SPR palette 3

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

; APU frame counter
APU_FRAME = $4017 ; i have no idea what the hell a frame counter even is
FRAMEF_IRQ  = %01000000 ; suspends IRQs, you can rename it to FRAMEF_IRQ_SUS if you think thats a clearer name :3
FRAMEF_MODE = %10000000 ; id keep this clear

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
