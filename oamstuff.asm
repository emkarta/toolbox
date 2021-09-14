;POINTER FORMAT:
; xx yyyy
; xx - OAM Atrributes Byte, gets xor'ed when being sent to OAM
; yyyy - Offset of Entry

OAM_ENTRY_END 		EQU $80

;======================================
;BANK 0
;======================================

SECTION "+M, +B Bank 0 OAM",ROM0[$154E]
	db $F8, $F8, $2A, $16
	db $F8, $00, $2C, $16
	db OAM_ENTRY_END
	db $F8, $F8, $2A, $16
	db $F8, $00, $2E, $16
	db OAM_ENTRY_END
	db OAM_ENTRY_END

SECTION "Ball Kirby Bank 0 OAM",ROM0[$1591]
	db $F8, $00, $02, $00
	db $F8, $F8, $00, $00
	db OAM_ENTRY_END
	db $F8, $FF, $20, $20
	db $F8, $F7, $22, $20
	db OAM_ENTRY_END
	db $F8, $F7, $22, $20
	db $F8, $FF, $28, $20
	db OAM_ENTRY_END
	db $F7, $FF, $20, $60
	db $F7, $F7, $22, $60
	db OAM_ENTRY_END
	db $F7, $FF, $00, $60
	db $F7, $F7, $02, $60
	db OAM_ENTRY_END
	db $F7, $00, $22, $40
	db $F7, $F8, $20, $40
	db OAM_ENTRY_END
	db $F8, $00, $22, $00
	db $F8, $F8, $28, $00
	db OAM_ENTRY_END
	db $F8, $00, $22, $00
	db $F8, $F8, $20, $00
	db OAM_ENTRY_END

SECTION "Boss Fight Kirby Bank 0 OAM",ROM0[$1603]
	db $F8, $00, $F2, $00
	db $F8, $F8, $E2, $00
	db OAM_ENTRY_END
	db $F8, $F8, $F4, $20
	db $F8, $00, $E4, $20
	db OAM_ENTRY_END
	db $F8, $00, $F4, $00
	db $F8, $F8, $E4, $00
	db OAM_ENTRY_END
	db $F8, $F8, $F0, $20
	db $F8, $00, $E0, $20
	db OAM_ENTRY_END
	db $F8, $00, $F0, $00
	db $F8, $F8, $E0, $00
	db OAM_ENTRY_END
	db $F8, $00, $F6, $00
	db $F8, $F8, $E6, $00
	db OAM_ENTRY_END
	db $F8, $F8, $F6, $20
	db $F8, $00, $E6, $20
	db OAM_ENTRY_END
	db $F8, $00, $F6, $40
	db $F8, $F8, $E6, $40
	db OAM_ENTRY_END
	db $F8, $F8, $F6, $60
	db $F8, $00, $E6, $60
	db OAM_ENTRY_END

SECTION "Flippers Bank 0 OAM Pointers",ROM0[$1654]
	db $00
	dw Flippers1
	db $00
	dw Flippers2
	db $00
	dw Flippers3
	db $20
	dw Flippers1
	db $20
	dw Flippers2
	db $20
	dw Flippers3
	db $20
	dw Flippers4
	db $20
	dw Flippers5
	db $20
	dw Flippers6
	db $00
	dw Flippers4
	db $00
	dw Flippers5
	db $00
	dw Flippers6
	db $13
	dw Flippers1
	db $13
	dw Flippers2
	db $13
	dw Flippers3
	db $33
	dw Flippers1
	db $33
	dw Flippers2
	db $33
	dw Flippers3
	db $30
	dw Flippers4
	db $30
	dw Flippers5
	db $30
	dw Flippers6
	db $10
	dw Flippers4
	db $10
	dw Flippers5
	db $10
	dw Flippers6

SECTION "Flippers Bank 0 OAM",ROM0[$169C]
Flippers1::
	db $FD, $FE, $04, $04
	db $FD, $06, $06, $04
	db $01, $0E, $08, $04
	db OAM_ENTRY_END
Flippers2::
	db $FD, $FE, $0A, $04
	db $00, $06, $0C, $04
	db $00, $0E, $0E, $04
	db OAM_ENTRY_END
Flippers3::
	db $FD, $FE, $10, $04
	db $FA, $06, $12, $04
	db $F2, $0E, $14, $04
	db OAM_ENTRY_END
Flippers4::
	db $F5, $FE, $16, $00
	db $F3, $06, $18, $00
	db $F3, $0E, $1A, $00
	db OAM_ENTRY_END
Flippers5::
	db $F5, $FE, $1C, $00
	db $F5, $06, $1E, $00
	db $F5, $0E, $20, $00
	db OAM_ENTRY_END
Flippers6::
	db $F7, $FE, $22, $00
	db $F8, $06, $24, $00
	db $00, $0C, $26, $00
	db OAM_ENTRY_END

;This one's array has pointers to 2xxx
SECTION "Mr. Frosty Bank 0 OAM",ROM0[$172C]
	db $00, $04, $4A, $22
	db $F0, $04, $48, $22
	db $00, $FC, $5A, $02
	db $00, $F4, $4A, $02
	db $F0, $F4, $48, $02
	db $F0, $FC, $58, $02
	db OAM_ENTRY_END
	db $00, $04, $4A, $22
	db $00, $F4, $4A, $02
	db $00, $FC, $4C, $02
	db $F0, $04, $48, $22
	db $F0, $F4, $48, $02
	db $F0, $FC, $58, $02
	db OAM_ENTRY_END
	db $00, $FC, $5C, $02
	db $00, $04, $7E, $02
	db $F0, $04, $7C, $02
	db $00, $F4, $6E, $02
	db $F0, $F4, $6C, $02
	db $F0, $FC, $58, $02
	db OAM_ENTRY_END
	db $00, $FC, $5C, $22
	db $00, $F4, $7E, $22
	db $F0, $F4, $7C, $22
	db $00, $04, $6E, $22
	db $F0, $04, $6C, $22
	db $F0, $FC, $58, $02
	db OAM_ENTRY_END
	db $00, $04, $62, $22
	db $F0, $04, $60, $22
	db $00, $FC, $72, $02
	db $00, $F4, $62, $02
	db $F0, $F4, $60, $02
	db $F0, $FC, $70, $22
	db OAM_ENTRY_END
	db $00, $04, $66, $22
	db $F0, $04, $64, $22
	db $00, $FC, $76, $02
	db $00, $F4, $66, $02
	db $F0, $F4, $64, $02
	db $F0, $FC, $74, $22
	db OAM_ENTRY_END
	db $00, $FC, $98, $02
	db $00, $F4, $88, $02
	db $00, $04, $88, $22
	db $F0, $04, $86, $22
	db $F0, $F4, $86, $02
	db $F0, $FC, $96, $22
	db OAM_ENTRY_END
	db $00, $04, $D8, $02
	db $00, $FC, $C8, $02
	db $00, $F4, $B8, $02
	db $00, $EC, $A8, $02
	db $F0, $04, $D6, $02
	db $F0, $FC, $C6, $02
	db $F0, $EC, $A6, $02
	db $F0, $F4, $B6, $02
	db OAM_ENTRY_END
	db $00, $F4, $D8, $22
	db $00, $FC, $C8, $22
	db $00, $04, $B8, $22
	db $00, $0C, $A8, $22
	db $F0, $0C, $A6, $22
	db $F0, $04, $B6, $22
	db $F0, $F4, $D6, $22
	db $F0, $FC, $C6, $22
	db OAM_ENTRY_END
	db $F0, $04, $CE, $22
	db $F0, $F4, $CE, $02
	db $F0, $FC, $DE, $02
	db $00, $04, $66, $22
	db $00, $FC, $76, $02
	db $00, $F4, $66, $02
	db OAM_ENTRY_END
	db $F0, $F4, $8E, $02
	db $00, $F4, $9E, $02
	db $F0, $04, $D6, $02
	db $F0, $FC, $C6, $02
	db $00, $04, $D8, $02
	db $00, $FC, $C8, $02
	db OAM_ENTRY_END
	db $F0, $04, $8E, $22
	db $00, $04, $9E, $22
	db $00, $F4, $D8, $22
	db $00, $FC, $C8, $22
	db $F0, $F4, $D6, $22
	db $F0, $FC, $C6, $22
	db OAM_ENTRY_END
	db $F0, $F4, $E4, $02
	db $00, $F4, $F4, $02
	db $00, $04, $4A, $22
	db $F0, $04, $48, $22
	db $00, $FC, $5A, $02
	db $F0, $FC, $58, $02
	db OAM_ENTRY_END
	db $F0, $04, $E4, $22
	db $00, $04, $F4, $22
	db $00, $FC, $5A, $02
	db $00, $F4, $4A, $02
	db $F0, $F4, $48, $02
	db $F0, $FC, $58, $02
	db OAM_ENTRY_END
	db $F0, $04, $E4, $22
	db $00, $04, $F4, $22
	db $F0, $F4, $E4, $02
	db $00, $F4, $F4, $02
	db $00, $FC, $5A, $02
	db $F0, $FC, $58, $02
	db OAM_ENTRY_END
	
;This one's array has pointers to 2xxx
SECTION "Chilly Bank 0 OAM",ROM0[$18DD]
	db $F8, $00, $F6, $02
	db $F8, $F8, $E6, $02
	db OAM_ENTRY_END
	db $F8, $00, $F8, $02
	db $F8, $F8, $E8, $02
	db OAM_ENTRY_END
	db $F8, $F8, $F8, $22
	db $F8, $00, $E8, $22
	db OAM_ENTRY_END
	db $F8, $F8, $F6, $22
	db $F8, $00, $E6, $22
	db OAM_ENTRY_END
	db $F8, $00, $BE, $02
	db $F8, $F8, $AE, $02
	db OAM_ENTRY_END
	db $F8, $F8, $BF, $22
	db $F8, $00, $AF, $22
	db OAM_ENTRY_END
	
;This one's array has pointers to 2xxx
SECTION "Poppy Middle Items Bank 0 OAM",ROM0[$1979]
	;Squishy
	db $F8, $F8, $60, $02
	db $F8, $00, $60, $22
	db OAM_ENTRY_END
	;Sparky
	db $F8, $F8, $5A, $26
	db $F8, $00, $4A, $26
	db OAM_ENTRY_END
	db $F8, $F8, $7A, $26
	db $F8, $00, $6A, $26
	db OAM_ENTRY_END
	;Apple
	db $F8, $00, $74, $01
	db $F8, $F8, $64, $01
	db OAM_ENTRY_END
	;Maxim Tomato
	db $F8, $00, $76, $01
	db $F8, $F8, $66, $01
	db OAM_ENTRY_END
	;1up
	db $F8, $00, $5C, $00
	db $F8, $F8, $4C, $00
	db OAM_ENTRY_END
	;Gordo
	db $F8, $00, $70, $62
	db $F8, $F8, $70, $02
	db OAM_ENTRY_END
	;Squishy Throwing Kirby
	db $00, $00, $78, $20
	db $F0, $00, $68, $22
	db $F0, $F8, $68, $02
	db $00, $F8, $78, $00
	db OAM_ENTRY_END
	db $00, $00, $58, $22
	db $F0, $00, $48, $22
	db $F0, $F8, $48, $02
	db $00, $F8, $58, $02
	db OAM_ENTRY_END
	db $08, $00, $72, $20
	db $F8, $00, $62, $22
	db $F8, $F8, $62, $02
	db $08, $F8, $72, $00
	db OAM_ENTRY_END
	
;This one's array has pointers to 2xxx
SECTION "Poppy Sr. Bank 0 OAM",ROM0[$1A6F]
	db $04, $00, $BC, $02
	db $04, $F8, $B8, $02
	db $F9, $FE, $B4, $02
	db $F9, $F6, $B0, $02
	db OAM_ENTRY_END
	db $04, $00, $BC, $02
	db $04, $F8, $BA, $02
	db $F9, $FF, $B4, $02
	db $F9, $F7, $B0, $02
	db OAM_ENTRY_END
	db $04, $FB, $BA, $22
	db $04, $F3, $BC, $22
	db $F9, $00, $B4, $02
	db $F9, $F8, $B0, $02
	db OAM_ENTRY_END
	db $04, $FC, $B8, $22
	db $04, $F4, $BC, $22
	db $F9, $01, $B4, $02
	db $F9, $F9, $B0, $02
	db OAM_ENTRY_END
	db $06, $F2, $AE, $02
	db $04, $00, $BC, $02
	db $04, $F8, $B8, $02
	db $F9, $FE, $B4, $02
	db $F9, $F6, $B0, $02
	db OAM_ENTRY_END
	db $02, $ED, $AE, $02
	db $04, $00, $BC, $02
	db $04, $F8, $B8, $02
	db $F9, $FE, $B6, $02
	db $F9, $F6, $B2, $02
	db OAM_ENTRY_END
	db $09, $E7, $BE, $02
	db $09, $EF, $CE, $02
	db $06, $F2, $AE, $02
	db $04, $00, $BC, $02
	db $04, $F8, $B8, $02
	db $F9, $FE, $B4, $02
	db $F9, $F6, $B0, $02
	db OAM_ENTRY_END
	db $FF, $E4, $BE, $02
	db $FF, $EC, $CE, $02
	db $02, $EF, $AE, $02
	db $04, $00, $BC, $02
	db $04, $F8, $B8, $02
	db $F9, $FE, $B6, $02
	db $F9, $F6, $B2, $02
	db OAM_ENTRY_END
	db $F1, $E6, $BE, $02
	db $F1, $EE, $CE, $02
	db $F8, $EF, $AE, $02
	db $04, $00, $BC, $02
	db $04, $F8, $BA, $02
	db $F9, $FF, $B6, $02
	db $F9, $F7, $B2, $02
	db OAM_ENTRY_END
	db $E4, $FA, $CE, $02
	db $E4, $F2, $BE, $02
	db $F0, $F6, $AE, $02
	db $04, $FB, $BA, $22
	db $04, $F3, $BC, $22
	db $F9, $00, $B6, $02
	db $F9, $F8, $B2, $02
	db OAM_ENTRY_END
	db $EB, $0C, $CE, $02
	db $EB, $04, $BE, $02
	db $F4, $03, $AE, $02
	db $04, $FC, $B8, $22
	db $04, $F4, $BC, $22
	db $F9, $01, $B6, $02
	db $F9, $F9, $B2, $02
	db OAM_ENTRY_END
	db $F8, $00, $CE, $02
	db $F8, $F8, $BE, $02
	db OAM_ENTRY_END
	db $FF, $EC, $CE, $02
	db $02, $EF, $AE, $02
	db $FF, $E4, $BE, $02
	db $04, $00, $BC, $02
	db $04, $F8, $B8, $02
	db $F9, $FE, $B4, $02
	db $F9, $F6, $B0, $02
	db OAM_ENTRY_END
	db $EB, $EB, $BE, $02
	db $EB, $F3, $CE, $02
	db $F3, $F1, $AE, $02
	db $04, $00, $BC, $02
	db $04, $F8, $BA, $02
	db $F9, $FF, $B4, $02
	db $F9, $F7, $B0, $02
	db OAM_ENTRY_END
	db $EA, $00, $BE, $02
	db $F1, $FE, $AE, $02
	db $EA, $08, $CE, $02
	db $04, $FB, $BA, $22
	db $04, $F3, $BC, $22
	db $F9, $00, $B4, $02
	db $F9, $F8, $B0, $02
	db OAM_ENTRY_END
	db $01, $07, $BE, $02
	db $02, $03, $AE, $02
	db $01, $0F, $CE, $02
	db $04, $FC, $B8, $22
	db $04, $F4, $BC, $22
	db $F9, $01, $B4, $02
	db $F9, $F9, $B0, $02
	db OAM_ENTRY_END
	
SECTION "Unk6 Bank 0 OAM",ROM0[$1C03]
	db $F0, $05, $F4, $00
	db $F0, $FD, $E4, $00
	db $F0, $F5, $D4, $00
	db OAM_ENTRY_END
	db $00, $F0, $EC, $00
	db $EC, $FC, $EE, $00
	db $FC, $00, $9C, $00
	db $FC, $F8, $8C, $00
	db OAM_ENTRY_END
	db $00, $F0, $EC, $00
	db $EC, $FC, $EE, $00
	db $FC, $00, $BC, $00
	db $FC, $F8, $AC, $00
	db OAM_ENTRY_END
	db $E1, $F8, $24, $00
	db $E1, $F0, $30, $00
	db $F1, $F0, $32, $00
	db $F1, $F8, $26, $00
	db $E1, $00, $B4, $00
	db $F1, $00, $C4, $00
	db OAM_ENTRY_END
	db $E7, $00, $9A, $00
	db $E7, $F8, $8A, $00
	db $F7, $00, $BA, $00
	db $F7, $F8, $AA, $00
	db $E0, $F3, $CA, $00
	db $E0, $03, $EA, $00
	db $E0, $FB, $DA, $00
	db OAM_ENTRY_END
	db $E7, $00, $9A, $00
	db $E7, $F8, $8A, $00
	db $F7, $00, $BE, $00
	db $F7, $F8, $AE, $00
	db $E0, $F4, $EA, $20
	db $E0, $FC, $DA, $20
	db $E0, $04, $CA, $20
	db OAM_ENTRY_END
	db $E2, $F3, $CA, $00
	db $E2, $03, $EA, $00
	db $E2, $FB, $DA, $00
	db $F0, $00, $DC, $00
	db $F0, $F8, $CC, $00
	db $00, $00, $DE, $00
	db $00, $F8, $CE, $00
	db OAM_ENTRY_END
	db $ED, $FC, $FA, $00
	db $DD, $F3, $CA, $00
	db $DD, $03, $EA, $00
	db $DD, $FB, $DA, $00
	db $F0, $00, $9E, $00
	db $F0, $F8, $8E, $00
	db OAM_ENTRY_END

;This one's array has pointers to 2xxx
SECTION "Rain Cloud Bank 0 OAM",ROM0[$1D27]
	;Neutral
	db $F0, $07, $D6, $22
	db $00, $07, $D6, $62
	db $F1, $00, $E6, $22
	db $FF, $00, $E6, $62
	db $FF, $F8, $E6, $42
	db $00, $F1, $D6, $42
	db $F8, $FC, $F6, $02
	db $F1, $F8, $E6, $02
	db $F0, $F1, $D6, $02
	db OAM_ENTRY_END
	db $F0, $08, $D6, $22
	db $00, $08, $D6, $62
	db $F0, $00, $E6, $22
	db $00, $00, $E6, $62
	db $00, $F8, $E6, $42
	db $00, $F0, $D6, $42
	db $F8, $FC, $F6, $02
	db $F0, $F8, $E6, $02
	db $F0, $F0, $D6, $02
	db OAM_ENTRY_END
	;ANGERY
	db $F9, $FC, $F8, $07
	db $F0, $07, $D6, $27
	db $00, $07, $D6, $67
	db $F1, $00, $E6, $27
	db $FF, $00, $E6, $67
	db $FF, $F8, $E6, $47
	db $00, $F1, $D6, $47
	db $F1, $F8, $E6, $07
	db $F0, $F1, $D6, $07
	db OAM_ENTRY_END
	db $F8, $FC, $F8, $07
	db $F0, $08, $D6, $27
	db $00, $08, $D6, $67
	db $F0, $00, $E6, $27
	db $00, $00, $E6, $67
	db $00, $F8, $E6, $47
	db $00, $F0, $D6, $47
	db $F0, $F8, $E6, $07
	db $F0, $F0, $D6, $07
	db OAM_ENTRY_END
	;Raining
	db $10, $01, $E8, $62
	db $10, $F8, $E8, $42
	db $FE, $04, $D8, $02
	db $09, $FC, $D8, $42
	db $09, $F4, $D8, $42
	db $F8, $FC, $F8, $07
	db $F0, $08, $D6, $27
	db $00, $08, $D6, $67
	db $F0, $00, $E6, $27
	db $00, $00, $E6, $67
	db $00, $F8, $E6, $47
	db $00, $F0, $D6, $47
	db $F0, $F8, $E6, $07
	db $F0, $F0, $D6, $07
	db OAM_ENTRY_END
	db $09, $01, $E8, $22
	db $08, $F8, $E8, $02
	db $0D, $04, $D8, $42
	db $0C, $FC, $D8, $42
	db $01, $F4, $D8, $02
	db $F8, $FC, $F8, $07
	db $F0, $08, $D6, $27
	db $00, $08, $D6, $67
	db $F0, $00, $E6, $27
	db $00, $00, $E6, $67
	db $00, $F8, $E6, $47
	db $00, $F0, $D6, $47
	db $F0, $F8, $E6, $07
	db $F0, $F0, $D6, $07
	db OAM_ENTRY_END
	db $10, $04, $D8, $42
	db $10, $FC, $D8, $42
	db $10, $F4, $D8, $42
	db $FE, $01, $E8, $22
	db $0A, $F8, $E8, $42
	db $F8, $FC, $F8, $07
	db $F0, $08, $D6, $27
	db $00, $08, $D6, $67
	db $F0, $00, $E6, $27
	db $00, $00, $E6, $67
	db $00, $F8, $E6, $47
	db $00, $F0, $D6, $47
	db $F0, $F8, $E6, $07
	db $F0, $F0, $D6, $07
	db OAM_ENTRY_END
	db $0D, $00, $E8, $42
	db $0C, $F8, $E8, $42
	db $09, $05, $D8, $22
	db $09, $FD, $D8, $22
	db $09, $F4, $D8, $02
	db $F8, $FC, $F8, $07
	db $F0, $08, $D6, $27
	db $00, $08, $D6, $67
	db $F0, $00, $E6, $27
	db $00, $00, $E6, $67
	db $00, $F8, $E6, $47
	db $00, $F0, $D6, $47
	db $F0, $F8, $E6, $07
	db $F0, $F0, $D6, $07
	db OAM_ENTRY_END
	;Bird
	db $F8, $00, $B2, $03
	db $F8, $F8, $A2, $03
	db OAM_ENTRY_END
	db $F8, $00, $7C, $03
	db $F8, $F8, $6C, $03
	db OAM_ENTRY_END
	;Maxim Tomato
	db $F8, $00, $4E, $01
	db $F8, $F8, $70, $01
	db OAM_ENTRY_END
	;Apple
	db $F8, $00, $7E, $01
	db $F8, $F8, $6E, $01
	db OAM_ENTRY_END
	;Gordo
	db $F8, $00, $78, $62
	db $F8, $F8, $78, $02
	db OAM_ENTRY_END
	;Bronto Burt
	db $F8, $00, $58, $00
	db $F8, $F8, $48, $00
	db OAM_ENTRY_END
	db $F8, $00, $5A, $00
	db $F8, $F8, $4A, $00
	db OAM_ENTRY_END

;This one's array has pointers to 2xxx
SECTION "Chuckie and Hurly Bank 0 OAM",ROM0[$1F20]
	;Maxim Tomato
	db $F8, $00, $4E, $01
	db $F8, $F8, $70, $01
	db OAM_ENTRY_END
	;Chuckie
	db $F8, $00, $72, $02
	db $F8, $F8, $62, $02
	db OAM_ENTRY_END
	;Hurly
	db $F8, $00, $74, $00
	db $F8, $F8, $64, $00
	db OAM_ENTRY_END
	;Chuckie
	db $F8, $00, $76, $02
	db $F8, $F8, $66, $02
	db OAM_ENTRY_END
	db $F8, $00, $66, $22
	db $F8, $F8, $76, $22
	db OAM_ENTRY_END
	;Hurly
	db $F8, $00, $64, $20
	db $F8, $F8, $74, $20
	db OAM_ENTRY_END
	;Chuckie
	db $F8, $00, $62, $22
	db $F8, $F8, $72, $22
	db OAM_ENTRY_END
	;Hurly
	db $F8, $00, $7A, $00
	db $F8, $F8, $6A, $00
	db OAM_ENTRY_END
	db $F8, $00, $6A, $20
	db $F8, $F8, $7A, $20
	db OAM_ENTRY_END
	
;This one's array has pointers to 2xxx
SECTION "Mr. Bright and Mr. Shine Bank 0 OAM",ROM0[$1FB6]
	;Mr. Bright
	db $F0, $04, $A8, $84
	db $F0, $FC, $98, $84
	db $F0, $F4, $88, $84
	db $00, $FC, $9A, $84
	db $00, $F4, $8A, $84
	db $00, $04, $AA, $84
	db OAM_ENTRY_END
	db $F0, $04, $D8, $84
	db $F0, $F4, $B8, $84
	db $F0, $FC, $C8, $84
	db $00, $F4, $BA, $84
	db $00, $04, $DA, $84
	db $00, $FC, $CA, $84
	db OAM_ENTRY_END
	db $00, $FC, $9E, $84
	db $00, $04, $AE, $84
	db $F0, $04, $AC, $84
	db $F0, $F4, $8C, $84
	db $00, $F4, $8E, $84
	db $F0, $FC, $9C, $84
	db OAM_ENTRY_END
	db $00, $04, $DE, $84
	db $F0, $04, $DC, $84
	db $00, $F4, $BE, $84
	db $F0, $F4, $BC, $84
	db $F0, $FC, $CC, $84
	db $00, $FC, $CE, $84
	db OAM_ENTRY_END
	db $00, $04, $DE, $84
	db $F0, $04, $DC, $84
	db $00, $F4, $EA, $84
	db $F0, $F4, $E8, $84
	db $F0, $FC, $F8, $84
	db $00, $FC, $FA, $84
	;Mr. Shine
	db OAM_ENTRY_END
	db $ED, $F3, $C6, $23
	db $FD, $F3, $D6, $23
	db $FD, $03, $A6, $23
	db $ED, $03, $86, $23
	db $ED, $FB, $96, $23
	db $FD, $FB, $B6, $23
	db OAM_ENTRY_END
	db $ED, $F3, $EC, $23
	db $FD, $F3, $F6, $23
	db $FD, $03, $A6, $23
	db $ED, $03, $86, $23
	db $ED, $FB, $96, $23
	db $FD, $FB, $E6, $23
	db OAM_ENTRY_END
	db $ED, $F3, $C6, $23
	db $FD, $F3, $D6, $23
	db $FD, $03, $A6, $23
	db $ED, $03, $86, $23
	db $ED, $FB, $96, $23
	db $FD, $FB, $EE, $23
	db OAM_ENTRY_END
	;UFO?
	db $F8, $02, $7C, $00
	db $F8, $FA, $6C, $00
	db OAM_ENTRY_END
	db $F8, $01, $7E, $00
	db $F8, $F9, $6E, $00
	db OAM_ENTRY_END

;Array references values beyond its local space
SECTION "Flapper Bank 0 OAM",ROM0[$20AE]
	db $F6, $05, $94, $02
	db $F6, $FD, $92, $02
	db $F6, $F5, $82, $02
	db OAM_ENTRY_END
	db $FA, $00, $90, $02
	db $FA, $F8, $80, $02
	db OAM_ENTRY_END
	
SECTION "Kracko Boss Bank 0 OAM",ROM0[$211B]
	;Eyeball
	db $F8, $00, $70, $02
	db $F8, $F8, $60, $02
	db OAM_ENTRY_END
	;Jr. spheres
	db $EF, $08, $7E, $42
	db $01, $F0, $7E, $22
	db $08, $01, $7E, $02
	db $E8, $F7, $7E, $42
	db OAM_ENTRY_END
	db $F4, $09, $7E, $42
	db $FC, $EF, $7E, $22
	db $09, $FC, $7E, $02
	db $E7, $FC, $7E, $42
	db OAM_ENTRY_END
	db $EF, $F0, $7E, $62
	db $01, $08, $7E, $02
	db $08, $F7, $7E, $22
	db $E8, $01, $7E, $62
	db OAM_ENTRY_END
	db $EB, $F3, $7E, $62
	db $05, $05, $7E, $02
	db $05, $F3, $7E, $22
	db $EB, $05, $7E, $62
	db OAM_ENTRY_END
	;Body
	db $00, $10, $4E, $62
	db $F0, $10, $4E, $22
	db $00, $E8, $4E, $42
	db $F0, $E8, $4E, $02
	db $08, $00, $76, $62
	db $08, $F8, $76, $42
	db $E8, $00, $76, $22
	db $E8, $F8, $76, $02
	db $08, $08, $66, $62
	db $E8, $08, $66, $22
	db $08, $F0, $66, $42
	db $E8, $F0, $66, $02
	db $F8, $08, $58, $02
	db $F8, $F0, $58, $02
	db OAM_ENTRY_END
	db $00, $10, $78, $62
	db $F0, $10, $78, $22
	db $00, $E8, $78, $42
	db $F0, $E8, $78, $02
	db $08, $00, $48, $62
	db $08, $F8, $48, $42
	db $E8, $00, $48, $22
	db $E8, $F8, $48, $02
	db $08, $08, $4A, $62
	db $E8, $08, $4A, $22
	db $08, $F0, $4A, $42
	db $E8, $F0, $4A, $02
	db $F8, $08, $58, $02
	db $F8, $F0, $58, $02
	db OAM_ENTRY_END
	db $00, $10, $68, $62
	db $F0, $10, $68, $22
	db $00, $E8, $68, $42
	db $F0, $E8, $68, $02
	db $08, $00, $64, $62
	db $08, $F8, $64, $42
	db $E8, $00, $64, $22
	db $E8, $F8, $64, $02
	db $08, $08, $74, $62
	db $E8, $08, $74, $22
	db $08, $F0, $74, $42
	db $E8, $F0, $74, $02
	db $F8, $08, $58, $02
	db $F8, $F0, $58, $02
	db OAM_ENTRY_END
	;Eyeball
	db $F8, $00, $72, $02
	db $F8, $F8, $62, $02
	db OAM_ENTRY_END
	;Death puffs
	db $F6, $0F, $FC, $61
	db $F6, $07, $FC, $01
	db $FD, $E8, $FC, $01
	db $FD, $F0, $FC, $61
	db $F1, $00, $EE, $23
	db $F1, $F8, $EE, $03
	db OAM_ENTRY_END
	db $03, $0F, $EC, $61
	db $03, $07, $EC, $01
	db $EF, $EB, $EC, $01
	db $EF, $F3, $EC, $61
	db $F3, $05, $EE, $23
	db $F3, $FD, $EE, $03
	db OAM_ENTRY_END
	db $07, $02, $FC, $61
	db $07, $FA, $FC, $01
	db $E9, $F4, $FC, $01
	db $E9, $FC, $FC, $61
	db $F8, $07, $EE, $23
	db $F8, $FF, $EE, $03
	db OAM_ENTRY_END
	db $01, $EC, $EC, $01
	db $01, $F4, $EC, $61
	db $EE, $0F, $EC, $61
	db $EE, $07, $EC, $01
	db $FD, $05, $EE, $23
	db $FD, $FD, $EE, $03
	db OAM_ENTRY_END
	db $F5, $E9, $FC, $01
	db $F5, $F1, $FC, $61
	db $FC, $0F, $FC, $61
	db $FC, $07, $FC, $01
	db $FF, $00, $EE, $23
	db $FF, $F8, $EE, $03
	db OAM_ENTRY_END
	db $07, $08, $EC, $61
	db $07, $00, $EC, $01
	db $EB, $F7, $EC, $61
	db $EB, $EF, $EC, $01
	db $FD, $FB, $EE, $23
	db $FD, $F3, $EE, $03
	db OAM_ENTRY_END
	db $E9, $04, $FC, $61
	db $E9, $FC, $FC, $01
	db $07, $F6, $FC, $01
	db $07, $FE, $FC, $61
	db $F8, $F9, $EE, $23
	db $F8, $F1, $EE, $03
	db OAM_ENTRY_END
	db $05, $F8, $EC, $61
	db $05, $F0, $EC, $01
	db $EA, $09, $EC, $61
	db $EA, $01, $EC, $01
	db $F3, $FB, $EE, $23
	db $F3, $F3, $EE, $03
	db OAM_ENTRY_END
	;Lightning bolt
	db $E0, $FC, $6C, $23
	db $F0, $FC, $6C, $03
	db $00, $FC, $6C, $23
	db $10, $FC, $6C, $03
	db $18, $00, $6A, $44
	db $18, $F8, $5A, $44
	db OAM_ENTRY_END
	db $E0, $FC, $7C, $04
	db $F0, $FC, $7C, $04
	db $00, $FC, $7C, $04
	db $10, $FC, $7C, $04
	db $18, $00, $5C, $42
	db $18, $F8, $4C, $42
	db OAM_ENTRY_END
	db $E0, $FD, $6E, $03
	db $F0, $FC, $6E, $03
	db $00, $FD, $6E, $03
	db $10, $FC, $6E, $03
	db $18, $FC, $7A, $43
	db OAM_ENTRY_END
	db $E0, $FC, $6C, $64
	db $F0, $FC, $6C, $24
	db $00, $FC, $6C, $04
	db $10, $FC, $6C, $24
	db $18, $00, $6A, $44
	db $18, $F8, $5A, $44
	db OAM_ENTRY_END
	db $E0, $FC, $7C, $63
	db $F0, $FC, $7C, $63
	db $00, $FC, $7C, $63
	db $10, $FC, $7C, $63
	db $18, $00, $5C, $42
	db $18, $F8, $4C, $42
	db OAM_ENTRY_END
	db $E0, $FD, $6E, $64
	db $F0, $FC, $6E, $64
	db $00, $FD, $6E, $64
	db $10, $FC, $6E, $64
	db $18, $FC, $7A, $43
	db OAM_ENTRY_END

SECTION "Cappy Top Bank 0 OAM",ROM0[$2375]	
	db $F8, $00, $4E, $21
	db $F8, $F8, $4E, $01
	db OAM_ENTRY_END
	
SECTION "Slippy Bank 0 OAM",ROM0[$2390]
	db $F8, $00, $58, $04
	db $F8, $F8, $48, $04
	db OAM_ENTRY_END
	db $F8, $00, $5A, $04
	db $F8, $F8, $4A, $04
	db OAM_ENTRY_END
	db $F8, $00, $5C, $04
	db $F8, $F8, $4C, $04
	db OAM_ENTRY_END

;Array references values beyond its local space
SECTION "Whispy Top Foods Bank 0 OAM",ROM0[$23D2]
	db $F8, $00, $7A, $01
	db $F8, $F8, $6A, $01
	db OAM_ENTRY_END
	db $F8, $00, $78, $00
	db $F8, $F8, $68, $00
	db OAM_ENTRY_END
	db $F8, $00, $7C, $01
	db $F8, $F8, $6C, $01
	db OAM_ENTRY_END
	
SECTION "Bounder Bank 0 OAM",ROM0[$23F9]
	db $F8, $00, $24, $04
	db $F8, $F8, $30, $04
	db OAM_ENTRY_END
	db $F8, $00, $24, $04
	db $F8, $F8, $32, $04
	db OAM_ENTRY_END
	
SECTION "Twister Bank 0 OAM",ROM0[$2423]
	db $F8, $FF, $70, $03
	db $F8, $F7, $60, $03
	db OAM_ENTRY_END
	db $F8, $FE, $72, $03
	db $F8, $F6, $62, $03
	db OAM_ENTRY_END
	db $F8, $FD, $76, $03
	db $F8, $F5, $66, $03
	db OAM_ENTRY_END
	db $F8, $FF, $74, $03
	db $F8, $F7, $64, $03
	db OAM_ENTRY_END
	
SECTION "Mumbies Bank 0 OAM",ROM0[$2483]
	db $F8, $00, $BA, $02
	db $F8, $F8, $AA, $02
	db OAM_ENTRY_END
	db $F8, $F8, $BA, $22
	db $F8, $00, $AA, $22
	db OAM_ENTRY_END
	db $F8, $00, $DA, $02
	db $F8, $F8, $CA, $02
	db OAM_ENTRY_END
	db $F8, $F8, $DA, $22
	db $F8, $00, $CA, $22
	db OAM_ENTRY_END
	
SECTION "Stage Exit Warpstar Bank 0 OAM",ROM0[$24E9]
	db $F5, $07, $4E, $03
	db $01, $F0, $FE, $03
	db $F8, $00, $50, $03
	db $F8, $F8, $40, $03
	db OAM_ENTRY_END
	db $F6, $05, $4E, $03
	db $00, $F2, $FE, $03
	db $F8, $00, $50, $03
	db $F8, $F8, $40, $03
	db OAM_ENTRY_END
	db $F7, $03, $4E, $03
	db $FF, $F4, $FE, $03
	db $F8, $00, $50, $03
	db $F8, $F8, $40, $03
	db OAM_ENTRY_END
	db $FD, $F8, $FE, $03
	db $F8, $00, $50, $03
	db $F8, $F8, $40, $03
	db OAM_ENTRY_END
	db $FB, $FC, $FE, $03
	db $F8, $00, $50, $03
	db $F8, $F8, $40, $03
	db OAM_ENTRY_END
	db $F8, $F8, $40, $03
	db $FF, $F4, $4E, $03
	db $F9, $00, $FE, $03
	db $F8, $00, $50, $03
	db OAM_ENTRY_END
	db $00, $F2, $4E, $03
	db $F6, $05, $FE, $03
	db $F8, $00, $50, $03
	db $F8, $F8, $40, $03
	db OAM_ENTRY_END
	db $01, $F0, $4E, $03
	db $F5, $07, $FE, $03
	db $F8, $00, $50, $03
	db $F8, $F8, $40, $03
	db OAM_ENTRY_END
	
SECTION "Warpstar (?) Bank 0 OAM",ROM0[$259F]
	;Maxim tomato?
	db $F8, $00, $DA, $01
	db $F8, $F8, $CA, $01
	db OAM_ENTRY_END
	db $F8, $F8, $DA, $21
	db $F8, $00, $CA, $21
	db OAM_ENTRY_END
	db $F8, $F8, $DA, $61
	db $F8, $00, $CA, $61
	db OAM_ENTRY_END
	db $F8, $00, $DA, $41
	db $F8, $F8, $CA, $41
	db OAM_ENTRY_END
	;Stage select stars
	;25C3
	db $F8, $00, $5E, $23
	db $F8, $F8, $5E, $03
	db OAM_ENTRY_END
	db $F8, $00, $50, $03
	db $F8, $F8, $40, $03
	db OAM_ENTRY_END
	db $F8, $F8, $50, $32
	db $F8, $00, $40, $32
	db OAM_ENTRY_END
	db $F8, $00, $5E, $72
	db $F8, $F8, $5E, $52
	db OAM_ENTRY_END
	;UFO
	db $F7, $03, $C0, $02
	db $F7, $FB, $84, $02
	db OAM_ENTRY_END
	db $F7, $F5, $C0, $22
	db $F7, $FD, $84, $22
	db OAM_ENTRY_END
	db $F8, $01, $F6, $02
	db $F8, $F9, $C6, $02
	db OAM_ENTRY_END
	db $F8, $F7, $F6, $22
	db $F8, $FF, $C6, $22
	db OAM_ENTRY_END
	
SECTION "Unk17 (other) Bank 0 OAM",ROM0[$2611]
	db $F8, $00, $B8, $80
	db $F8, $F8, $B8, $80
	db OAM_ENTRY_END
	db $F8, $00, $8C, $20
	db $F8, $F8, $8C, $00
	db OAM_ENTRY_END
	
SECTION "Whispy Middle Kirby Bank 0 OAM",ROM0[$264A]
	db $F0, $00, $48, $04
	db $F0, $F8, $74, $04
	db $F2, $F1, $24, $04
	db $00, $08, $72, $04
	db $00, $F0, $26, $04
	db $00, $00, $62, $04
	db $00, $F8, $58, $04
	db OAM_ENTRY_END
	db $F0, $01, $48, $04
	db $F1, $F9, $74, $04
	db $F5, $F0, $30, $04
	db $00, $08, $70, $04
	db $00, $00, $60, $04
	db $00, $F8, $32, $04
	db OAM_ENTRY_END
	db $F1, $00, $64, $04
	db $F1, $F8, $68, $04
	db $00, $08, $76, $04
	db $00, $F0, $78, $04
	db $00, $00, $66, $04
	db $00, $F8, $5A, $04
	db OAM_ENTRY_END
	db $F0, $F7, $48, $24
	db $F1, $FF, $74, $24
	db $F5, $07, $30, $24
	db $00, $F0, $70, $24
	db $00, $F8, $60, $24
	db $00, $00, $32, $24
	db OAM_ENTRY_END
	db $F0, $F7, $48, $24
	db $F0, $FF, $74, $24
	db $F2, $06, $24, $24
	db $00, $EF, $72, $24
	db $00, $07, $26, $24
	db $00, $F7, $62, $24
	db $00, $FF, $58, $24
	db OAM_ENTRY_END
	db $F0, $F8, $DC, $04
	db $F0, $00, $48, $04
	db $F2, $F1, $24, $04
	db $00, $08, $72, $04
	db $00, $F0, $26, $04
	db $00, $00, $62, $04
	db $00, $F8, $58, $04
	db OAM_ENTRY_END
	db $F1, $F9, $DC, $04
	db $F0, $01, $48, $04
	db $F5, $F0, $30, $04
	db $00, $08, $70, $04
	db $00, $00, $60, $04
	db $00, $F8, $32, $04
	db OAM_ENTRY_END
	db $F1, $00, $CC, $04
	db $F1, $F8, $EC, $04
	db $00, $08, $76, $04
	db $00, $F0, $78, $04
	db $00, $00, $66, $04
	db $00, $F8, $5A, $04
	db OAM_ENTRY_END
	db $F1, $FF, $DC, $24
	db $F0, $F7, $48, $24
	db $F5, $07, $30, $24
	db $00, $F0, $70, $24
	db $00, $F8, $60, $24
	db $00, $00, $32, $24
	db OAM_ENTRY_END
	db $F0, $FF, $DC, $24
	db $F0, $F7, $48, $24
	db $F2, $06, $24, $24
	db $00, $EF, $72, $24
	db $00, $07, $26, $24
	db $00, $F7, $62, $24
	db $00, $FF, $58, $24
	db OAM_ENTRY_END
	db $00, $00, $AC, $04
	db $00, $F8, $9C, $04
	db $F5, $F8, $6E, $04
	db $F5, $00, $7E, $04
	db OAM_ENTRY_END
	db $00, $00, $AC, $04
	db $F0, $F8, $4C, $04
	db $F0, $00, $5C, $04
	db $00, $FE, $7C, $04
	db $00, $F6, $6C, $04
	db OAM_ENTRY_END
	db $00, $00, $AC, $04
	db $00, $F8, $9C, $04
	db $F0, $F0, $4A, $04
	db $F0, $08, $7A, $04
	db $F4, $00, $6A, $04
	db $F4, $F8, $4E, $04
	db OAM_ENTRY_END
	
SECTION "Trail Star Bank 0 OAM",ROM0[$2796]
	db $FC, $FC, $FE, $03
	db OAM_ENTRY_END
	
SECTION "Kirby Riding Warpstar Bank 0 OAM",ROM0[$27A7]
	db $03, $F4, $46, $63
	db $F3, $F4, $56, $63
	db $FC, $FC, $54, $23
	db $ED, $04, $42, $20
	db $FA, $04, $44, $23
	db $EC, $FC, $52, $20
	db OAM_ENTRY_END
	;Star itself
	db $F8, $00, $50, $03
	db $F8, $F8, $40, $03
	db OAM_ENTRY_END
	;Trail star? Isn't the one used, that's for sure.
	db $FC, $FC, $FE, $03
	db OAM_ENTRY_END
	
SECTION "Whispy Boss Bank 0 OAM",ROM0[$2810]
	;Apple
	db $F8, $00, $70, $01
	db $F8, $F8, $60, $01
	db OAM_ENTRY_END
	;Gordo
	db $F8, $00, $62, $63
	db $F8, $F8, $62, $03
	db OAM_ENTRY_END
	;Whispy Face
	db $09, $FC, $64, $05
	db $EB, $00, $64, $05
	db $EB, $F8, $64, $05
	db OAM_ENTRY_END
	db $07, $FC, $74, $05
	db $EB, $00, $74, $05
	db $EB, $F8, $74, $05
	db OAM_ENTRY_END
	db $05, $FC, $74, $05
	db $EB, $00, $6A, $05
	db $EB, $F8, $6A, $05
	db OAM_ENTRY_END
	db $06, $02, $6C, $25
	db $06, $FA, $6C, $05
	db $E8, $01, $74, $05
	db $E6, $FA, $64, $05
	db OAM_ENTRY_END
	db $08, $00, $6C, $25
	db $08, $F8, $6C, $05
	db $EB, $00, $74, $05
	db $EB, $F8, $64, $05
	db OAM_ENTRY_END
	db $F8, $00, $66, $25
	db $08, $00, $76, $25
	db $F8, $F8, $66, $05
	db $08, $F8, $76, $05
	db $EB, $00, $64, $05
	db $EB, $F8, $64, $05
	db OAM_ENTRY_END
	db $F8, $00, $66, $25
	db $08, $00, $68, $25
	db $F8, $F8, $66, $05
	db $08, $F8, $68, $05
	db $EB, $00, $64, $05
	db $EB, $F8, $64, $05
	db OAM_ENTRY_END
	db $08, $00, $6C, $25
	db $08, $F8, $6C, $05
	db $F4, $01, $6E, $05
	db $EB, $F8, $64, $05
	db OAM_ENTRY_END
	;Whispy Puff
	db $F8, $00, $78, $02
	db $F8, $F8, $7A, $02
	db OAM_ENTRY_END
	;Stars
	db $04, $FC, $FE, $03
	db $FC, $F4, $FE, $03
	db $FC, $04, $FE, $03
	db $F4, $FC, $FE, $03
	db OAM_ENTRY_END
	db $08, $FC, $FE, $03
	db $FC, $F0, $FE, $03
	db $FC, $08, $FE, $03
	db $F0, $FC, $FE, $03
	db OAM_ENTRY_END
	db $0C, $FC, $FE, $03
	db $FC, $EC, $FE, $03
	db $FC, $0C, $FE, $03
	db $EC, $FC, $FE, $03
	db OAM_ENTRY_END
	db $00, $00, $FE, $03
	db $00, $F8, $FE, $03
	db $F8, $00, $FE, $03
	db $F8, $F8, $FE, $03
	db OAM_ENTRY_END
	db $04, $04, $FE, $03
	db $04, $F4, $FE, $03
	db $F4, $04, $FE, $03
	db $F5, $F4, $FE, $03
	db OAM_ENTRY_END
	db $08, $08, $FE, $03
	db $08, $F0, $FE, $03
	db $F0, $08, $FE, $03
	db $F1, $F0, $FE, $03
	db OAM_ENTRY_END
	
SECTION "Kracko Bonus Stage Kirbys Bank 0 OAM",ROM0[$29B3]
	;Upper Kirby
	db $F8, $00, $58, $00
	db $F8, $F8, $48, $00
	db OAM_ENTRY_END
	db $F8, $F8, $58, $20
	db $F8, $00, $48, $20
	db OAM_ENTRY_END
	db $F8, $00, $D4, $00
	db $F8, $F8, $C4, $00
	db OAM_ENTRY_END
	db $F8, $F8, $60, $00
	db $F8, $00, $70, $00
	db OAM_ENTRY_END
	db $F8, $00, $F4, $00
	db $F8, $F8, $E4, $00
	db OAM_ENTRY_END
	db $F8, $00, $C4, $20
	db $F8, $F8, $D4, $20
	db OAM_ENTRY_END
	db $F8, $00, $60, $20
	db $F8, $F8, $70, $20
	db OAM_ENTRY_END
	db $F8, $00, $E4, $20
	db $F8, $F8, $F4, $20
	db OAM_ENTRY_END
	db $F8, $F8, $68, $00
	db $F8, $00, $78, $00
	db OAM_ENTRY_END
	db $F8, $F8, $80, $00
	db $F8, $00, $90, $00
	db OAM_ENTRY_END
	db $F8, $F8, $A0, $00
	db $F8, $00, $B0, $00
	db OAM_ENTRY_END
	db $F8, $F8, $86, $00
	db $F8, $00, $96, $00
	db OAM_ENTRY_END
	db $F8, $F8, $4A, $00
	db $F8, $00, $5A, $00
	db OAM_ENTRY_END
	db $F8, $00, $68, $20
	db $F8, $F8, $78, $20
	db OAM_ENTRY_END
	db $F8, $00, $80, $20
	db $F8, $F8, $90, $20
	db OAM_ENTRY_END
	db $F8, $00, $A0, $20
	db $F8, $F8, $B0, $20
	db OAM_ENTRY_END
	db $F8, $00, $86, $20
	db $F8, $F8, $96, $20
	db OAM_ENTRY_END
	db $F8, $00, $4A, $20
	db $F8, $F8, $5A, $20
	db OAM_ENTRY_END
	db $F8, $F8, $62, $00
	db $F8, $00, $72, $00
	db OAM_ENTRY_END
	db $00, $00, $76, $00
	db $00, $F8, $66, $00
	db $F0, $00, $74, $00
	db $F0, $F8, $64, $00
	db OAM_ENTRY_END
	db $00, $04, $8E, $20
	db $00, $FC, $9E, $00
	db $00, $F4, $8E, $00
	db $F0, $04, $7C, $00
	db $F0, $FC, $7A, $00
	db $F0, $F4, $6A, $00
	db OAM_ENTRY_END
	db $00, $04, $8E, $20
	db $00, $FC, $9E, $00
	db $00, $F4, $8E, $00
	db $F0, $04, $AC, $00
	db $F0, $FC, $9C, $00
	db $F0, $F4, $8C, $00
	db OAM_ENTRY_END
	db $F8, $00, $F6, $00
	db $F8, $F8, $E6, $00
	db OAM_ENTRY_END
	db $F8, $00, $D6, $00
	db $F8, $F8, $C6, $00
	db OAM_ENTRY_END
	db $F8, $00, $62, $20
	db $F8, $F8, $72, $20
	db OAM_ENTRY_END
	db $00, $00, $66, $20
	db $00, $F8, $76, $20
	db $F0, $F8, $74, $20
	db $F0, $00, $64, $20
	db OAM_ENTRY_END
	db $00, $F4, $8E, $00
	db $00, $FC, $9E, $20
	db $00, $04, $8E, $20
	db $F0, $F4, $7C, $20
	db $F0, $04, $6A, $20
	db $F0, $FC, $7A, $20
	db OAM_ENTRY_END
	db $00, $F4, $8E, $00
	db $00, $04, $8E, $20
	db $00, $FC, $9E, $20
	db $F0, $04, $8C, $20
	db $F0, $FC, $9C, $20
	db $F0, $F4, $AC, $20
	db OAM_ENTRY_END
	db $F8, $00, $E6, $20
	db $F8, $F8, $F6, $20
	db OAM_ENTRY_END
	db $F8, $00, $C6, $20
	db $F8, $F8, $D6, $20
	db OAM_ENTRY_END
	db $F1, $F8, $F0, $03
	db $F8, $00, $D6, $00
	db $F8, $F8, $C6, $00
	db $FD, $E8, $C2, $01
	db $FD, $F0, $C2, $61
	db $F6, $10, $C2, $61
	db $F6, $08, $C2, $01
	db $F1, $00, $F0, $23
	db OAM_ENTRY_END
	db $F3, $FD, $F0, $03
	db $F8, $F8, $C6, $00
	db $F8, $00, $D6, $00
	db $EF, $EB, $B2, $01
	db $EF, $F3, $B2, $61
	db $03, $10, $B2, $61
	db $03, $08, $B2, $01
	db $F3, $05, $F0, $23
	db OAM_ENTRY_END
	db $F8, $00, $F0, $03
	db $F8, $F8, $C6, $00
	db $F8, $00, $D6, $00
	db $E8, $F4, $C2, $01
	db $E8, $FC, $C2, $61
	db $08, $02, $C2, $61
	db $08, $FA, $C2, $01
	db $F8, $07, $F0, $23
	db OAM_ENTRY_END
	db $FD, $05, $F0, $23
	db $FD, $FD, $F0, $03
	db $F8, $00, $D6, $00
	db $F8, $F8, $C6, $00
	db $01, $EB, $B2, $01
	db $01, $F3, $B2, $61
	db $EF, $0C, $B2, $61
	db $EF, $04, $B2, $01
	db OAM_ENTRY_END
	db $00, $00, $F0, $23
	db $00, $F8, $F0, $03
	db $F8, $00, $D6, $00
	db $F8, $F8, $C6, $00
	db $F5, $E9, $C2, $01
	db $F5, $F1, $C2, $61
	db $FB, $0F, $C2, $61
	db $FB, $07, $C2, $01
	db OAM_ENTRY_END
	db $FD, $FB, $F0, $23
	db $FD, $F3, $F0, $03
	db $F8, $00, $D6, $00
	db $F8, $F8, $C6, $00
	db $EA, $EF, $B2, $01
	db $EA, $F7, $B2, $61
	db $06, $08, $B2, $61
	db $06, $00, $B2, $01
	db OAM_ENTRY_END
	db $F8, $F1, $F0, $03
	db $F8, $F9, $F0, $23
	db $F8, $00, $D6, $00
	db $F8, $F8, $C6, $00
	db $08, $F7, $C2, $01
	db $08, $FF, $C2, $61
	db $E9, $05, $C2, $61
	db $E9, $FD, $C2, $01
	db OAM_ENTRY_END
	db $F3, $FB, $F0, $23
	db $F8, $F8, $C6, $00
	db $F8, $00, $D6, $00
	db $05, $F7, $B2, $61
	db $05, $EF, $B2, $01
	db $E9, $08, $B2, $61
	db $E9, $00, $B2, $01
	db $F3, $F3, $F0, $03
	db OAM_ENTRY_END
	db $F1, $00, $F0, $23
	db $F1, $F8, $F0, $03
	db $F8, $00, $C6, $20
	db $F8, $F8, $D6, $20
	db $FD, $E8, $C2, $01
	db $FD, $F0, $C2, $61
	db $F6, $10, $C2, $61
	db $F6, $08, $C2, $01
	db OAM_ENTRY_END
	db $F3, $05, $F0, $23
	db $F3, $FD, $F0, $03
	db $F8, $00, $C6, $20
	db $F8, $F8, $D6, $20
	db $EF, $EB, $B2, $01
	db $EF, $F3, $B2, $61
	db $03, $10, $B2, $61
	db $03, $08, $B2, $01
	db OAM_ENTRY_END
	db $F8, $07, $F0, $23
	db $F8, $FF, $F0, $03
	db $F8, $00, $C6, $20
	db $F8, $F8, $D6, $20
	db $E8, $F4, $C2, $01
	db $E8, $FC, $C2, $61
	db $08, $02, $C2, $61
	db $08, $FA, $C2, $01
	db OAM_ENTRY_END
	db $FD, $05, $F0, $23
	db $FD, $FD, $F0, $03
	db $F8, $00, $C6, $20
	db $F8, $F8, $D6, $20
	db $01, $EB, $B2, $01
	db $01, $F3, $B2, $61
	db $EF, $0C, $B2, $61
	db $EF, $04, $B2, $01
	db OAM_ENTRY_END
	db $00, $00, $F0, $23
	db $00, $F8, $F0, $03
	db $F8, $00, $C6, $20
	db $F8, $F8, $D6, $20
	db $F5, $E9, $C2, $01
	db $F5, $F1, $C2, $61
	db $FB, $0F, $C2, $61
	db $FB, $07, $C2, $01
	db OAM_ENTRY_END
	db $FD, $FB, $F0, $23
	db $FD, $F3, $F0, $03
	db $F8, $00, $C6, $20
	db $F8, $F8, $D6, $20
	db $EA, $EF, $B2, $01
	db $EA, $F7, $B2, $61
	db $06, $08, $B2, $61
	db $06, $00, $B2, $01
	db OAM_ENTRY_END
	db $F8, $F9, $F0, $23
	db $F8, $F1, $F0, $03
	db $F8, $00, $C6, $20
	db $F8, $F8, $D6, $20
	db $08, $F7, $C2, $01
	db $08, $FF, $C2, $61
	db $E9, $05, $C2, $61
	db $E9, $FD, $C2, $01
	db OAM_ENTRY_END
	db $F3, $FB, $F0, $23
	db $F8, $00, $C6, $20
	db $F8, $F8, $D6, $20
	db $05, $F7, $B2, $61
	db $05, $EF, $B2, $01
	db $E9, $08, $B2, $61
	db $E9, $00, $B2, $01
	db $F3, $F3, $F0, $03
	db OAM_ENTRY_END
	;Burning
	db $F8, $08, $A6, $04
	db $E8, $F0, $D2, $04
	db $E8, $F8, $E2, $04
	db $E8, $00, $F2, $04
	db $F8, $F0, $94, $04
	db $F8, $00, $B4, $04
	db $F8, $F8, $A4, $04
	db OAM_ENTRY_END
	db $E8, $08, $DC, $04
	db $F8, $08, $DE, $04
	db $E8, $F0, $EC, $04
	db $E8, $00, $CC, $04
	db $E8, $F8, $BC, $04
	db $F8, $F0, $AE, $04
	db $F8, $00, $CE, $04
	db $F8, $F8, $BE, $04
	db OAM_ENTRY_END
	db $E9, $00, $CA, $04
	db $E9, $F8, $88, $04
	db $E9, $F0, $B6, $04
	db $F9, $08, $BA, $04
	db $F9, $F0, $8A, $04
	db $F9, $00, $AA, $04
	db $F9, $F8, $9A, $04
	db OAM_ENTRY_END

SECTION "Kracko Bonus Stage Items Bank 0 OAM",ROM0[$2D91]
	;Bomb
	db $F8, $00, $92, $02
	db $F8, $F8, $82, $02
	db OAM_ENTRY_END
	;Mint Leaf
	db $F8, $00, $EE, $66
	db $F8, $F8, $EE, $06
	db OAM_ENTRY_END
	;Curry
	db $F8, $00, $D0, $04
	db $F8, $F8, $C0, $04
	db OAM_ENTRY_END
	;Cake
	db $F8, $00, $7E, $01
	db $F8, $F8, $6E, $01
	db OAM_ENTRY_END
	;Invincible Candy
	db $F8, $00, $FA, $00
	db $F8, $F8, $EA, $00
	db OAM_ENTRY_END
	;1up
	db $F8, $00, $F8, $00
	db $F8, $F8, $E8, $00
	db OAM_ENTRY_END
	
SECTION "Poppy Bonus Stage Squishy Bank 0 OAM",ROM0[$2DFD]	
	db $E8, $F8, $4C, $02
	db $E8, $00, $4C, $22
	db $F8, $00, $4E, $22
	db $F8, $F8, $4E, $02
	db OAM_ENTRY_END
	db $E8, $00, $5C, $22
	db $E8, $F8, $5C, $02
	db $F8, $00, $B8, $22
	db $F8, $F8, $B8, $02
	db OAM_ENTRY_END
	db $E8, $02, $74, $02
	db $E8, $FA, $64, $02
	db $F8, $F2, $BA, $02
	db $F8, $FA, $66, $02
	db $F8, $02, $76, $02
	db OAM_ENTRY_END
	db $E8, $02, $70, $02
	db $E8, $FA, $60, $02
	db $E8, $F2, $B0, $02
	db $F8, $F2, $B6, $02
	db $F8, $FA, $62, $02
	db $F8, $02, $72, $02
	db OAM_ENTRY_END
	db $E8, $FE, $64, $22
	db $E8, $F6, $74, $22
	db $F8, $06, $BA, $22
	db $F8, $FE, $66, $22
	db $F8, $F6, $76, $22
	db OAM_ENTRY_END
	db $E8, $F6, $70, $22
	db $E8, $FE, $60, $22
	db $E9, $06, $B0, $22
	db $F9, $06, $B6, $22
	db $F8, $FE, $62, $22
	db $F8, $F6, $72, $22
	db OAM_ENTRY_END
	db $FD, $00, $7A, $00
	db $FD, $F8, $6A, $00
	db $ED, $00, $78, $02
	db $ED, $F8, $68, $02
	db OAM_ENTRY_END
	db $F8, $00, $A6, $22
	db $E8, $00, $A0, $20
	db $E8, $F8, $A0, $00
	db $F8, $F8, $A6, $02
	db OAM_ENTRY_END
	db $E8, $00, $A8, $20
	db $E8, $F8, $A8, $00
	db $F8, $00, $AA, $22
	db $F8, $F8, $AA, $02
	db OAM_ENTRY_END
	db $E8, $00, $48, $22
	db $E8, $F8, $48, $02
	db $F8, $00, $4A, $22
	db $F8, $F8, $4A, $02
	db OAM_ENTRY_END
	db $E8, $00, $8C, $22
	db $E8, $F8, $8C, $02
	db $F8, $00, $9E, $02
	db $F8, $F8, $8E, $02
	db OAM_ENTRY_END
	db $E8, $F8, $8C, $02
	db $E8, $00, $8C, $22
	db $F8, $F8, $9E, $22
	db $F8, $00, $8E, $22
	db OAM_ENTRY_END
	db $FC, $00, $7A, $00
	db $FC, $F8, $6A, $00
	db $EC, $00, $78, $02
	db $EC, $F8, $68, $02
	db OAM_ENTRY_END
	db $FC, $F8, $7A, $20
	db $FC, $00, $6A, $20
	db $EC, $F8, $78, $22
	db $EC, $00, $68, $22
	db OAM_ENTRY_END
	db $E8, $F8, $EA, $02
	db $E8, $00, $FA, $02
	db $F8, $00, $BE, $02
	db $F8, $F8, $AE, $02
	db OAM_ENTRY_END
	db $E8, $F8, $EA, $02
	db $E8, $00, $FA, $02
	db $F8, $00, $DE, $02
	db $F8, $F8, $CE, $02
	db OAM_ENTRY_END
	db $E8, $00, $EA, $22
	db $E8, $F8, $FA, $22
	db $F8, $F8, $BE, $22
	db $F8, $00, $AE, $22
	db OAM_ENTRY_END
	db $E8, $00, $EA, $22
	db $E8, $F8, $FA, $22
	db $F8, $F8, $DE, $22
	db $F8, $00, $CE, $22
	db OAM_ENTRY_END

SECTION "Whispy Bonus Stage Bank 0 OAM",ROM0[$2FC8]
	;Explosions
	db $F6, $0F, $5C, $61
	db $F6, $07, $5C, $01
	db $FB, $E9, $5C, $01
	db $FB, $F1, $5C, $61
	db $F1, $00, $7A, $63
	db $F1, $F8, $7A, $03
	db OAM_ENTRY_END
	db $01, $0C, $4C, $61
	db $01, $04, $4C, $01
	db $EF, $EB, $4C, $01
	db $EF, $F3, $4C, $61
	db $F3, $05, $7A, $63
	db $F3, $FD, $7A, $03
	db OAM_ENTRY_END
	db $07, $03, $5C, $61
	db $07, $FB, $5C, $01
	db $E9, $F5, $5C, $01
	db $E9, $FD, $5C, $61
	db $F8, $07, $7A, $63
	db $F8, $FF, $7A, $03
	db OAM_ENTRY_END
	db $01, $EB, $4C, $01
	db $01, $F3, $4C, $61
	db $EF, $0D, $4C, $61
	db $EF, $05, $4C, $01
	db $FD, $05, $7A, $63
	db $FD, $FD, $7A, $03
	db OAM_ENTRY_END
	db $FB, $0F, $5C, $61
	db $FB, $07, $5C, $01
	db $F5, $E9, $5C, $01
	db $F5, $F1, $5C, $61
	db $FF, $00, $7A, $63
	db $FF, $F8, $7A, $03
	db OAM_ENTRY_END
	db $06, $08, $4C, $61
	db $06, $00, $4C, $01
	db $EC, $F8, $4C, $61
	db $EC, $EF, $4C, $01
	db $FE, $FB, $7A, $63
	db $FE, $F3, $7A, $03
	db OAM_ENTRY_END
	db $07, $F5, $5C, $01
	db $07, $FD, $5C, $61
	db $E9, $04, $5C, $61
	db $E9, $FC, $5C, $01
	db $F8, $F9, $7A, $63
	db $F8, $F1, $7A, $03
	db OAM_ENTRY_END
	db $05, $F6, $4C, $61
	db $05, $EE, $4C, $01
	db $EB, $08, $4C, $61
	db $EB, $00, $4C, $01
	db $F3, $FB, $7A, $63
	db $F3, $F3, $7A, $03
	db OAM_ENTRY_END
	;Broom Hatter
	db $F8, $00, $94, $03
	db $F8, $F8, $84, $03
	db OAM_ENTRY_END
	db $F8, $F8, $94, $23
	db $F8, $00, $84, $23
	db OAM_ENTRY_END
	db $F8, $00, $70, $03
	db $F8, $F8, $60, $03
	db OAM_ENTRY_END
	db $F8, $F8, $70, $23
	db $F8, $00, $60, $23
	;Waddle Dee
	db OAM_ENTRY_END
	db $F8, $00, $96, $04
	db $F8, $F8, $4A, $04
	db OAM_ENTRY_END
	db $F8, $F8, $96, $24
	db $F8, $00, $4A, $24
	db OAM_ENTRY_END
	db $F8, $00, $72, $04
	db $F8, $F8, $5A, $04
	db OAM_ENTRY_END
	db $F8, $F8, $72, $24
	db $F8, $00, $5A, $24
	db OAM_ENTRY_END
	db $F8, $00, $74, $00
	db $F8, $F8, $74, $20
	db OAM_ENTRY_END
	;Gaspar
	db $F8, $00, $7C, $01
	db $F8, $F8, $6C, $01
	db OAM_ENTRY_END
	db $F8, $F8, $7C, $21
	db $F8, $00, $6C, $21
	db OAM_ENTRY_END
	db $F8, $00, $7E, $01
	db $F8, $F8, $6E, $01
	db OAM_ENTRY_END
	db $F8, $F8, $7E, $21
	db $F8, $00, $6E, $21
	db OAM_ENTRY_END
	;1up
	db $F8, $00, $4E, $00
	db $F8, $F8, $36, $00
	db OAM_ENTRY_END

;======================================
;BANK 2
;======================================

SECTION "Boss Key Bank 2 OAM",ROMX[$62DB],BANK[2]
	;Glow
	db $FC, $00, $9A, $62
	db $FC, $F8, $9A, $42
	db $EC, $00, $9A, $22
	db $FC, $08, $8A, $62
	db $FC, $F0, $8A, $42
	db $EC, $08, $8A, $22
	db $EC, $F0, $8A, $02
	db $EC, $F8, $9A, $02
	db OAM_ENTRY_END
	;Key
	db $E8, $00, $8C, $23
	db $E8, $F8, $8C, $03
	db $F8, $00, $9E, $03
	db $F8, $F8, $8E, $03
	db OAM_ENTRY_END
	db $F3, $01, $AC, $03
	db $F3, $F9, $9C, $03
	db OAM_ENTRY_END
	db $F4, $F4, $AA, $43
	db $F4, $04, $A6, $43
	db $F4, $FC, $A8, $43
	db OAM_ENTRY_END
	db $F5, $01, $AC, $43
	db $F5, $F9, $9C, $43
	db OAM_ENTRY_END
	db $00, $00, $8C, $63
	db $00, $F8, $8C, $43
	db $F0, $00, $9E, $43
	db $F0, $F8, $8E, $43
	db OAM_ENTRY_END
	db $F5, $F8, $AC, $63
	db $F5, $00, $9C, $63
	db OAM_ENTRY_END
	db $F4, $03, $AA, $63
	db $F4, $F3, $A6, $63
	db $F4, $FB, $A8, $63
	db OAM_ENTRY_END
	db $F3, $F7, $AC, $23
	db $F3, $FF, $9C, $23
	db OAM_ENTRY_END
	;Dancing Kirbys
	db $F8, $00, $F0, $00
	db $F8, $F8, $E0, $00
	db OAM_ENTRY_END
	db $F8, $00, $F2, $00
	db $F8, $F8, $E2, $00
	db OAM_ENTRY_END
	db $F8, $00, $F4, $00
	db $F8, $F8, $E4, $00
	db OAM_ENTRY_END
	db $F8, $00, $F6, $00
	db $F8, $F8, $E6, $00
	db OAM_ENTRY_END
	db $F8, $00, $F8, $00
	db $F8, $F8, $E8, $00
	db OAM_ENTRY_END
	db $F8, $00, $FA, $00
	db $F8, $F8, $EA, $00
	db OAM_ENTRY_END
	db $F8, $00, $D0, $00
	db $F8, $F8, $C0, $00
	db OAM_ENTRY_END
	db $F8, $00, $D2, $00
	db $F8, $F8, $C2, $00
	db OAM_ENTRY_END
	db $F8, $00, $D4, $00
	db $F8, $F8, $C4, $00
	db OAM_ENTRY_END
	db $F8, $00, $D6, $00
	db $F8, $F8, $C6, $00
	db OAM_ENTRY_END
	db $F8, $00, $D8, $00
	db $F8, $F8, $C8, $00
	db OAM_ENTRY_END
	db $F8, $00, $DA, $00
	db $F8, $F8, $CA, $00
	db OAM_ENTRY_END
	db $F8, $00, $DC, $00
	db $F8, $F8, $CC, $00
	db OAM_ENTRY_END
	db $F8, $FF, $DE, $20
	db $F8, $F8, $DE, $00
	db OAM_ENTRY_END
	db $F8, $00, $A2, $00
	db $F8, $F8, $A0, $00
	db OAM_ENTRY_END
	db $F8, $FC, $A4, $00
	db OAM_ENTRY_END
	;Stars
	db $F1, $FC, $FE, $22
	db $F8, $00, $5E, $22
	db $F8, $F8, $5E, $02
	db OAM_ENTRY_END
	db $F4, $04, $FE, $22
	db $F8, $00, $50, $02
	db $F8, $F8, $40, $02
	db OAM_ENTRY_END
	db $FC, $07, $FE, $22
	db $F8, $F8, $5E, $42
	db $F8, $00, $5E, $62
	db OAM_ENTRY_END
	db $04, $04, $FE, $02
	db $F8, $F8, $50, $22
	db $F8, $00, $40, $22
	db OAM_ENTRY_END
	db $07, $FC, $FE, $02
	db $F8, $00, $5E, $22
	db $F8, $F8, $5E, $02
	db OAM_ENTRY_END
	db $04, $F4, $FE, $02
	db $F8, $00, $50, $02
	db $F8, $F8, $40, $02
	db OAM_ENTRY_END
	db $FC, $F1, $FE, $02
	db $F8, $F8, $5E, $42
	db $F8, $00, $5E, $62
	db OAM_ENTRY_END
	db $F4, $F4, $FE, $02
	db $F8, $F8, $50, $22
	db $F8, $00, $40, $22
	db OAM_ENTRY_END

SECTION "Dedede Bank 2 OAM",ROMX[$64C8],BANK[2]
	db $00, $08, $82, $21
	db $F0, $08, $80, $21
	db $00, $F0, $82, $01
	db $F0, $F0, $80, $01
	db $F0, $00, $90, $21
	db $F0, $F8, $90, $01
	db $00, $00, $92, $21
	db $00, $F8, $92, $01
	db OAM_ENTRY_END
	db $00, $08, $D2, $01
	db $F0, $00, $C0, $01
	db $F0, $F8, $B0, $01
	db $F0, $F0, $A0, $01
	db $00, $F0, $A2, $01
	db $00, $00, $C2, $01
	db $00, $F8, $B2, $01
	db OAM_ENTRY_END
	db $F0, $08, $D4, $01
	db $00, $08, $D6, $01
	db $F0, $00, $C4, $01
	db $F0, $F8, $B4, $01
	db $F0, $F0, $A4, $01
	db $00, $F0, $A6, $01
	db $00, $00, $C6, $01
	db $00, $F8, $B6, $01
	db OAM_ENTRY_END
	db $02, $08, $84, $21
	db $02, $00, $94, $21
	db $02, $F0, $84, $01
	db $02, $F8, $94, $01
	db OAM_ENTRY_END
	;Lightning
	db $D0, $F0, $5C, $03
	db $E0, $F2, $5C, $03
	db $F0, $F5, $5C, $03
	db $00, $F8, $5C, $03
	db $10, $FB, $5C, $03
	db $18, $00, $5A, $01
	db $18, $F8, $4A, $01
	db OAM_ENTRY_END
	db $18, $F8, $48, $03
	db $0F, $FB, $4C, $24
	db $00, $F7, $4C, $64
	db $F0, $F2, $4C, $04
	db $E0, $F2, $4C, $24
	db $D0, $F0, $4C, $04
	db $18, $00, $58, $03
	db OAM_ENTRY_END
	db $F4, $F6, $4E, $63
	db $E8, $F4, $4E, $23
	db $10, $FB, $4E, $63
	db $06, $F6, $4E, $43
	db $FE, $FB, $4E, $23
	db $F1, $EF, $4E, $03
	db $DC, $EF, $4E, $03
	db $D0, $F0, $4E, $23
	db $18, $FC, $60, $22
	db OAM_ENTRY_END
	;Bomb
	db $F8, $00, $64, $21
	db $F8, $F8, $74, $21
	db OAM_ENTRY_END
	db $00, $F0, $8A, $01
	db $F0, $F0, $88, $01
	db $00, $F8, $9A, $01
	db $F0, $F8, $98, $01
	db $F0, $00, $98, $21
	db $F0, $08, $88, $21
	db $00, $08, $8A, $21
	db $00, $00, $9A, $21
	db OAM_ENTRY_END
	db $00, $08, $8E, $21
	db $F0, $08, $80, $21
	db $00, $F0, $8E, $01
	db $F0, $F0, $80, $01
	db $F0, $00, $90, $21
	db $F0, $F8, $90, $01
	db $00, $00, $9E, $21
	db $00, $F8, $9E, $01
	db OAM_ENTRY_END
	db $00, $08, $8A, $21
	db $F0, $08, $88, $21
	db $00, $F0, $82, $01
	db $F0, $F0, $80, $01
	db $F0, $00, $98, $21
	db $F0, $F8, $90, $01
	db $00, $00, $9A, $21
	db $00, $F8, $92, $01
	db OAM_ENTRY_END
	db $F0, $00, $74, $01
	db $F0, $F8, $64, $01
	db $00, $08, $82, $21
	db $F0, $08, $80, $21
	db $00, $F0, $82, $01
	db $F0, $F0, $80, $01
	db $F0, $00, $90, $21
	db $F0, $F8, $90, $01
	db $00, $00, $92, $21
	db $00, $F8, $92, $01
	db OAM_ENTRY_END
	db $FA, $F8, $74, $01
	db $FA, $F0, $64, $01
	db $F0, $08, $D4, $01
	db $00, $08, $D6, $01
	db $F0, $00, $C4, $01
	db $F0, $F8, $B4, $01
	db $F0, $F0, $A4, $01
	db $00, $F0, $A6, $01
	db $00, $00, $C6, $01
	db $00, $F8, $B6, $01
	db OAM_ENTRY_END
	db $00, $00, $74, $01
	db $00, $F8, $64, $01
	db $00, $F0, $8A, $01
	db $F0, $F0, $88, $01
	db $00, $F8, $9A, $01
	db $F0, $F8, $98, $01
	db $F0, $00, $98, $21
	db $F0, $08, $88, $21
	db $00, $08, $8A, $21
	db $00, $00, $9A, $21
	db OAM_ENTRY_END
	db $00, $08, $82, $21
	db $F0, $08, $8C, $21
	db $00, $F0, $82, $01
	db $F0, $F0, $8C, $01
	db $F0, $00, $9C, $21
	db $F0, $F8, $9C, $01
	db $00, $00, $92, $21
	db $00, $F8, $92, $01
	db OAM_ENTRY_END
	db $00, $08, $82, $21
	db $F0, $08, $AC, $21
	db $00, $F0, $82, $01
	db $F0, $F0, $AC, $01
	db $F0, $00, $BC, $21
	db $F0, $F8, $BC, $01
	db $00, $00, $92, $21
	db $00, $F8, $92, $01
	db OAM_ENTRY_END
	db $F0, $F8, $9C, $01
	db $F0, $F0, $8C, $01
	db $00, $08, $8A, $21
	db $F0, $08, $88, $21
	db $00, $F0, $82, $01
	db $F0, $00, $98, $21
	db $00, $00, $9A, $21
	db $00, $F8, $92, $01
	db OAM_ENTRY_END
	db $F0, $F8, $BC, $01
	db $F0, $F0, $AC, $01
	db $00, $08, $8A, $21
	db $F0, $08, $88, $21
	db $00, $F0, $82, $01
	db $F0, $00, $98, $21
	db $00, $00, $9A, $21
	db $00, $F8, $92, $01
	db OAM_ENTRY_END
	db $00, $08, $86, $21
	db $00, $00, $96, $21
	db $00, $F8, $96, $01
	db $00, $F0, $86, $01
	db OAM_ENTRY_END
	db $F0, $08, $A8, $21
	db $F0, $00, $B8, $21
	db $00, $00, $BA, $21
	db $00, $08, $AA, $21
	db $00, $F0, $AA, $01
	db $F0, $F0, $A8, $01
	db $F0, $F8, $B8, $01
	db $00, $F8, $BA, $01
	db OAM_ENTRY_END
	db $00, $08, $CA, $21
	db $00, $00, $DA, $21
	db $F0, $08, $C8, $21
	db $F0, $00, $D8, $21
	db $00, $F0, $CA, $01
	db $00, $F8, $DA, $01
	db $F0, $F8, $D8, $01
	db $F0, $F0, $C8, $01
	db OAM_ENTRY_END
	db $00, $08, $CE, $21
	db $00, $00, $DE, $21
	db $F0, $08, $AE, $21
	db $F0, $00, $BE, $21
	db $00, $F0, $CE, $01
	db $00, $F8, $DE, $01
	db $F0, $F0, $AE, $01
	db $F0, $F8, $BE, $01
	db OAM_ENTRY_END

;======================================
;BANK B
;======================================

SECTION "Ranking Screen OAM",ROMX[$4718],BANK[$0B]
	;Bonus code cat
	db $F8, $00, $1E, $03
	db $F8, $F8, $0E, $03
	db OAM_ENTRY_END
	db $F8, $00, $3E, $03
	db $F8, $F8, $2E, $03
	db OAM_ENTRY_END
	;Boss code cat
	db $F8, $F8, $5E, $23
	db $F8, $00, $4E, $23
	db OAM_ENTRY_END
	db $F8, $F8, $7E, $23
	db $F8, $00, $6E, $23
	db OAM_ENTRY_END
	;Sleeping Kirby
	db $F8, $00, $10, $00
	db $F8, $F8, $00, $00
	db OAM_ENTRY_END
	db $F8, $00, $30, $00
	db $F8, $F8, $20, $00
	db OAM_ENTRY_END
	db $F8, $00, $50, $00
	db $F8, $F8, $40, $00
	db OAM_ENTRY_END
	db $F8, $00, $12, $00
	db $F8, $F8, $02, $00
	db OAM_ENTRY_END
	;Bomb
	db $F8, $00, $70, $07
	db $F8, $F8, $60, $07
	db OAM_ENTRY_END

SECTION "Intro OAM",ROMX[$47ED],BANK[$0B]
	;Dedede
	db $F0, $08, $0C, $21
	db $F0, $00, $1C, $21
	db $00, $08, $0E, $21
	db $00, $00, $1E, $21
	db $F0, $F0, $0C, $01
	db $00, $F0, $0E, $01
	db $F0, $F8, $1C, $01
	db $00, $F8, $1E, $01
	db OAM_ENTRY_END
	db $F0, $F0, $00, $01
	db $F0, $F8, $10, $01
	db $F0, $00, $20, $01
	db $00, $08, $32, $01
	db $00, $F0, $02, $01
	db $00, $00, $22, $01
	db $00, $F8, $12, $01
	db OAM_ENTRY_END
	db $F0, $08, $00, $21
	db $F0, $00, $10, $21
	db $F0, $F8, $20, $21
	db $00, $F0, $32, $21
	db $00, $08, $02, $21
	db $00, $F8, $22, $21
	db $00, $00, $12, $21
	db OAM_ENTRY_END
	db $F0, $F0, $40, $01
	db $F0, $08, $70, $01
	db $F0, $00, $60, $01
	db $F0, $F8, $50, $01
	db $00, $08, $72, $01
	db $00, $F0, $42, $01
	db $00, $00, $62, $01
	db $00, $F8, $52, $01
	db OAM_ENTRY_END
	db $F0, $08, $40, $21
	db $F0, $F0, $70, $21
	db $F0, $F8, $60, $21
	db $F0, $00, $50, $21
	db $00, $F0, $72, $21
	db $00, $08, $42, $21
	db $00, $F8, $62, $21
	db $00, $00, $52, $21
	db OAM_ENTRY_END
	;Kirby
	db $F8, $00, $3A, $00
	db $F8, $F8, $2A, $00
	db OAM_ENTRY_END
	db $F8, $00, $5A, $00
	db $F8, $F8, $4A, $00
	db OAM_ENTRY_END
	db $F8, $F7, $3A, $20
	db $F8, $FF, $2A, $20
	db OAM_ENTRY_END 
	db $F8, $F7, $3A, $20
	db $F8, $FF, $34, $20
	db OAM_ENTRY_END 
	db $F7, $F7, $3A, $60
	db $F7, $FF, $2A, $60
	db OAM_ENTRY_END
	db $F7, $F7, $5A, $60
	db $F7, $FF, $4A, $60
	db OAM_ENTRY_END
	db $F7, $00, $3A, $40
	db $F7, $F8, $2A, $40
	db OAM_ENTRY_END 
	db $F8, $00, $3A, $00
	db $F8, $F8, $34, $00
	db OAM_ENTRY_END 
	db $F8, $F8, $54, $20
	db $F8, $00, $44, $20
	db OAM_ENTRY_END 
	db $F8, $F8, $74, $20
	db $F8, $00, $64, $20
	db OAM_ENTRY_END 
	db $F8, $F8, $76, $20
	db $F8, $00, $66, $20
	db OAM_ENTRY_END
	db $F8, $00, $56, $00
	db $F8, $F8, $46, $00
	db OAM_ENTRY_END
	db $F8, $F8, $56, $20
	db $F8, $00, $46, $20 
	db OAM_ENTRY_END
	db $F8, $00, $18, $00
	db $F8, $F8, $08, $00
	db OAM_ENTRY_END
	db $F8, $00, $38, $00
	db $F8, $F8, $28, $00
	db OAM_ENTRY_END
	db $F8, $00, $58, $00
	db $F8, $F8, $48, $00
	db OAM_ENTRY_END
	db $F8, $00, $78, $00
	db $F8, $F8, $68, $00
	db OAM_ENTRY_END
	db $F8, $00, $1A, $00
	db $F8, $F8, $0A, $00
	db OAM_ENTRY_END
	db $F8, $FC, $36, $00
	db OAM_ENTRY_END
	;Dedede
	db $F2, $F4, $04, $01
	db $F2, $04, $24, $01
	db $F2, $FC, $14, $01
	db $02, $F4, $06, $01
	db $02, $04, $26, $01
	db $02, $FC, $16, $01
	db OAM_ENTRY_END
	db $F2, $04, $04, $21
	db $F2, $F4, $24, $21
	db $F2, $FC, $14, $21
	db $02, $04, $06, $21
	db $02, $F4, $26, $21
	db $02, $FC, $16, $21
	db OAM_ENTRY_END
	;Bumper
	db $EC, $F4, $2C, $01
	db $EC, $04, $4C, $01
	db $EC, $FC, $3C, $01
	db $FC, $04, $4E, $01
	db $FC, $F4, $2E, $01
	db $FC, $FC, $3E, $01
	db OAM_ENTRY_END
	db $EC, $F4, $5C, $01
	db $EC, $04, $7C, $01
	db $EC, $FC, $6C, $01
	db $FC, $F4, $5E, $01
	db $FC, $04, $7E, $01
	db $FC, $FC, $6E, $01
	;Kirby
	db OAM_ENTRY_END
	db $F8, $00, $7A, $00
	db $F8, $F8, $6A, $00
	db OAM_ENTRY_END
	;Dedede w/ stars
	db $E5, $04, $30, $23
	db $E6, $F4, $30, $23
	db $E2, $FB, $30, $03
	db $F0, $08, $0C, $21
	db $F0, $00, $1C, $21
	db $00, $08, $0E, $21
	db $00, $00, $1E, $21
	db $F0, $F0, $0C, $01
	db $00, $F0, $0E, $01
	db $F0, $F8, $1C, $01
	db $00, $F8, $1E, $01
	db OAM_ENTRY_END
	db $E3, $06, $30, $23
	db $E4, $F2, $30, $23
	db $DF, $FB, $30, $03
	db $F0, $08, $0C, $21
	db $F0, $00, $1C, $21
	db $00, $08, $0E, $21
	db $00, $00, $1E, $21
	db $F0, $F0, $0C, $01
	db $00, $F0, $0E, $01
	db $F0, $F8, $1C, $01
	db $00, $F8, $1E, $01
	db OAM_ENTRY_END
	db $E1, $08, $30, $23
	db $E2, $F0, $30, $23
	db $DC, $FB, $30, $03
	db $F0, $08, $0C, $21
	db $F0, $00, $1C, $21
	db $00, $08, $0E, $21
	db $00, $00, $1E, $21
	db $F0, $F0, $0C, $01
	db $00, $F0, $0E, $01
	db $F0, $F8, $1C, $01
	db $00, $F8, $1E, $01
	db OAM_ENTRY_END
	db $DF, $0B, $30, $23
	db $E0, $EE, $30, $23
	db $D9, $FB, $30, $03
	db $F0, $08, $0C, $21
	db $F0, $00, $1C, $21
	db $00, $08, $0E, $21
	db $00, $00, $1E, $21
	db $F0, $F0, $0C, $01
	db $00, $F0, $0E, $01
	db $F0, $F8, $1C, $01
	db $00, $F8, $1E, $01
	db OAM_ENTRY_END
	;Stars
	db $10, $FC, $30, $03
	db $FD, $18, $30, $43
	db $FD, $E1, $30, $63
	db $E1, $FD, $30, $43
	db OAM_ENTRY_END
	db $09, $08, $30, $43
	db $E8, $0A, $30, $23
	db $E7, $F1, $30, $23
	db $09, $F0, $30, $43
	db OAM_ENTRY_END
	db $09, $FC, $30, $43
	db $F6, $08, $30, $23
	db $F5, $F0, $30, $03
	db $E9, $FE, $30, $23
	db OAM_ENTRY_END
	db $F1, $01, $30, $23
	db $F1, $F7, $30, $03
	db $02, $01, $30, $63
	db $02, $F7, $30, $43
	db OAM_ENTRY_END
	;Side bumper hit
	db $F0, $05, $BC, $00
	db $F0, $FD, $AC, $00
	db $00, $05, $BE, $00
	db $00, $FD, $AE, $00
	db $00, $F5, $9E, $00
	db OAM_ENTRY_END
	db $F0, $F3, $BC, $20
	db $F0, $FB, $AC, $20
	db $00, $F3, $BE, $20
	db $00, $FB, $AE, $20
	db $00, $03, $9E, $20
	db OAM_ENTRY_END
	;Side bumper normal
	db $F0, $FD, $CE, $00
	db $F0, $05, $DE, $00
	db $00, $F5, $CC, $00
	db $00, $FD, $DC, $00
	db $00, $05, $EC, $00
	db OAM_ENTRY_END
	db $F0, $FB, $CE, $20
	db $00, $03, $CC, $20
	db $00, $FB, $DC, $20
	db $00, $F3, $EC, $20
	db $F0, $F3, $DE, $20
	db OAM_ENTRY_END
	;1x bumper
	db $F8, $00, $9C, $06
	db $F8, $F8, $8C, $06
	db OAM_ENTRY_END
	;2x bumper
	db $F8, $00, $F0, $06
	db $F8, $F8, $E0, $06
	db OAM_ENTRY_END
	;3x bumper
	db $F8, $00, $9C, $06
	db $F8, $F8, $C8, $06
	db OAM_ENTRY_END
	
SECTION "Scores OAM",ROMX[$4B0E],BANK[$0B]
	db $00, $00, $D2, $02
	db $00, $08, $D2, $02
	db $00, $10, $D2, $02
	db $00, $18, $D2, $02
	db $00, $20, $D2, $02
	db $00, $28, $D2, $02
	db $00, $30, $D2, $02
	db $00, $38, $D2, $02
	db OAM_ENTRY_END
	db $00, $00, $D2, $02
	db $00, $08, $D2, $02
	db $00, $10, $E0, $02
	db $00, $18, $E0, $02
	db $00, $20, $E0, $02
	db $00, $28, $D2, $02
	db $00, $30, $D2, $02
	db $00, $38, $D2, $02
	db OAM_ENTRY_END
	db $00, $00, $D2, $02
	db $00, $08, $D2, $02
	db $00, $10, $E0, $02
	db $00, $18, $E0, $02
	db $00, $20, $E0, $02
	db $00, $28, $FC, $02
	db $00, $30, $D2, $02
	db $00, $38, $D2, $02
	db OAM_ENTRY_END
	
SECTION "Below Drain OAM",ROMX[$4BBF],BANK[$0B]
	;Kirby
	db $F8, $00, $10, $00
	db $F8, $F8, $00, $00
	db OAM_ENTRY_END
	db $F8, $00, $30, $00
	db $F8, $F8, $20, $00
	db OAM_ENTRY_END
	db $F8, $00, $12, $00
	db $F8, $F8, $02, $00
	db OAM_ENTRY_END
	db $F8, $00, $32, $00
	db $F8, $F8, $22, $00
	db OAM_ENTRY_END
	db $F8, $00, $14, $00
	db $F8, $F8, $04, $00
	db OAM_ENTRY_END
	db $F8, $00, $34, $00
	db $F8, $F8, $24, $00
	db OAM_ENTRY_END
	db $F8, $00, $36, $00
	db $F8, $F8, $26, $00
	;Star platform
	db OAM_ENTRY_END
	db $08, $08, $40, $23
	db $08, $F0, $40, $03
	db $08, $00, $60, $03
	db $08, $F8, $50, $03
	db OAM_ENTRY_END
	db $08, $08, $42, $23
	db $08, $F0, $42, $03
	db $08, $00, $62, $03
	db $08, $F8, $52, $03
	db OAM_ENTRY_END
	db $08, $08, $44, $23
	db $08, $F0, $44, $03
	db $08, $00, $64, $03
	db $08, $F8, $54, $03
	db OAM_ENTRY_END
	db $08, $00, $66, $03
	db $08, $F8, $56, $03
	db OAM_ENTRY_END
	db $08, $00, $68, $03
	db $08, $F8, $58, $03
	db OAM_ENTRY_END
	;Kirby
	db $F8, $00, $16, $00
	db $F8, $F8, $06, $00
	db OAM_ENTRY_END
	db $F8, $F8, $16, $20
	db $F8, $00, $06, $20
	db OAM_ENTRY_END
	db $F8, $F8, $16, $60
	db $F8, $00, $06, $60
	db OAM_ENTRY_END
	db $F8, $00, $16, $40
	db $F8, $F8, $06, $40
	db OAM_ENTRY_END
	db $F8, $00, $18, $00
	db $F8, $F8, $08, $00
	db OAM_ENTRY_END
	db $F8, $00, $38, $00
	db $F8, $F8, $28, $00
	;"PUSH A" Text
	db OAM_ENTRY_END
	db $F8, $10, $5A, $06
	db $F8, $08, $4A, $06
	db $F8, $00, $3A, $06
	db $F8, $F8, $2A, $06
	db $F8, $F0, $1A, $06
	db $F8, $E8, $0A, $06
	db OAM_ENTRY_END
	db $F8, $10, $5C, $06
	db $F8, $08, $4C, $06
	db $F8, $00, $3A, $06
	db $F8, $F8, $2A, $06
	db $F8, $F0, $1A, $06
	db $F8, $E8, $0A, $06
	db OAM_ENTRY_END
	db $F3, $01, $0C, $00
	db $F3, $F7, $0C, $00
	db $F1, $FC, $0C, $00
	db $F8, $02, $0C, $00
	db $F8, $F6, $0C, $00
	db $F8, $00, $3C, $00
	db $F8, $F8, $2C, $00
	db OAM_ENTRY_END
	;Kirby explosion
	db $F1, $03, $0C, $00
	db $F1, $F5, $0C, $00
	db $EE, $FC, $0C, $00
	db $F8, $05, $0C, $00
	db $F8, $F3, $0C, $00
	db $F8, $00, $3C, $00
	db $F8, $F8, $2C, $00
	db OAM_ENTRY_END
	db $EF, $05, $0C, $00
	db $EF, $F3, $0C, $00
	db $EB, $FC, $0C, $00
	db $F8, $08, $0C, $00
	db $F8, $F0, $0C, $00
	db $F8, $00, $3C, $00
	db $F8, $F8, $2C, $00
	db OAM_ENTRY_END
	db $F8, $FC, $0C, $00
	db $ED, $07, $0C, $00
	db $ED, $F1, $0C, $00
	db $E8, $FC, $0C, $00
	db $F8, $0B, $0C, $00
	db $F8, $ED, $0C, $00
	db OAM_ENTRY_END
	db $EB, $09, $1C, $20
	db $EB, $EF, $1C, $00
	db $E5, $FC, $0E, $20
	db $F8, $0E, $1E, $20
	db $F8, $EA, $1E, $00
	db $F8, $FC, $0C, $00
	db OAM_ENTRY_END

;Array for this one has pointers to bank 0
SECTION "Tookey OAM",ROMX[$4D7C],BANK[$0B]
	;Maxim Tomato
	db $F8, $00, $B4, $01
	db $F8, $F8, $A4, $01
	db OAM_ENTRY_END
	;Tooky
	db $F8, $00, $98, $01
	db $F8, $F8, $88, $01
	db OAM_ENTRY_END
	db $F8, $F8, $98, $21
	db $F8, $00, $88, $21
	db OAM_ENTRY_END
	db $F8, $00, $96, $01
	db $F8, $F8, $86, $01
	db OAM_ENTRY_END
	db $F8, $F8, $96, $21
	db $F8, $00, $86, $21
	db OAM_ENTRY_END
	db $F8, $00, $B6, $01
	db $F8, $F8, $A6, $01
	db OAM_ENTRY_END
	db $F8, $F8, $B6, $21
	db $F8, $00, $A6, $21
	db OAM_ENTRY_END
	db $F8, $00, $D6, $01
	db $F8, $F8, $C6, $01
	db OAM_ENTRY_END
	db $F8, $F8, $D6, $21
	db $F8, $00, $C6, $21
	db OAM_ENTRY_END
	;Tookey Shadow 
	db $F8, $00, $E6, $21
	db $F8, $F8, $E6, $01
	db OAM_ENTRY_END
	
SECTION "Poppy Jr. OAM",ROMX[$4DDF],BANK[$0B]
	db $F8, $00, $F8, $02
	db $F8, $F8, $E8, $02
	db OAM_ENTRY_END
	db $F8, $00, $FA, $02
	db $F8, $F8, $EA, $02
	db OAM_ENTRY_END
	db $F8, $FF, $EA, $22
	db $F8, $F7, $FA, $22
	db OAM_ENTRY_END
	
	
;Array for this one has pointers to bank 0
SECTION "Twizzy OAM",ROMX[$4EB7],BANK[$0B]
	;Eggs
	db $F8, $00, $84, $23
	db $08, $00, $CE, $23
	db $08, $F8, $CE, $03
	db $F8, $F8, $84, $03
	db OAM_ENTRY_END
	db $F4, $00, $84, $23
	db $F4, $F8, $84, $03
	db $04, $00, $DE, $23
	db $04, $F8, $DE, $03
	db OAM_ENTRY_END
	db $F8, $00, $84, $23
	db $08, $00, $CE, $23
	db $08, $F8, $CE, $03
	db $F8, $F8, $94, $03
	db OAM_ENTRY_END
	db $F4, $00, $84, $23
	db $F4, $F8, $94, $03
	db $04, $00, $DE, $23
	db $04, $F8, $DE, $03
	db OAM_ENTRY_END
	db $F8, $00, $94, $23
	db $08, $00, $CE, $23
	db $08, $F8, $CE, $03
	db $F8, $F8, $94, $03
	db OAM_ENTRY_END
	db $F4, $00, $94, $23
	db $F4, $F8, $94, $03
	db $04, $00, $DE, $23
	db $04, $F8, $DE, $03
	db OAM_ENTRY_END
	db $F8, $00, $9A, $03
	db $F8, $F8, $8A, $03
	db $08, $00, $CE, $23
	db $08, $F8, $CE, $03
	db OAM_ENTRY_END
	db $F8, $00, $DC, $03
	db $F8, $F8, $CC, $03
	db $08, $00, $CE, $23
	db $08, $F8, $CE, $03
	db OAM_ENTRY_END
	db $F4, $00, $DC, $03
	db $F4, $F8, $CC, $03
	db $04, $00, $DE, $23
	db $04, $F8, $DE, $03
	db OAM_ENTRY_END
	db $F9, $00, $9C, $03
	db $F9, $F8, $8C, $03
	db $09, $00, $8E, $23
	db $09, $F8, $8E, $03
	db OAM_ENTRY_END
	db $F9, $00, $BC, $03
	db $F9, $F8, $AC, $03
	db $09, $00, $AE, $23
	db $09, $F8, $AE, $03
	db OAM_ENTRY_END
	db $09, $00, $8E, $23
	db $09, $F8, $8E, $03
	db $F9, $00, $BA, $03
	db $F9, $F8, $AA, $03
	db OAM_ENTRY_END
	db $F9, $00, $DA, $03
	db $F9, $F8, $CA, $03
	db $09, $00, $AE, $23
	db $09, $F8, $AE, $03
	db OAM_ENTRY_END
	db $F9, $F8, $BE, $03
	db $F9, $00, $BC, $03
	db $09, $00, $AE, $23
	db $09, $F8, $AE, $03
	db OAM_ENTRY_END
	db $F9, $F8, $9E, $03
	db $F9, $00, $9C, $03
	db $09, $00, $8E, $23
	db $09, $F8, $8E, $03
	db OAM_ENTRY_END
	db $09, $F8, $8E, $03
	db $09, $00, $8E, $23
	db $F9, $F8, $BA, $23
	db $F9, $00, $AA, $23
	db OAM_ENTRY_END
	db $F9, $F8, $DA, $23
	db $F9, $00, $CA, $23
	db $09, $F8, $AE, $03
	db $09, $00, $AE, $23
	db OAM_ENTRY_END
	;Apple
	db $F8, $00, $D8, $01
	db $F8, $F8, $C8, $01
	db OAM_ENTRY_END
	;Bomb
	db $F8, $00, $B8, $02
	db $F8, $F8, $A8, $02
	db OAM_ENTRY_END
	
SECTION "Scarfy OAM",ROMX[$502F],BANK[$0B]
	;Big Scarfy
	db $04, $04, $62, $24
	db $F4, $04, $60, $24
	db $04, $FC, $72, $04
	db $04, $F4, $62, $04
	db $F4, $F4, $60, $04
	db $F4, $FC, $70, $04
	db OAM_ENTRY_END
	db $04, $04, $6A, $24
	db $F4, $04, $68, $24
	db $04, $FC, $7A, $04
	db $04, $F4, $6A, $04
	db $F4, $F4, $68, $04
	db $F4, $FC, $78, $04
	db OAM_ENTRY_END
	db $04, $F4, $66, $04
	db $F4, $F4, $64, $04
	db $04, $04, $66, $24
	db $F4, $04, $64, $24
	db $04, $FC, $76, $24
	db $F4, $FC, $74, $24
	db OAM_ENTRY_END
	;Samll Scarfys
	db $F8, $00, $7C, $04
	db $F8, $F8, $6C, $04
	db OAM_ENTRY_END
	db $F8, $F8, $7C, $24
	db $F8, $00, $6C, $24
	db OAM_ENTRY_END
	db $F8, $00, $7E, $04
	db $F8, $F8, $6E, $04
	db OAM_ENTRY_END
	db $F8, $F8, $7E, $24
	db $F8, $00, $6E, $24
	db OAM_ENTRY_END
	;Small Scarfys agitated
	db $F8, $00, $7C, $05
	db $F8, $F8, $58, $05
	db OAM_ENTRY_END
	db $F8, $F8, $7C, $25
	db $F8, $00, $58, $25
	db OAM_ENTRY_END
	db $F8, $00, $7E, $05
	db $F8, $F8, $5A, $05
	db OAM_ENTRY_END
	db $F8, $F8, $7E, $25
	db $F8, $00, $5A, $25
	db OAM_ENTRY_END
	;Kirby w/ Scarfys
	db $F8, $00, $E0, $00
	db $F8, $F8, $8E, $00
	db OAM_ENTRY_END
	db $F8, $F8, $E0, $20
	db $F8, $00, $8E, $20
	db OAM_ENTRY_END
	db $F8, $00, $E0, $00
	db $F8, $F8, $D0, $00
	db OAM_ENTRY_END
	db $F8, $F8, $E0, $20
	db $F8, $00, $D0, $20
	db OAM_ENTRY_END
	db $F8, $00, $F8, $00
	db $F8, $F8, $E8, $00
	db OAM_ENTRY_END
	db $F8, $00, $F4, $00
	db $F8, $F8, $E4, $00
	db OAM_ENTRY_END
	
SECTION "Booler OAM",ROMX[$511F],BANK[$0B]
	db $F8, $00, $4A, $02
	db $F8, $F8, $D2, $02
	db OAM_ENTRY_END
	db $F8, $F8, $4A, $22
	db $F8, $00, $D2, $22
	db OAM_ENTRY_END
	db $F8, $00, $F2, $02
	db $F8, $F8, $E2, $02
	db OAM_ENTRY_END
	db $F8, $F8, $F2, $22
	db $F8, $00, $E2, $22
	db OAM_ENTRY_END
	db $F8, $00, $4C, $02
	db $F8, $F8, $48, $02
	db OAM_ENTRY_END
	db $F8, $F8, $4C, $22
	db $F8, $00, $48, $22
	db OAM_ENTRY_END
	db $F8, $00, $90, $02
	db $F8, $F8, $82, $02
	db OAM_ENTRY_END
	db $F8, $00, $5C, $22
	db $F8, $F8, $5C, $02
	db OAM_ENTRY_END
	db $F8, $F8, $90, $22
	db $F8, $00, $82, $22
	db OAM_ENTRY_END
	db $F8, $F8, $C0, $22
	db $F8, $00, $B0, $22
	db OAM_ENTRY_END
	db $F8, $00, $B2, $22
	db $F8, $F8, $B2, $02
	db OAM_ENTRY_END
	db $F8, $00, $C0, $02
	db $F8, $F8, $B0, $02
	db OAM_ENTRY_END
	db $F8, $00, $A2, $02
	db $F8, $F8, $92, $02
	db OAM_ENTRY_END
	
SECTION "E-X-T-R-A Letters OAM",ROMX[$51A6],BANK[$0B]
	db $F8, $FC, $60, $00
	db OAM_ENTRY_END
	db $F8, $FC, $62, $00
	db OAM_ENTRY_END
	db $F8, $FC, $64, $00
	db OAM_ENTRY_END
	db $F8, $FC, $66, $00
	db OAM_ENTRY_END
	db $F8, $FC, $68, $00
	db OAM_ENTRY_END
	db $F8, $FC, $78, $00
	db OAM_ENTRY_END
	
;Array for this one has pointers to bank 0
SECTION "E-X-T-R-A Spheres OAM",ROMX[$51F1],BANK[$0B]
	db $F8, $00, $72, $03
	db $F8, $F8, $70, $03
	db OAM_ENTRY_END
	db $F8, $F8, $74, $03
	db $F8, $00, $74, $23
	db OAM_ENTRY_END
	db $F8, $F8, $6A, $03
	db $F8, $00, $6A, $23
	db OAM_ENTRY_END
	db $F8, $00, $7C, $03
	db $F8, $F8, $6C, $03
	db OAM_ENTRY_END
	db $F8, $F8, $6E, $03
	db $F8, $00, $6E, $23
	db OAM_ENTRY_END
	
SECTION "Hub Cannon OAM",ROMX[$5257],BANK[$0B]
	;Cannon straight
	db $FC, $04, $4A, $22
	db $0C, $04, $4C, $22
	db $0C, $F4, $4C, $02
	db $FC, $F4, $4A, $02
	db $FC, $FC, $5A, $02
	db $0C, $FC, $5C, $02
	db OAM_ENTRY_END
	;Cannon straight w/ Kirby
	db $E8, $00, $48, $20
	db $E8, $F8, $48, $00
	db $F8, $04, $4A, $22
	db $08, $04, $4C, $22
	db $08, $F4, $4C, $02
	db $F8, $F4, $4A, $02
	db $F8, $FC, $5A, $02
	db $08, $FC, $5C, $02
	db OAM_ENTRY_END
	db $E4, $00, $48, $20
	db $E4, $F8, $48, $00
	db $F4, $04, $4A, $22
	db $04, $04, $4C, $22
	db $04, $F4, $4C, $02
	db $F4, $F4, $4A, $02
	db $F4, $FC, $5A, $02
	db $04, $FC, $5C, $02
	db OAM_ENTRY_END
	db $E4, $00, $58, $20
	db $E4, $F8, $58, $00
	db $F4, $04, $4A, $22
	db $04, $04, $4C, $22
	db $04, $F4, $4C, $02
	db $F4, $F4, $4A, $02
	db $F4, $FC, $5A, $02
	db $04, $FC, $5C, $02
	db OAM_ENTRY_END
	db $F4, $04, $4A, $22
	db $04, $04, $4C, $22
	db $04, $F4, $4C, $02
	db $F4, $F4, $4A, $02
	db $F4, $FC, $5A, $02
	db $04, $FC, $5C, $02
	db OAM_ENTRY_END
	;Cannon fire
	db $F0, $FC, $FE, $23
	db $F4, $F1, $FE, $23
	db $F4, $07, $FE, $23
	db $FC, $04, $30, $22
	db $FC, $F4, $30, $02
	db $FC, $FC, $32, $22
	db OAM_ENTRY_END
	db $E7, $FC, $FE, $23
	db $F0, $ED, $FE, $23
	db $F0, $0B, $FE, $23
	db $FC, $04, $30, $22
	db $FC, $F4, $30, $02
	db $FC, $FC, $32, $22
	db OAM_ENTRY_END
	db $E2, $FC, $FE, $23
	db $ED, $EB, $FE, $23
	db $ED, $0E, $FE, $23
	db $FC, $04, $30, $22
	db $FC, $F4, $30, $02
	db $FC, $FC, $32, $22
	db OAM_ENTRY_END
	db $E0, $FC, $FE, $23
	db $EB, $E9, $FE, $23
	db $EB, $10, $FE, $23
	db $FC, $04, $30, $22
	db $FC, $F4, $30, $02
	db $FC, $FC, $32, $22
	db OAM_ENTRY_END
	;Cannon left
	db $04, $F1, $26, $02
	db $04, $F9, $36, $02
	db $E4, $F9, $24, $02
	db $E4, $01, $4E, $02
	db $04, $01, $CE, $02
	db $F4, $01, $7E, $02
	db $F4, $F9, $7A, $02
	db $F4, $F1, $76, $02
	db OAM_ENTRY_END
	;Cannon right
	db $04, $07, $26, $22
	db $04, $FF, $36, $22
	db $E4, $FF, $24, $22
	db $E4, $F7, $4E, $22
	db $04, $F7, $CE, $22
	db $F4, $F7, $7E, $22
	db $F4, $FF, $7A, $22
	db $F4, $07, $76, $22
	db OAM_ENTRY_END
	db $0A, $F4, $26, $02
	db $0A, $FC, $36, $02
	db $EA, $FC, $24, $02
	db $E8, $01, $FE, $63
	db $F9, $EE, $FE, $03
	db $F1, $F6, $FE, $23
	db $EA, $04, $4E, $02
	db $0A, $04, $CE, $02
	db $FA, $04, $7E, $02
	db $FA, $FC, $7A, $02
	db $FA, $F4, $76, $02
	db OAM_ENTRY_END
	db $0A, $F4, $26, $02
	db $0A, $FC, $36, $02
	db $EA, $FC, $24, $02
	db $E2, $01, $FE, $63
	db $F7, $EA, $FE, $03
	db $E9, $F2, $FE, $23
	db $EA, $04, $4E, $02
	db $0A, $04, $CE, $02
	db $FA, $04, $7E, $02
	db $FA, $FC, $7A, $02
	db $FA, $F4, $76, $02
	db OAM_ENTRY_END
	db $0A, $F4, $26, $02
	db $0A, $FC, $36, $02
	db $EA, $FC, $24, $02
	db $DF, $02, $FE, $63
	db $F6, $E8, $FE, $03
	db $E6, $F0, $FE, $23
	db $EA, $04, $4E, $02
	db $0A, $04, $CE, $02
	db $FA, $04, $7E, $02
	db $FA, $FC, $7A, $02
	db $FA, $F4, $76, $02
	db OAM_ENTRY_END
	db $0A, $F4, $26, $02
	db $0A, $FC, $36, $02
	db $EA, $FC, $24, $02
	db $DD, $02, $FE, $63
	db $F5, $E6, $FE, $03
	db $E4, $EF, $FE, $23
	db $EA, $04, $4E, $02
	db $0A, $04, $CE, $02
	db $FA, $04, $7E, $02
	db $FA, $FC, $7A, $02
	db $FA, $F4, $76, $02
	db OAM_ENTRY_END
	db $0A, $04, $26, $22
	db $0A, $FC, $36, $22
	db $EA, $FC, $24, $22
	db $E8, $F7, $FE, $43
	db $F9, $0A, $FE, $23
	db $F1, $02, $FE, $03
	db $EA, $F4, $4E, $22
	db $0A, $F4, $CE, $22
	db $FA, $F4, $7E, $22
	db $FA, $FC, $7A, $22
	db $FA, $04, $76, $22
	db OAM_ENTRY_END
	db $0A, $04, $26, $22
	db $0A, $FC, $36, $22
	db $EA, $FC, $24, $22
	db $E2, $F7, $FE, $43
	db $F7, $0E, $FE, $23
	db $E9, $06, $FE, $03
	db $EA, $F4, $4E, $22
	db $0A, $F4, $CE, $22
	db $FA, $F4, $7E, $22
	db $FA, $FC, $7A, $22
	db $FA, $04, $76, $22
	db OAM_ENTRY_END
	db $0A, $04, $26, $22
	db $0A, $FC, $36, $22
	db $EA, $FC, $24, $22
	db $DF, $F6, $FE, $43
	db $F6, $10, $FE, $23
	db $E6, $08, $FE, $03
	db $EA, $F4, $4E, $22
	db $0A, $F4, $CE, $22
	db $FA, $F4, $7E, $22
	db $FA, $FC, $7A, $22
	db $FA, $04, $76, $22
	db OAM_ENTRY_END
	db $0A, $04, $26, $22
	db $0A, $FC, $36, $22
	db $EA, $FC, $24, $22
	db $DD, $F6, $FE, $43
	db $F5, $12, $FE, $23
	db $E4, $09, $FE, $03
	db $EA, $F4, $4E, $22
	db $0A, $F4, $CE, $22
	db $FA, $F4, $7E, $22
	db $FA, $FC, $7A, $22
	db $FA, $04, $76, $22
	db OAM_ENTRY_END
	
;======================================
;BANK D
;======================================
SECTION "Ending Bank D OAM",ROMX[$4164],BANK[$0D]
	;Dedede
	db $F0, $F0, $00, $01
	db $F0, $00, $20, $01
	db $F0, $F8, $10, $01
	db $00, $F0, $02, $01
	db $00, $08, $32, $01
	db $00, $00, $22, $01
	db $00, $F8, $12, $01
	db OAM_ENTRY_END
	db $F0, $08, $34, $01
	db $F0, $F0, $04, $01
	db $F0, $00, $24, $01
	db $F0, $F8, $14, $01
	db $00, $08, $36, $01
	db $00, $F0, $06, $01
	db $00, $F8, $16, $01
	db $00, $00, $26, $01
	db OAM_ENTRY_END
	db $00, $F0, $34, $61
	db $00, $08, $04, $61
	db $00, $F8, $24, $61
	db $00, $00, $14, $61
	db $F0, $F0, $36, $61
	db $F0, $08, $06, $61
	db $F0, $00, $16, $61
	db $F0, $F8, $26, $61
	db OAM_ENTRY_END
	db $00, $08, $00, $61
	db $00, $F8, $20, $61
	db $00, $00, $10, $61
	db $F0, $08, $02, $61
	db $F0, $F0, $32, $61
	db $F0, $F8, $22, $61
	db $F0, $00, $12, $61
	db OAM_ENTRY_END
	db $F0, $08, $08, $21
	db $F0, $00, $18, $21
	db $00, $08, $0A, $21
	db $00, $00, $1A, $21
	db $F0, $F0, $08, $01
	db $F0, $F8, $18, $01
	db $00, $F0, $0A, $01
	db $00, $F8, $1A, $01
	db OAM_ENTRY_END
	db $00, $08, $08, $61
	db $00, $00, $18, $61
	db $F0, $08, $F8, $61
	db $F0, $00, $FA, $61
	db $00, $F0, $08, $41
	db $00, $F8, $18, $41
	db $F0, $F0, $F8, $41
	db $F0, $F8, $FA, $41
	db OAM_ENTRY_END
	db $F0, $08, $00, $21
	db $F0, $F8, $20, $21
	db $F0, $00, $10, $21
	db $00, $08, $02, $21
	db $00, $F0, $32, $21
	db $00, $F8, $22, $21
	db $00, $00, $12, $21
	db OAM_ENTRY_END
	db $F0, $F0, $34, $21
	db $F0, $08, $04, $21
	db $F0, $F8, $24, $21
	db $F0, $00, $14, $21
	db $00, $F0, $36, $21
	db $00, $08, $06, $21
	db $00, $00, $16, $21
	db $00, $F8, $26, $21
	db OAM_ENTRY_END
	;Gordo
	db $F8, $00, $30, $63
	db $F8, $F8, $30, $03
	db OAM_ENTRY_END
	db $F8, $F8, $30, $43
	db $F8, $00, $30, $23
	db OAM_ENTRY_END
	;Poppy
	db $04, $00, $4A, $02
	db $04, $F8, $3A, $02
	db $F9, $FE, $48, $02
	db $F9, $F6, $38, $02
	db OAM_ENTRY_END
	db $04, $00, $4A, $02
	db $04, $F8, $2A, $02
	db $F9, $FF, $48, $02
	db $F9, $F7, $38, $02
	db OAM_ENTRY_END
	db $04, $FB, $2A, $22
	db $04, $F3, $4A, $22
	db $F9, $00, $48, $02
	db $F9, $F8, $38, $02
	db OAM_ENTRY_END
	db $04, $FC, $3A, $22
	db $04, $F4, $4A, $22
	db $F9, $01, $48, $02
	db $F9, $F9, $38, $02
	db OAM_ENTRY_END
	;Kracko
	db $00, $10, $2E, $62
	db $F0, $10, $2E, $22
	db $F8, $08, $1E, $22
	db $E8, $08, $4C, $22
	db $08, $08, $4C, $62
	db $08, $00, $5C, $62
	db $E8, $00, $5C, $22
	db $08, $F8, $5C, $42
	db $08, $F0, $4C, $42
	db $00, $E8, $2E, $42
	db $F0, $E8, $2E, $02
	db $F8, $F0, $1E, $02
	db $F8, $00, $4E, $02
	db $F8, $F8, $3E, $02
	db $E8, $F0, $4C, $02
	db $E8, $F8, $5C, $02
	db OAM_ENTRY_END
	db $F0, $10, $0E, $22
	db $E8, $08, $1C, $22
	db $F8, $08, $1E, $62
	db $00, $10, $0E, $62
	db $08, $08, $1C, $62
	db $08, $00, $2C, $62
	db $08, $F8, $2C, $42
	db $00, $E8, $0E, $42
	db $08, $F0, $1C, $42
	db $E8, $00, $2C, $22
	db $F8, $F8, $3E, $02
	db $F8, $00, $4E, $02
	db $F8, $F0, $1E, $02
	db $F0, $E8, $0E, $02
	db $E8, $F0, $1C, $02
	db $E8, $F8, $2C, $02
	db OAM_ENTRY_END
	;Twister
	db $F8, $FE, $3C, $03
	db $F8, $F6, $0C, $03
	db OAM_ENTRY_END
	db $F8, $FF, $58, $03
	db $F8, $F7, $28, $03
	db OAM_ENTRY_END
	db $F8, $02, $28, $23
	db $F8, $FA, $58, $23
	db OAM_ENTRY_END
	db $F8, $03, $0C, $23
	db $F8, $FB, $3C, $23
	db OAM_ENTRY_END
	;Chuckie
	db $F8, $00, $70, $02
	db $F8, $F8, $60, $02
	db OAM_ENTRY_END
	db $F8, $F8, $70, $22
	db $F8, $00, $60, $22
	db OAM_ENTRY_END
	db $F8, $00, $72, $02
	db $F8, $F8, $62, $02
	db OAM_ENTRY_END
	db $F8, $F8, $72, $22
	db $F8, $00, $62, $22
	db OAM_ENTRY_END
	;Bronto Burt
	db $F8, $00, $74, $00
	db $F8, $F8, $64, $00
	db OAM_ENTRY_END
	db $F8, $00, $76, $00
	db $F8, $F8, $66, $00
	db OAM_ENTRY_END
	;UFO
	db $F8, $00, $78, $02
	db $F8, $F8, $68, $02
	db OAM_ENTRY_END
	db $F8, $F8, $78, $22
	db $F8, $00, $68, $22
	db OAM_ENTRY_END
	db $F8, $00, $7A, $02
	db $F8, $F8, $6A, $02
	db OAM_ENTRY_END
	db $F8, $F8, $7A, $22
	db $F8, $00, $6A, $22
	db OAM_ENTRY_END
	;Chilly
	db $F8, $00, $7C, $02
	db $F8, $F8, $6C, $02
	db OAM_ENTRY_END
	db $F8, $F8, $7C, $22
	db $F8, $00, $6C, $22
	db OAM_ENTRY_END
	db $F8, $00, $7E, $02
	db $F8, $F8, $6E, $02
	db OAM_ENTRY_END
	db $F8, $F8, $7E, $22
	db $F8, $00, $6E, $22
	db OAM_ENTRY_END
	;Mr. Bright
	db $00, $F4, $82, $04
	db $F0, $F4, $80, $04
	db $00, $04, $A2, $04
	db $F0, $04, $A0, $04
	db $F0, $FC, $90, $04
	db $00, $FC, $92, $04
	db OAM_ENTRY_END
	db $F0, $F4, $84, $04
	db $F0, $04, $A4, $04
	db $F0, $FC, $94, $04
	db $00, $F4, $86, $04
	db $00, $04, $A6, $04
	db $00, $FC, $96, $04
	db OAM_ENTRY_END
	;Booler
	db $F8, $00, $98, $02
	db $F8, $F8, $88, $02
	db OAM_ENTRY_END
	db $F8, $00, $9A, $02
	db $F8, $F8, $8A, $02
	db OAM_ENTRY_END
	db $F8, $00, $9C, $02
	db $F8, $F8, $8C, $02
	db OAM_ENTRY_END
	;Bounder
	db $F8, $00, $9E, $04
	db $F8, $F8, $8E, $04
	db OAM_ENTRY_END
	db $F8, $00, $BE, $04
	db $F8, $F8, $AE, $04
	db OAM_ENTRY_END
	;Cappy
	db $F8, $00, $BC, $01
	db $F8, $F8, $AC, $01
	db OAM_ENTRY_END
	db $F8, $F8, $BC, $21
	db $F8, $00, $AC, $21
	db OAM_ENTRY_END
	;Scarfy
	db $F8, $00, $C0, $04
	db $F8, $F8, $B0, $04
	db OAM_ENTRY_END
	db $F8, $00, $C2, $04
	db $F8, $F8, $B2, $04
	db OAM_ENTRY_END
	;Kabu
	db $F8, $00, $C4, $03
	db $F8, $F8, $B4, $03
	db OAM_ENTRY_END
	db $F8, $00, $C6, $23
	db $F8, $F8, $C6, $03
	db OAM_ENTRY_END
	db $F8, $F8, $C4, $23
	db $F8, $00, $B4, $23
	db OAM_ENTRY_END
	db $F8, $00, $C4, $03
	db $F8, $F8, $C4, $23
	db OAM_ENTRY_END
	db $F8, $00, $B6, $23
	db $F8, $F8, $B6, $03
	db OAM_ENTRY_END
	;Squishy
	db $F8, $00, $CA, $02
	db $F8, $F8, $C8, $02
	db OAM_ENTRY_END
	db $F8, $F0, $5A, $02
	db $F8, $00, $CE, $02
	db $F8, $F8, $CC, $02
	db OAM_ENTRY_END
	;Kirby
	db $F8, $00, $D0, $20
	db $F8, $F8, $E0, $20
	db OAM_ENTRY_END
	db $F8, $00, $D2, $20
	db $F8, $F8, $E2, $20
	db OAM_ENTRY_END
	db $F8, $00, $D4, $20
	db $F8, $F8, $E4, $20
	db OAM_ENTRY_END
	db $F8, $00, $D6, $20
	db $F8, $F8, $E6, $20
	db OAM_ENTRY_END
	db $F8, $00, $D8, $20
	db $F8, $F8, $E8, $20
	db OAM_ENTRY_END
	db $F8, $00, $DA, $20
	db $F8, $F8, $EA, $20
	db OAM_ENTRY_END
	db $F8, $00, $DC, $20
	db $F8, $F8, $EC, $20
	db OAM_ENTRY_END
	db $F8, $00, $DE, $20
	db $F8, $F8, $EE, $20
	db OAM_ENTRY_END
	;Broom Hatter
	db $F8, $00, $F2, $03
	db $F8, $F8, $F0, $03
	db OAM_ENTRY_END
	db $F8, $00, $F6, $03
	db $F8, $F8, $F4, $03
	db OAM_ENTRY_END
	;Kirby's Star
	db $EF, $06, $42, $20
	db $FC, $06, $44, $23
	db $ED, $F6, $46, $23
	db $FD, $F6, $56, $23
	db $FE, $FE, $54, $23
	db $EE, $FE, $52, $20
	db OAM_ENTRY_END
	;Flattened Kirby
	db $F8, $00, $B8, $00
	db $F8, $F8, $A8, $00
	db OAM_ENTRY_END
	
SECTION "Unk2 Bank D OAM",ROMX[$457C],BANK[$0D]
	db $F8, $00, $D4, $00
	db $F8, $F8, $C4, $00
	db OAM_ENTRY_END
	db $F8, $F8, $D4, $20
	db $F8, $00, $C4, $20
	db OAM_ENTRY_END
	db $F8, $00, $D6, $00
	db $F8, $F8, $C6, $00
	db OAM_ENTRY_END
	db $F8, $F8, $D6, $20
	db $F8, $00, $C6, $20
	db OAM_ENTRY_END
	db $F8, $00, $D8, $00
	db $F8, $F8, $C8, $00
	db OAM_ENTRY_END
	db $F8, $F8, $D8, $20
	db $F8, $00, $C8, $20
	db OAM_ENTRY_END
	db $F8, $00, $F2, $00
	db $F8, $F8, $E2, $00
	db OAM_ENTRY_END
	db $F8, $00, $DE, $20
	db $F8, $F8, $DE, $00
	db OAM_ENTRY_END
	db $F8, $00, $DA, $00
	db $F8, $F8, $CA, $00
	db OAM_ENTRY_END
	db $F8, $F8, $DA, $20
	db $F8, $00, $CA, $20
	db OAM_ENTRY_END
	db $F8, $00, $DC, $00
	db $F8, $F8, $CC, $00
	db OAM_ENTRY_END
	db $F8, $F8, $DC, $20
	db $F8, $00, $CC, $20
	db OAM_ENTRY_END
	db $F8, $FC, $A4, $00
	db OAM_ENTRY_END
	db $F8, $FC, $A4, $20
	db OAM_ENTRY_END
	db $F8, $00, $F8, $00
	db $F8, $F8, $E8, $00
	db OAM_ENTRY_END
	db $F8, $F8, $F8, $20
	db $F8, $00, $E8, $20
	db OAM_ENTRY_END
	db $F8, $00, $F6, $00
	db $F8, $F8, $E6, $00
	db OAM_ENTRY_END
	db $F8, $F8, $F6, $20
	db $F8, $00, $E6, $20
	db OAM_ENTRY_END
	db $F8, $F8, $F6, $60
	db $F8, $00, $E6, $60
	db OAM_ENTRY_END
	db $F8, $00, $F6, $40
	db $F8, $F8, $E6, $40
	db OAM_ENTRY_END
	db $F8, $00, $A2, $00
	db $F8, $F8, $A0, $00
	db OAM_ENTRY_END
	db $F8, $F8, $A2, $20
	db $F8, $00, $A0, $20
	db OAM_ENTRY_END
	db $F8, $00, $F4, $00
	db $F8, $F8, $E4, $00
	db OAM_ENTRY_END
	db $F8, $F8, $F4, $20
	db $F8, $00, $E4, $20
	db OAM_ENTRY_END
	db $F8, $00, $D2, $00
	db $F8, $F8, $C2, $00
	db OAM_ENTRY_END
	db $F8, $F8, $D2, $20
	db $F8, $00, $C2, $20
	db OAM_ENTRY_END
	db $F8, $00, $D0, $00
	db $F8, $F8, $C0, $00
	db OAM_ENTRY_END
	db $F8, $F8, $D0, $20
	db $F8, $00, $C0, $20
	db OAM_ENTRY_END
	db $F8, $00, $F0, $00
	db $F8, $F8, $E0, $00
	db OAM_ENTRY_END
	db $F8, $F8, $F0, $20
	db $F8, $00, $E0, $20
	db OAM_ENTRY_END
	db $F8, $00, $FA, $00
	db $F8, $F8, $EA, $00
	db OAM_ENTRY_END
	db $F8, $F8, $FA, $20
	db $F8, $00, $EA, $20
	db OAM_ENTRY_END