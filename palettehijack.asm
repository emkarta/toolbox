;SMALL LATE DEV STUFF:
;Knight palettes in BG
;Scarfy malicious color change

;BANKS
;0 - Main game code, actual stage OAM
;1 - Secondary game code
;7 - Intro/title/below sink/scores graphics & graphics code
;8 - BG Tilemap stuff
;B - Sprite/OAM stuff (for Intro/Title, Hub/Bonus, some of the actual stage stuff)
;E - DX version color code, contains nothing in vanilla

;NOTES
;PALETTE CHANGE EFFECTS TO FIX: Kracko's boss arena, Dedede's intro
;0:0D05-0:0D19 - Graphics bank array?
;0:310E - Load tilemap start?
;0:C0D6 - Start of tilemap buffer?
;To load new stage palettes: hijack PrepareScene/0:3306 to include a call to the palette loader

;SCENES
;0 - Intro/title/below sink/scores
;1 - Hub world
;2 - Wispy
;3 - Kracko
;4 - Poppy

;TILEMAPS
;7:4000 - Intro sprites
;8:4908 - Title Graphics
;8:48E3 - Title Graphics lower
;8:49DD - Intro Scene
;8:408A - Hub area
;8:443F - Below the sink
;8:53F1 - High scores
;8:4516 - Wispy 1
;8:47BF - Wispy 1/2
;8:4850 - Wispy 2
;8:46A6 - Wispy 2/3
;8:4721 - Wispy 3
;8:43C1 - Wispy Bonus
;8:4616 - Wispy Boss
;8:4C7E - Kracko 1
;8:4D08 - Kracko 1/2
;8:4D8A - Kracko 2
;8:4B20 - Kracko 2/3
;8:4BA0 - Kracko 3
;8:423C - Kracko Bonus
;8:4AB4 - Kracko Boss
;8:5114 - Poppy 1
;8:4F7D - Poppy 1/2
;8:5005 - Poppy 2
;8:4EB5 - Poppy 2/3
;8:4F2E - Poppy 3
;8:42F0 - Poppy Bonus
;8:4E78 - Poppy Boss
;--------
;8:52E2 - Save Screen
;8:525E - Save Screen

INCLUDE "oamstuff.asm"

;OAM_ENTRY_END 		EQU $80

INDEX_BASE			EQU $C0  ;Palette register becomes this before loading in a new set
INDEX_BASE_KRACKO 	EQU $02  ;Or, if it's the Kracko fight, the one for the BG becomes this
NUM_INDICES 		EQU $40  ;Number of bytes per stack of palettes

SECTION "Target System",ROM0[$0143]
	db $C0

SECTION "Initial Palette Hijack",ROM0[$03DD]
	ld a, $0E
	ld [$2100], a
	jp LoadPalettes
AfterLoaded::
	ld [$2100], a
	xor a

SECTION "Congrats Screen Colormap Load Hijack",ROM0[$07AF]
	ld a, $0E
	ld [$2100], a
	ld a, 2
	call Update9C00Colors
	ld a, 1
	ld [$2100], a
	;Pad out something already called in Bank E
	nop
	
SECTION "Save Screen Colormap Load Hijack",ROM0[$0840]
	ld a, $0E
	ld [$2100], a
	ld a, 1
	call Update9C00Colors
	ld a, 1
	ld [$2100], a
	;Pad out something already called in Bank E
	nop

	
SECTION "Tilemap Palette Hijack",ROM0[$0A11]
	ld a, $0E
	call $1227  ;Switch bank to $0E
	jp UpdateTilemapColors

AfterColors::
	ld a, 1
	call $1227
	jp $0A30
	
SECTION "Stage Palette Update Hijack",ROM0[$0A3D]
	ld a, $0E
	call $1227  ;Switch bank to $0E
	jp UpdateBGPalettes


SECTION "Post Load Tiles Hijack",ROM0[$0E82]
	ld a, $0E
	ld [$2100], a  ;Switch bank to $0E
	jp UpdatePostLoadColors
AfterPLColorsDone::
	ld [$2100], a
	xor a

SECTION "Tilemap Palette Hijack Intro",ROM0[$34A9]
	ld a, $0E
	call $1227  ;Switch bank to $0E
	jp UpdateIntroTilemapColors

AfterIntroColors::
	ld a, 1
	call $1227
	jp $34C5
	
SECTION "Dedede Fight 9C00 Hijack",ROM0[$34F6]
	ld a, $0E
	ld [$2100], a  ;Switch bank to $0E
	jp UpdateDededeSceneColors
AfterDededeColors::
	ld a, 1
	ld [$2100], a
	nop
	nop
	nop
	nop
	
SECTION "Kracko Stage Dead Cloud Fix",ROMX[$7DE2],BANK[1]
	db $B0, $B0, $B0, $B0, $B0, $B0
	
SECTION "Kracko Fight BG Flash",ROMX[$4110],BANK[2]
	ld a, $55
	jr z, UpdateKrackoBGPal
	ld a, $DC
UpdateKrackoBGPal::
	ld [$FF69], a
	
SECTION "Dedede Palette Cycle Hijack",ROMX[$4D24],BANK[2]
	ld hl, $C43D
	inc [hl]
	jp DededePaletteCycle
	
SECTION "Dedede Palette Cycler",ROMX[$7FA6],BANK[2]
DededePaletteCycle::
	ld a, [hl]  ;Get Dedede palette cycle index
	sub $8B  ;Index of first Dedede palette state after the opening shadow
	add a, a
	ld hl, DededePalettePointers
	push bc
	ld b, 0
	ld c, a
	add hl, bc
	ldi a, [hl]
	ld b, [hl]
	ld h, b
	ld l, a
	ld b, 0
	ld c, 6
	ld a, INDEX_BASE + 10
	ld [$FF6A], a  ;Prepare OBP register to handle changes
.stat_check
	ld a, [$FF41]
	and a, 3
	cp a, 2
	jr nc, .stat_check
.load_dedede_palette_byte
	ldi a, [hl]
	ld [$FF6B], a
	dec c
	ld a, 0
	cp c
	jr nz, .stat_check
	
	pop bc
	jp $4CC5


	
DededePalettePointers::
	dw DededePalette0
	dw DededePalette1
	dw DededePalette2
	dw DededePalette3
	dw DededePalette4
	dw DededePalette3
	dw DededePalette2

DededePalette0::
	dw $2108, $0807, $0000
	
DededePalette1::
	dw $3DEF, $0C0F, $0000
	;dw $5AD6, $0C17, $0000
	
DededePalette2::
	dw $7FFF, $0C1F, $0000
	
DededePalette3::
	dw $7FFF, $46BF, $5AD6
	;dw $7FFF, $313F, $3DEF
	
DededePalette4::
	dw $7FFF, $7FFF, $0BFF

;=======================================
;PALETTE RELATED CODE/DATA
;=======================================

SECTION "Load Palettes",ROMX[$4000],BANK[$0E]
LoadPalettes::
	ld a, INDEX_BASE
	ld [$FF68], a  ;Prepare BGP register to handle changes
	ld [$FF6A], a  ;Prepare OBP register to handle changes
	ld c, NUM_INDICES
	ld hl, BGPals
LoadBGPals::
	ldi a, [hl]
	ld [$FF69], a
	dec c
	ld a, c
	cp 0  ;Check if all palette indices have been cycled through
	jp nz, LoadBGPals
	ld hl, OBPals
	ld c, NUM_INDICES
LoadOBPals::
	ldi a, [hl]
	ld [$FF6B], a
	dec c
	ld a, c
	cp 0  ;Check if all palette indices have been cycled through
	jp nz, LoadOBPals
	ld a, 1  ;Prepare for bankswitch back to Bank 1
	jp AfterLoaded
BGPals::
	dw $FFFF, $1F62, $1F0C, $0000
	dw $FFFF, $1F62, $1F0C, $0000
	dw $FFFF, $1F62, $1F0C, $0000
	dw $FFFF, $1F62, $1F0C, $0000
	dw $FFFF, $1F62, $1F0C, $0000
	dw $FFFF, $1F62, $1F0C, $0000
	dw $FFFF, $1F62, $1F0C, $0000
	dw $FFFF, $1F62, $1F0C, $0000
OBPals::
	dw $FFFF, $621F, $0C1F, $0000
	dw $FFFF, $7FFF, $0C1F, $0000
	dw $FFFF, $7FFF, $7F50, $0000
	dw $FFFF, $03BD, $02F9, $0000
	dw $FFFF, $031F, $019F, $0000
	dw $FFFF, $01B5, $00ED, $0000
	dw $FFFF, $0360, $0220, $0000
	dw $FFFF, $5294, $2D6B, $0000
	
;OLD:
;	dw $FFFF, $023F, $0159, $0000
;	019F
;	3B1F
;	233F
	
UpdateBGPalettes::
	ld a, INDEX_BASE
	ld [$FF68], a  ;Prepare BGP register to handle changes
	ld hl, BGPalPointerArray
	ld a, [$C0CD]  ;Get ID of current stage
	ld c, a
	add a, c  ;Double the ID we just got
	ld c, a
	ld b, 0
	add hl, bc  ;Now make hl point ot the index of the desired palette
	ld a, [$C0CD]  ;Get ID of current stage
	ldi a, [hl]  ;Grab lower digit of palette pointer
	ld b, [hl]  ;Grab upper digit of palette pointer
	ld c, a  ;Load lower into c, so now bc is the palette pointer
	ld h, b  ;Now get this pointer into hl, one by one
	ld l, c
	ld c, NUM_INDICES
.load_the_pals
	ldi a, [hl]
	ld [$FF69], a
	dec c
	ld a, c
	cp 0  ;Check if all palette indices have been cycled through
	jp nz, .load_the_pals
	xor a  ;Next 4 lines are code from Bank 0 moved down here to make room for the jump to this bank
	ld [$FFB7], a
	ld [$C443], a
	ld [$C445], a
.check_if_dedede_fight
	;Dedede's stage is 5
	ld a, [$C0CD]  ;Get ID of current stage
	cp 5
	jr nz, .check_if_kracko_fight
	ld a, INDEX_BASE + 10
	ld [$FF6A], a
	ld a, 0
	ld [$FF6B], a
	ld [$FF6B], a
	ld [$FF6B], a
	ld [$FF6B], a
	ld [$FF6B], a
	ld [$FF6B], a
	jr ReturnToBank1

.check_if_kracko_fight
	;Kracko's boss fight is Stage 3, Scene 0. If neither of these reqs are met, this segment will be skipped.
	ld a, [$C0CD]  ;Get ID of current stage
	cp 3
	jr nz, ReturnToBank1
	ld a, [$FFCD]  ;Get current scene
	cp 0
	jr nz, ReturnToBank1
	;If we reached here, we are in the Kracko fight and will now update the palette registers to accomodate for the BG flashing.
	ld a, INDEX_BASE_KRACKO + $C2
	ld [$FF68], a
	ld a, $55
	ld [$FF69], a
	ld a, $7F
	ld [$FF69], a
	ld a, INDEX_BASE_KRACKO
	ld [$FF68], a

ReturnToBank1::
	ld a, 1  ;Prepare for bankswitch back to Bank 1
	jp $1227
	
UpdateTilemapColors::
	ld hl, $0DB0  ;Load array of tilemap VRAM destinations
	ld a, [$FFCD]  ;Load value indicating current scene (?)
	rst 00  ;Parse the array
	ld de, $C0D6  ;Load start of tilemap buffer
	ld bc, $1214  ;Load height and width of tilemap space
.load_buffer_tile
	ld a, [de]
	ld [hl], a
	ld a, 1  ;Prepare for VRAM bank switch
	ld [$FF4F], a  ;Switch to VRAM bank 1
	
	push hl
	ld hl, TilesetColorPointerArray
	push bc
	ld bc, $0010  ;Double of 8, which is the amount of BG tilesets per stage (except the Dedede fight, which has only 2)
	ld a, [$C0CD]  ;Get current stage
	cp 0
	jr z, .stage_is_zero
.stage_is_not_zero
	add hl, bc
	dec a
	cp 0
	jr nz, .stage_is_not_zero
.stage_is_zero
	ld b, 0
	ld a, [$FFCD]  ;Get current scene
	ld c, a
	add a, c  ;Double the scene value since each pointer is 2 bytes
	ld c, a
	add hl, bc  ;Now hl points to the start of the desired colormap
	ldi a, [hl]  ;Load lower byte of colormap offset
	ld c, a
	ld a, [hl]  ;Load higher byte of colormap offset
	ld b, a
	ld h, b
	ld l, c
	pop bc
	ld a, [de]  ;Load index of current tile
	push de
	ld d, 0
	ld e, a
	add hl, de  ;Make hl point to desired palette value
	ld a, [hl]  ;Get said palette value
	pop de
	pop hl
	ldi [hl], a  ;Now give the tile index its color on-screen
	inc de
	
	ld a, 0
	ld [$FF4F], a  ;Now switch back to VRAM bank 0
	dec c
	jr nz, .load_buffer_tile
	push de
	ld de, $000C
	add hl, de
	res 2,h
	pop de
	ld c, $14
	dec b
	jr nz, .load_buffer_tile
	jp AfterColors

UpdateIntroTilemapColors::
	ld hl, $9A40
	ld de, $C0D6
	ld bc, $0E14
.load_intro_buffer_tile
	ld a, [de]
	ld [hl], a
	
	ld a, 1  ;Prepare for VRAM bank switch
	ld [$FF4F], a  ;Switch to VRAM bank 1
	push hl
	ld hl, TilesetColorIntroTitle
	ld a, [de]
	push de
	ld d, 0
	ld e, a
	add hl, de  ;Make hl point to desired palette value
	ld a, [hl]
	pop de
	pop hl
	ldi [hl], a
	inc de
	ld a, 0
	ld [$FF4F], a  ;Now switch back to VRAM bank 0
	dec c
	jr nz, .load_intro_buffer_tile
	push de
	ld de, $000C
	add hl, de
	res 2,h
	pop de
	ld c, $14
	dec b
	jr nz, .load_intro_buffer_tile
	jp AfterIntroColors


UpdatePostLoadColors::
	ld a, [de]
	ld [hl], a
	ld a, 1  ;Prepare for VRAM bank switch
	ld [$FF4F], a  ;Switch to VRAM bank 1
	push hl
	ld hl, TilesetColorPointerArray
	push bc
	ld bc, $0010  ;Double of 8, which is the amount of BG tilesets per stage (except the Dedede fight, which has only 2)
	ld a, [$C0CD]  ;Get current stage
	cp 0
	jr z, .stage_is_zero
.stage_is_not_zero
	add hl, bc
	dec a
	cp 0
	jr nz, .stage_is_not_zero
.stage_is_zero
	ld b, 0
	ld a, [$FFCD]  ;Get current scene
	ld c, a
	add a, c  ;Double the scene value since each pointer is 2 bytes
	ld c, a
	add hl, bc  ;Now hl points to the start of the desired colormap
	ldi a, [hl]  ;Load lower byte of colormap offset
	ld c, a
	ld a, [hl]  ;Load higher byte of colormap offset
	ld b, a
	ld h, b
	ld l, c
	pop bc
	ld a, [de]  ;Load index of current tile
	push de
	ld d, 0
	ld e, a
	add hl, de  ;Make hl point to desired palette value
	
.stat_check  ;There were issues with palettes not updating on some HUD tiles so extra STAT check here
	ld a, [$FF41]
	and a, 3
	cp a, 2
	jr nc, .stat_check
	
	ld a, [hl]  ;Get said palette value
	pop de
	pop hl
	ldi [hl], a  ;Now give the tile index its color on-screen
	
	ld a, 0
	ld [$FF4F], a  ;Now switch back to VRAM bank 0
	
	bit 7,c 
	jr z, .return_to_og
	push bc
	ld bc, $001F
	add hl, bc
	pop bc
.return_to_og
	ld a, 1
	jp AfterPLColorsDone

Update9C00Colors::
	ld b, a
	;Timer control stuff
	xor a
	ld [$FF07], a
	
	push hl
	push de
	ld hl, BGPalSave
	ld a, b
	cp 2
	jr nz, .prepare_pal_count
	ld hl, BGPalCongrats
.prepare_pal_count
	ld c, 64
	ld a, INDEX_BASE
	ld [$FF68], a
.add_9C00_pal_byte
	ldi a, [hl]
	ld [$FF69], a
	dec c
	jr nz, .add_9C00_pal_byte
	
	ld a, b
	ld hl, $9C00
	ld de, TilesetColorBlank
	cp 1
	jr nz, .prep_for_color_load
	ld de, TilesetColorSave
	cp 2
	jr nz, .prep_for_color_load
	ld de, TilesetColorBlank
.prep_for_color_load
	ld bc, $1214
	
	
.load_9C00_tile
	ld a, [hl]
	push af
	ld a, 1  ;Prepare for VRAM bank switch
	ld [$FF4F], a  ;Switch to VRAM bank 1
	pop af
	push hl
	ld h, d
	ld l, e
	push de
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hl]
	pop de
	pop hl
	ldi [hl], a
	
	xor a
	ld [$FF4F], a  ;Now switch back to VRAM bank 0
	dec c
	jr nz, .load_9C00_tile
	push de
	ld de, $000C
	add hl, de
	;res 2,h
	pop de
	ld c, $14
	dec b
	jr nz, .load_9C00_tile	

	.bank0_stuff
	xor a
	ld [$FFB8], a
	ld [$FF42], a
	ld [$FFB7], a
	ld [$C443], a
	ld [$C445], a
	ld [$C2E2], a
	
	pop hl
	pop de
	
	;Timer control stuff
	xor a
	ld [$FF07], a
	set 2, a
	ld [$FF07], a
	ret
	
UpdateDededeSceneColors::
	;Timer control stuff
	xor a
	ld [$FF07], a
.load_next
	ld a, [de]
	ld [hl], a
	inc de
	ld a, 1  ;Prepare for VRAM bank switch
	ld [$FF4F], a  ;Switch to VRAM bank 1
	ld a, 0
	ldi [hl], a
	ld [$FF4F], a ;And back to VRAM bank 0
	dec c
	jr nz, .load_next
	push de
	ld de, $000C
	add hl, de
	pop de
	ld c, $14
	dec b
	jr nz, .load_next
	
	;Timer control stuff
	xor a
	ld [$FF07], a
	set 2, a
	ld [$FF07], a
	jp AfterDededeColors
	

BGPalSave::
	dw $7EBF, $69FF, $503F, $0000 ;Pink
	dw $7EBF, $4DFF, $28FF, $0000 ;Red
	dw $7EBF, $7E7B, $7D58, $0000 ;Purple
	dw $7EBF, $7F59, $7EAB, $0000 ;Blue
	dw $7FFF, $33F1, $0309, $0000 ;Green
	dw $7EBF, $7DFF, $7C3F, $0000
	dw $7EBF, $7DFF, $7C3F, $0000
	dw $7EBF, $7DFF, $7C3F, $0000
	
BGPalCongrats::
	dw $7809, $2FFF, $0309, $0000
	dw $7809, $2FFF, $0309, $0000
	dw $7809, $2FFF, $0309, $0000
	dw $7809, $2FFF, $0309, $0000
	dw $7809, $2FFF, $0309, $0000
	dw $7809, $2FFF, $0309, $0000
	dw $7809, $2FFF, $0309, $0000
	dw $7809, $2FFF, $0309, $0000

BGPalPointerArray::
	dw BGPal0  ;Intro/title
	dw BGPal1  ;Hub/bonus
	dw BGPal2  ;Whispy
	dw BGPal3  ;Kracko
	dw BGPal4  ;Poppy
	dw BGPal5  ;Final boss
	
BGPal0::
	dw $7FAD, $2FFF, $0309, $0000 ;Default green/yellow
	dw $7FAD, $033F, $0159, $533F ;Orange things in the background
	dw $7FAD, $33F1, $0309, $0000 ;Grass, "Kirby's" part of title
	dw $7FAD, $7FFF, $68A5, $0000 ;"Pinball Land" part of title
	dw $7CEC, $33F1, $0309, $0000 ;Grass w/ water BG
	dw $33F1, $2FFF, $0309, $0000 ;Ending cutscene ground
	dw $FFFF, $1F62, $1F0C, $0000
	dw $7809, $7FFF, $4800, $0000 ;Scores screen
	
BGPal1::
	dw $03C0, $2FFF, $0309, $0000 ;Default green/yellow
	dw $03C0, $621F, $0C1F, $0000 ;Kirby w/ BG
	dw $03C0, $57D5, $7FFF, $0000 ;Soccer field
	dw $03C0, $0300, $0220, $0000 ;Hub images
	dw $FFFF, $1F62, $1F0C, $0000
	dw $7FAD, $7ECF, $7D66, $7FFF ;Kracko bonus clouds
	dw $7FAD, $7ECF, $7D66, $0000 ;Kracko bonus ground
	dw $FFFF, $5294, $2D6B, $0000 ;Score/lives/time
	
BGPal2::
	dw $43BE, $26D7, $1591, $0000 ;Default brown
	dw $43BE, $621F, $0C1F, $0000 ;Kirby w/ BG
	dw $03C0, $0340, $02A0, $0000 ;Whispy leaves/grass
	dw $43BE, $037B, $0AB7, $0000 ;Slots n stuff
	dw $43BE, $7FFF, $0C1F, $0000 ;Cappies
	dw $43BE, $031F, $019F, $0000 ;Middle Kirby
	dw $43BE, $0C1F, $0C14, $0000 ;Maxim Tomato
	dw $FFFF, $5294, $2D6B, $0000 ;Score/lives/time
	
BGPal3::
	dw $7FDC, $7F55, $7ECF, $0000 ;Default
	dw $7FDC, $621F, $0C1F, $0000 ;Kirby w/ BG
	dw $7FDC, $5294, $2D6B, $0000 ;Gray clouds
	dw $7FDC, $7E57, $7D10, $0000 ;Meta Knight
	dw $57FF, $7FFF, $039F, $0000 ;Mr. Bright BG
	dw $79D7, $7809, $1F0C, $0000 ;Mr. Shine BG
	dw $7FDC, $0C1F, $0C14, $0000 ;Maxim Tomato
	dw $FFFF, $5294, $2D6B, $0000 ;Score/lives/time
;OLD:
;	13FF
	
BGPal4::
	dw $7FFA, $7F32, $7E4B, $0000 ;Default
	dw $7FFA, $621F, $0C1F, $0000 ;Kirby w/ BG
	dw $7FFA, $7F09, $6205, $0000 ;Secondary
	dw $7FFF, $7E57, $7D10, $0000 ;Boss fight purple
	dw $7FFF, $031F, $01FF, $0000 ;Boss fight orange
	dw $7FFA, $7E57, $7D10, $0000 ;Axe Knight
	dw $7FFA, $0C1F, $0C14, $0000 ;Maxim Tomato
	dw $FFFF, $5294, $2D6B, $0000 ;Score/lives/time

BGPal5::
	;63FF original BG color, got shafted tho
	dw $7FFF, $2DDF, $003F, $0000 ;Default
	dw $7FFF, $621F, $0C1F, $0000 ;Kirby w/ BG
	dw $7FFF, $0BFF, $02FC, $0000 ;Dedede spotlight
	dw $7FFF, $7D6B, $7F38, $0000 ;Outer BG
	dw $7FFF, $7F38, $7F38, $0000 ;Wires
	dw $FFFF, $1F62, $1F0C, $0000
	dw $7FFF, $0C1F, $0C14, $0000 ;Maxim Tomato
	dw $FFFF, $5294, $2D6B, $0000 ;Score/lives/time
	
TilesetColorPointerArray::
	;STAGE 0 - Intro/title/scores/drain
	dw TilesetColorIntroTitle  ;Intro/title
	dw TilesetColorBlank
	dw TilesetColorBelowDrain  ;Below the drain
	dw TilesetColorBlank
	dw TilesetColorScores  ;Ranking/scores
	dw TilesetColorBlank
	dw TilesetColorEnding
	dw TilesetColorBlank
	;STAGE 1 - Hub/bonus
	dw TilesetColorHub
	dw TilesetColorBlank
	dw TilesetColorKrackoBonus
	dw TilesetColorBlank
	dw TilesetColorWhispyPoppyBonus
	dw TilesetColorBlank
	dw TilesetColorWhispyPoppyBonus
	dw TilesetColorBlank
	;STAGE 2 - Whispy
	dw TilesetColorWhispyBoss
	dw TilesetColorBlank
	dw TilesetColorWhispy2
	dw TilesetColorWhispy3
	dw TilesetColorWhispy4
	dw TilesetColorWhispy5
	dw TilesetColorWhispy6
	dw TilesetColorBlank
	;STAGE 3 - Kracko
	dw TilesetColorKrackoBoss
	dw TilesetColorBlank
	dw TilesetColorKracko2
	dw TilesetColorKracko3
	dw TilesetColorKracko4
	dw TilesetColorKracko5
	dw TilesetColorKracko6
	dw TilesetColorBlank
	;STAGE 4 - Poppy
	dw TilesetColorPoppyBoss
	dw TilesetColorBlank
	dw TilesetColorPoppy2
	dw TilesetColorPoppy3
	dw TilesetColorPoppy4
	dw TilesetColorPoppy5
	dw TilesetColorPoppy6
	dw TilesetColorBlank
	;STAGE 5 - Dedede
	dw TilesetColorDededeBoss
	dw TilesetColorBlank

TilesetColorBlank::
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	
TilesetColorIntroTitle::
	db $02, $03, $03, $02, $03, $03, $03, $03, $02, $00, $00, $00, $03, $00, $00, $02
	db $03, $03, $03, $02, $03, $03, $03, $03, $03, $00, $00, $00, $00, $00, $00, $02
	db $02, $02, $02, $02, $02, $03, $03, $03, $03, $00, $00, $00, $03, $00, $00, $04
	db $01, $01, $02, $02, $02, $03, $03, $03, $02, $00, $00, $00, $03, $00, $00, $04
	db $01, $02, $02, $02, $02, $03, $03, $03, $03, $00, $00, $00, $03, $00, $00, $02
	db $02, $02, $02, $02, $02, $03, $03, $03, $03, $01, $00, $00, $03, $00, $03, $02
	db $02, $02, $02, $02, $00, $03, $03, $03, $03, $01, $00, $00, $03, $00, $02, $02
	db $02, $02, $02, $02, $02, $03, $03, $03, $03, $03, $00, $00, $03, $00, $02, $02
	db $02, $02, $02, $02, $03, $03, $03, $03, $03, $04, $00, $00, $00, $00, $02, $02
	db $02, $02, $02, $02, $00, $03, $03, $03, $03, $04, $00, $00, $00, $00, $00, $00
	db $02, $02, $02, $02, $02, $03, $03, $03, $03, $04, $00, $00, $00, $00, $00, $00
	db $02, $02, $02, $02, $02, $03, $03, $03, $03, $04, $00, $00, $00, $00, $00, $00
	db $02, $02, $02, $02, $02, $03, $03, $03, $03, $00, $00, $00, $00, $00, $00, $00
	db $02, $02, $02, $02, $02, $03, $03, $03, $03, $03, $00, $03, $00, $00, $00, $00
	db $00, $00, $02, $02, $03, $03, $03, $03, $02, $03, $00, $03, $00, $00, $00, $00
	db $00, $00, $00, $00, $03, $03, $03, $03, $02, $03, $00, $03, $00, $00, $00, $00
	
TilesetColorBelowDrain::
	db $00, $00, $03, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $03, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $03, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $03, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $03, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $03, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $03, $03, $03, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $03, $03, $03, $03, $05, $05, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $03, $03, $03, $03, $05, $05, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $03, $03, $03, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $03, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $03, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $03, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $03, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03
	db $03, $03, $03, $03, $00, $00, $00, $00, $00, $00, $00, $00, $03, $03, $03, $03
	
	
TilesetColorScores::
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $07, $07, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $07, $07, $07, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $07, $07, $07, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $07, $07, $07, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $07, $07, $07, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $07, $07, $07, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $07, $07, $07, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $07, $07, $07, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $07, $07, $07, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $07, $07, $07, $00, $00, $00, $00, $00
	db $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07
	db $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07
	db $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07
	db $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07
	db $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07
	db $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07, $07

TilesetColorEnding::
	db $05, $05, $05, $05, $05, $05, $02, $02, $02, $02, $00, $00, $00, $00, $00, $00
	db $05, $05, $05, $05, $05, $05, $02, $02, $02, $02, $00, $00, $00, $00, $00, $00
	db $05, $05, $05, $05, $05, $05, $02, $02, $02, $02, $00, $00, $00, $00, $00, $00
	db $05, $05, $05, $05, $05, $05, $02, $02, $02, $02, $00, $00, $00, $00, $00, $00
	db $03, $03, $03, $03, $00, $00, $02, $02, $02, $02, $00, $00, $00, $00, $00, $00
	db $03, $03, $03, $03, $00, $00, $02, $02, $02, $02, $00, $00, $00, $00, $00, $00
	db $03, $03, $03, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $03, $03, $03, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	
TilesetColorHub::
	db $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03
	db $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03
	db $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03
	db $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03
	db $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03
	db $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $00, $00
	db $03, $03, $00, $00, $00, $00, $00, $00, $00, $00, $03, $03, $03, $03, $00, $00
	db $03, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $03, $03
	db $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $00, $00
	db $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $00, $00
	db $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $00, $03, $00
	db $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $00, $00, $00, $00, $03, $00
	db $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $00, $00, $00, $00, $00, $00
	db $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03
	db $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03
	db $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $03, $00, $00
	
TilesetColorKrackoBonus::
	db $05, $05, $05, $06, $06, $06, $06, $06, $00, $00, $00, $00, $07, $07, $07, $07
	db $05, $05, $05, $06, $06, $06, $06, $06, $00, $00, $00, $00, $07, $07, $07, $07
	db $05, $05, $05, $06, $06, $06, $06, $07, $00, $00, $00, $00, $07, $07, $07, $07
	db $05, $05, $05, $06, $06, $06, $06, $07, $00, $00, $00, $00, $07, $07, $07, $07
	db $05, $05, $05, $05, $06, $06, $06, $00, $00, $00, $00, $00, $07, $07, $00, $00
	db $05, $05, $05, $05, $06, $06, $06, $00, $00, $00, $00, $00, $07, $07, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $05
	db $00, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $00, $05
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $05
	
TilesetColorWhispyPoppyBonus::
	db $00, $00, $02, $02, $02, $02, $02, $00, $02, $02, $02, $02, $07, $07, $07, $07
	db $00, $00, $02, $02, $02, $02, $00, $00, $02, $02, $00, $00, $07, $07, $07, $07
	db $00, $00, $02, $02, $02, $02, $02, $00, $02, $02, $00, $00, $07, $07, $07, $07
	db $00, $00, $02, $00, $00, $00, $00, $00, $02, $02, $00, $00, $07, $07, $07, $07
	db $02, $02, $02, $02, $02, $00, $00, $00, $00, $00, $00, $00, $07, $07, $07, $07
	db $02, $02, $02, $02, $02, $00, $00, $00, $02, $02, $02, $02, $07, $07, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $07, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $07, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $07, $07, $00, $00
	db $00, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $07, $07, $00, $00
	db $00, $00, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $07, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

TilesetColorWhispyBoss::
	db $00, $00, $00, $00, $00, $00, $00, $02, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $02, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $02, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $02, $02, $00, $00, $02, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $02, $00, $02, $02, $02, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

TilesetColorWhispy2::
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $03, $03, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $03, $03, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $03, $03, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $03, $06, $06, $06, $06, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $00, $00, $00
	db $00, $04, $04, $00, $04, $04, $04, $01, $01, $01, $01, $00, $03, $03, $00, $00
	db $00, $04, $04, $00, $04, $04, $04, $00, $01, $01, $01, $00, $03, $03, $00, $00
	db $00, $04, $04, $04, $04, $04, $04, $04, $04, $04, $00, $00, $03, $03, $00, $00
	db $00, $04, $04, $04, $04, $04, $04, $04, $04, $04, $00, $00, $03, $03, $00, $00
	
TilesetColorWhispy3::
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $03, $03, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $03, $03, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $03, $03, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $03, $06, $06, $06, $06, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $00, $00
	db $03, $03, $03, $00, $00, $00, $05, $00, $00, $00, $05, $05, $00, $00, $05, $05
	db $05, $00, $00, $00, $00, $00, $00, $00, $00, $00, $05, $05, $05, $05, $05, $05
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $05, $05, $05, $05, $05, $05
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $05, $05, $00, $00, $05, $05
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $05, $05
	db $00, $00, $00, $05, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $05
	db $00, $00, $00, $05, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $05, $05
	db $00, $05, $00, $00, $00, $00, $00, $00, $05, $05, $00, $00, $00, $00, $00, $00
	
TilesetColorWhispy4::
	db $00, $00, $00, $00, $00, $06, $00, $00, $00, $00, $03, $00, $00, $06, $06, $00
	db $00, $00, $00, $00, $00, $00, $03, $00, $00, $00, $00, $00, $00, $06, $06, $00
	db $03, $00, $00, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $00
	db $03, $00, $00, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $00
	db $00, $00, $00, $00, $00, $00, $03, $00, $00, $00, $00, $00, $00, $00, $06, $06
	db $00, $00, $00, $00, $00, $06, $00, $00, $00, $00, $03, $00, $00, $00, $00, $00
	db $00, $03, $06, $06, $06, $06, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $00, $00
	db $03, $03, $03, $00, $00, $00, $05, $00, $00, $00, $05, $05, $00, $00, $05, $05
	db $05, $00, $00, $00, $00, $00, $00, $00, $00, $00, $05, $05, $05, $05, $05, $05
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $05, $05, $05, $05, $05, $05
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $05, $05, $00, $00, $05, $05
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $05, $05
	db $00, $00, $00, $05, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $05
	db $00, $00, $00, $05, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $05, $05
	db $00, $05, $00, $00, $00, $00, $00, $00, $05, $05, $00, $00, $00, $00, $00, $00
	
TilesetColorWhispy5::
	db $00, $00, $00, $00, $00, $06, $00, $00, $00, $00, $03, $00, $00, $06, $06, $00
	db $00, $00, $00, $00, $00, $00, $03, $00, $00, $00, $00, $00, $00, $06, $06, $00
	db $03, $00, $00, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $00
	db $03, $00, $00, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $00
	db $00, $00, $00, $00, $00, $00, $03, $00, $00, $00, $00, $00, $00, $00, $06, $06
	db $00, $00, $00, $00, $00, $06, $00, $00, $00, $00, $03, $00, $00, $00, $00, $00
	db $00, $03, $06, $06, $06, $06, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $00, $00
	db $00, $00, $00, $03, $03, $03, $03, $03, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $03, $03, $03, $03, $03, $03, $00, $00, $00, $00, $00, $03, $00, $00
	db $00, $00, $03, $03, $03, $03, $03, $03, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $03, $03, $03, $03, $03, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $03, $03, $00, $00, $00, $03, $03, $03, $03, $00, $00, $00, $00, $00, $00
	db $03, $03, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $03, $03, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $03, $03, $00, $00, $00, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00
	
TilesetColorWhispy6::
	db $00, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $03, $03, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $03, $03, $00
	db $00, $03, $00, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $03, $03, $00
	db $00, $03, $00, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $03, $03, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $06, $06, $06, $06, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $00, $00
	db $00, $00, $00, $03, $03, $03, $03, $03, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $03, $03, $03, $03, $03, $03, $00, $00, $00, $00, $00, $03, $00, $00
	db $00, $00, $03, $03, $03, $03, $03, $03, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $03, $03, $03, $03, $03, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $03, $03, $00, $00, $00, $03, $03, $03, $03, $00, $00, $00, $00, $00, $00
	db $03, $03, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $03, $03, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $03, $03, $00, $00, $00, $03, $00, $00, $00, $00, $00, $00, $00, $00, $00

TilesetColorKrackoBoss::
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	
TilesetColorKracko2::
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $03, $03
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $03, $03
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $03, $03
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $06, $06, $06, $06, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $05, $00
	db $00, $00, $00, $04, $04, $05, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $04, $04, $05, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $04, $04, $05, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $04, $04, $00, $04, $04, $05, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $04, $00, $04, $04, $05, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $04, $00, $04, $04, $05, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $05, $00, $00, $05, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $05, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	
TilesetColorKracko3::
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $03, $03
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $03, $03
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $03, $03
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $06, $06, $06, $06, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $00, $00
	db $00, $00, $00, $00, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $02, $02, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $02, $00, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	
TilesetColorKracko4::
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $06, $06, $06, $06, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $00, $00
	db $00, $00, $00, $00, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $02, $02, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $02, $00, $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	
TilesetColorKracko5::
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $06, $06, $06, $06, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $00, $00
	db $00, $00, $00, $00, $03, $03, $03, $03, $03, $03, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $03, $03, $03, $03, $03, $03, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $03, $03, $03, $03, $03, $03, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $03, $03, $03, $03, $03, $03, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $03, $03, $03, $03, $03, $03, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $03, $03, $03, $03, $03, $03, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $03, $03, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $03, $03, $00, $00, $00, $00, $00, $00, $00, $00

TilesetColorKracko6::
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $06, $06, $06, $06, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $00, $00
	db $00, $00, $00, $00, $03, $03, $03, $03, $03, $03, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $03, $03, $03, $03, $03, $03, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $03, $03, $03, $03, $03, $03, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $03, $03, $03, $03, $03, $03, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $03, $03, $03, $03, $03, $03, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $03, $03, $03, $03, $03, $03, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $03, $03, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $03, $03, $00, $00, $00, $00, $00, $00, $00, $00

TilesetColorPoppyBoss::
	db $00, $00, $00, $00, $03, $00, $03, $03, $03, $03, $03, $03, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $03, $03, $03, $03, $03, $00, $00, $00, $00
	db $00, $00, $00, $00, $03, $00, $03, $03, $03, $03, $03, $03, $00, $00, $00, $00
	db $00, $00, $00, $00, $03, $00, $03, $03, $03, $03, $03, $03, $00, $00, $00, $00
	db $04, $00, $00, $00, $00, $00, $00, $03, $03, $03, $03, $03, $00, $00, $00, $00
	db $04, $00, $00, $00, $03, $00, $03, $03, $03, $03, $03, $03, $00, $00, $00, $00
	db $04, $00, $06, $06, $06, $06, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $03, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $03, $03
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	
TilesetColorPoppy2::
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $05, $05
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $05, $05
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $06, $06, $06, $06, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $00, $00
	db $02, $02, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $02, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $02, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $02, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $02, $02, $02, $02, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $02, $02, $02, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $02, $02, $02, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $02, $02, $02, $02, $02, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	
TilesetColorPoppy3::
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $05, $05
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $05, $05
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $06, $06, $06, $06, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $00, $00
	db $00, $01, $01, $01, $00, $02, $02, $01, $00, $01, $01, $00, $01, $00, $00, $01
	db $01, $01, $01, $01, $01, $02, $00, $02, $01, $01, $01, $00, $00, $00, $00, $00
	db $01, $01, $01, $01, $01, $01, $02, $02, $01, $01, $01, $01, $00, $00, $00, $00
	db $01, $01, $01, $01, $01, $01, $02, $02, $00, $01, $01, $01, $01, $00, $00, $01
	db $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00, $01, $01, $01, $01
	db $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00, $01, $01, $01, $01
	db $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $01, $00, $00, $00, $00
	db $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $01, $00, $00, $00, $00
	
TilesetColorPoppy4::
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $06, $06, $06, $06, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $00, $00
	db $00, $01, $01, $01, $00, $02, $02, $01, $00, $01, $01, $00, $01, $00, $00, $01
	db $01, $01, $01, $01, $01, $02, $00, $02, $01, $01, $01, $00, $00, $00, $00, $00
	db $01, $01, $01, $01, $01, $01, $02, $02, $01, $01, $01, $01, $00, $00, $00, $00
	db $01, $01, $01, $01, $01, $01, $02, $02, $00, $01, $01, $01, $01, $00, $00, $01
	db $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00, $01, $01, $01, $01
	db $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $00, $01, $01, $01, $01
	db $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $01, $00, $00, $00, $00
	db $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00, $01, $00, $00, $00, $00
	
TilesetColorPoppy5::
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $06, $06, $06, $06, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $00, $00
	db $00, $00, $00, $02, $02, $02, $00, $00, $00, $00, $02, $02, $00, $00, $00, $00
	db $00, $00, $00, $02, $00, $02, $00, $00, $00, $00, $02, $02, $00, $00, $00, $00
	db $00, $00, $00, $02, $00, $02, $00, $00, $00, $00, $02, $02, $02, $02, $00, $00
	db $00, $00, $00, $02, $00, $02, $00, $00, $00, $00, $02, $02, $02, $02, $00, $00
	db $00, $00, $00, $02, $00, $02, $00, $00, $00, $00, $02, $02, $02, $02, $00, $00
	db $00, $00, $00, $02, $02, $02, $00, $00, $00, $00, $00, $00, $02, $02, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $00, $00
	
TilesetColorPoppy6::
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $06, $06, $06, $06, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $00, $00
	db $00, $00, $00, $02, $02, $02, $00, $00, $00, $00, $02, $02, $00, $00, $00, $00
	db $00, $00, $00, $02, $00, $02, $00, $00, $00, $00, $02, $02, $00, $00, $00, $00
	db $00, $00, $00, $02, $00, $02, $00, $00, $00, $00, $02, $02, $02, $02, $00, $00
	db $00, $00, $00, $02, $00, $02, $00, $00, $00, $00, $02, $02, $02, $02, $00, $00
	db $00, $00, $00, $02, $00, $02, $00, $00, $00, $00, $02, $02, $02, $02, $00, $00
	db $00, $00, $00, $02, $02, $02, $00, $00, $00, $00, $00, $00, $02, $02, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $02, $02, $00, $00
	
TilesetColorDededeBoss::
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $04, $00, $02, $02, $02, $02, $02
	db $00, $00, $00, $00, $03, $03, $03, $03, $04, $04, $00, $02, $02, $02, $02, $02
	db $00, $00, $00, $00, $03, $03, $03, $03, $03, $03, $00, $02, $02, $02, $02, $02
	db $00, $00, $00, $00, $03, $03, $03, $03, $03, $00, $00, $02, $02, $02, $02, $00
	db $00, $00, $00, $00, $03, $03, $03, $03, $04, $04, $00, $02, $02, $02, $02, $00
	db $00, $00, $02, $00, $00, $00, $00, $00, $00, $04, $00, $02, $02, $02, $00, $00
	db $00, $00, $06, $06, $06, $06, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $02, $02
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $04, $04, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $04, $04, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $04, $04, $04, $04, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $04, $04, $04, $04, $00, $00, $00, $00
	
TilesetColorSave::
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $04, $04
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $04, $04
	db $00, $00, $04, $04, $04, $00, $00, $00, $02, $02, $01, $01, $00, $00, $04, $00
	db $00, $00, $04, $00, $04, $00, $00, $00, $02, $02, $01, $01, $03, $00, $04, $00
	db $00, $00, $04, $04, $04, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $04, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
;PALETTE STRUCTURE
;BG 0 - Base
;BG 1 - Kirby colors w/ BG
;BG 2 - Save screen stars
;BG 3 - Save screen box
;BG 4
;BG 5
;BG 6
;BG 7 - Score number tiles
;OBJ 0 - Pink/Kirby
;OBJ 1 - Red/Dedede
;OBJ 2 - Blue/Frosty
;OBJ 3 - Yellow/Warpstar
;OBJ 4 - Orange
;OBJ 5 - Brown
;OBJ 6 - Green
;OBJ 7 - Greyscale

;SPRITE OFFSET ARRAY AT 0:0CD0/0:0D05
;3:4000 - 0x0C000 - Hub sprites
;7:4000 - 0x1C000 - Intro sprites
;7:511B - 0x1D11B - Below the sink sprites
;3:6A92 - 0x0EA92 - Main gameplay sprites
;3:5021 - 0x0D021 - Main gameplay sprites 2
;7:5DE6 - 0x1DDE6 - Main gameplay sprites 3
;3:5D71 - 0x0DD71 - Main gameplay sprites 4
;4:51BD - 0x111BD - Main gameplay sprites 5
;4:5F47 - 0x11F47 - Main gameplay sprites 6
;7:6C8F - 0x1EC8F - Main gameplay sprites 7
;4:6C69 - 0x12C69 - Main gameplay sprites 8
;5:6691 - 0x16691 - Main gameplay sprites 9
;5:4000 - 0x14000 - Main gameplay sprites 10
;5:4C9E - 0x14C9E - Main gameplay sprites 11
;5:5905 - 0x15905 - Main gameplay sprites 12
;C:65E9 - 0x325E9 - Main gameplay sprites 13
;7:7842 - 0x1F842 - Main gameplay sprites 14
;A:4DC1 - 0x28DC1 - Main gameplay sprites 15
;A:6A2E - 0x2AA2E - Score screen sprites
;A:4000 - 0x28000 - Main gameplay sprites 16
;C:503E - 0x3103E - Final cutscene sprites?

;BG OFFSET ARRAY
;7:4BC8 - 0x1CBC8 - Intro/title 8800
;7:4630 - 0x1C630 - Intro/title 9000
;7:59C5 - 0x1D9C5 - Under sink 8800
;7:5587 - 0x1D587 - Under sink 9000
;A:709B - 0x2B09B - High scores + font
;A:6D8E - 0x2AD8E - High scores + "RANK"
;C:5838 - 0x31838
;C:56AA - 0x316AA
;3:4A5F - 0x0CA5F - Hub world 8800
;3:4476 - 0x0C476 - Hub world 9000
;7:6626 - 0x1E626 - Kracko Bonus 8800
;7:6302 - 0x1E302 - Kracko Bonus 9000
;7:743B - 0x1F43B - Poppy Bonus 8800
;7:7110 - 0x1F110 - Poppy Bonus 9000
;7:743B - 0x1F43B - Wispy Bonus 8800
;7:7110 - 0x1F110 - Wispy Bonus 9000
;3:5875 - 0x0D875 - Wispy Boss 8800
;3:548C - 0x0D48C - Wispy Boss 9000
;3:66E3 - 0x0E6E3 - Wispy Stage
;3:62F7 - 0x0E2F7 - Wispy Stage
;3:7415 - 0x0F415 - Wispy Stage
;3:6F86 - 0x0EF86 - Wispy Stage
;A:492E - 0x2892E - Wispy Stage
;A:44EF - 0x284EF - Wispy Stage
;4:59AB - 0x119AB - Kracko Boss 8800
;4:5673 - 0x11673 - Kracko Boss 9000
;4:680A - 0x1280A
;4:64B8 - 0x124B8
;5:6F1B - 0x16F1B
;5:6C00 - 0x16C00
;4:74F7 - 0x134F7
;4:714E - 0x1314E
;5:45DC - 0x145DC
;5:437B - 0x1437B
;5:5401 - 0x15401
;5:507E - 0x1507E
;5:622E - 0x1622E
;5:5DF3 - 0x15DF3
;C:6E8B - 0x32E8B
;C:6AB6 - 0x32AB6
;A:5623 - 0x29623
;A:522E - 0x2922E

;TILEMAP OFFSET ARRAY 0:0D50/0:0D5C
;8:4906 - 0x20906
;8:48E3 - 0x208E3
;8:443C - 0x2043C
;8:43E6 - 0x203E6
;8:53EF - 0x213EF
;8:5378 - 0x21378
;8:54DA - 0x214DA
;8:5451 - 0x21451
;8:4088 - 0x20088
;8:4000 - 0x20000
;8:423A - 0x2023A
;8:41D1 - 0x201D1
;8:42EE - 0x202EE
;8:426B - 0x2026B
;8:43BF - 0x203BF
;8:436C - 0x2036C
;8:4614 - 0x20614
;8:45A5 - 0x205A5
;8:471F - 0x2071F
;8:46A4 - 0x206A4
;8:484E - 0x2084E
;8:47BD - 0x207BD
;8:4514 - 0x20514
;8:4492 - 0x20492
;8:4AB2 - 0x20AB2
;8:4A41 - 0x20A41
;8:4B9E - 0x20B9E
;8:4B1E - 0x20B1E
;8:4D88 - 0x20D88
;8:4D06 - 0x20D06
;8:4C7C - 0x20C7C
;8:4BE6 - 0x20BE6
;8:4E76 - 0x20E76
;8:4E02 - 0x20E02
;8:4F2C - 0x20F2C
;8:4EB3 - 0x20EB3
;8:5003 - 0x21003
;8:4F7B - 0x20F7B
;8:5112 - 0x21112
;8:507E - 0x2107E
;8:51CF - 0x211CF
;8:5185 - 0x21185