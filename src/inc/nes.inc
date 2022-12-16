; $2000 (PPU) registers

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

; scroll reg
PPUSCROLL = $2005

; VRAM access regs
PPUADDR = $2006
PPUDATA = $2007

; $4000 (APU, DMA, JOY) registers
SQ1_VOL   = $4000
SQ1_SWEEP = $4001
SQ1_LO    = $4002
SQ1_HI    = $4003
SQ2_VOL   = $4004
SQ2_SWEEP = $4005
SQ2_LO    = $4006
SQ2_HI    = $4007
TRI_LINEAR = $4008
TRI_LO     = $400a
TRI_HI     = $400b
NOISE_VOL = $400c
NOISE_LO  = $400e
NOISE_HI  = $400f
DMC_FREQ  = $4010
DMC_RAW   = $4011
DMC_START = $4012
DMC_LEN   = $4013
OAM_DMA = $4014
SND_CHN = $4015
JOY1 = $4016
JOY2 = $4017

; controller constants
JOY_A      = %10000000
JOY_B      = %01000000
JOY_SELECT = %00100000
JOY_START  = %00010000
JOY_UP     = %00001000
JOY_DOWN   = %00000100
JOY_LEFT   = %00000010
JOY_RIGHT  = %00000001