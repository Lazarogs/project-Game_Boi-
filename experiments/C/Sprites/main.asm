;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _move_sprite
	.globl _set_sprite_tile
	.globl _set_sprite_data
	.globl _delay
	.globl _Sprite_Index
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_Sprite_Index::
	.ds 1
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;main.c:4: UINT8 Sprite_Index = 0;
	ld	hl, #_Sprite_Index
	ld	(hl), #0x00
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:6: int main (void){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:7: set_sprite_data(0, 2, Jean_Bob);
	ld	hl, #_Jean_Bob
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;main.c:8: set_sprite_tile(0, 0);
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_sprite_tile
	add	sp, #2
;main.c:9: move_sprite(0, 80, 72);
	ld	a, #0x48
	push	af
	inc	sp
	ld	a, #0x50
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;main.c:10: SHOW_SPRITES;
	ld	hl, #0xff40
	ld	a, (hl)
	set	1, a
	ld	hl, #0xff40
	ld	(hl), a
;main.c:12: while (1){
00105$:
;main.c:13: if (Sprite_Index == 0){
	ld	hl, #_Sprite_Index
	ld	a, (hl)
	or	a, a
	jr	NZ,00102$
;main.c:14: Sprite_Index = 1;
	ld	(hl), #0x01
	jr	00103$
00102$:
;main.c:18: Sprite_Index = 0;
	ld	hl, #_Sprite_Index
	ld	(hl), #0x00
00103$:
;main.c:21: set_sprite_tile(0, Sprite_Index);
	ld	hl, #_Sprite_Index
	ld	a, (hl)
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_sprite_tile
	add	sp, #2
;main.c:22: delay(1000);
	ld	hl, #0x03e8
	push	hl
	call	_delay
	add	sp, #2
	jr	00105$
;main.c:24: return 0;
;main.c:25: }
	ret
	.area _CODE
	.area _CABS (ABS)
