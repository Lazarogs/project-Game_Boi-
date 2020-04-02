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
	.globl _scroll_sprite
	.globl _move_sprite
	.globl _set_sprite_tile
	.globl _set_sprite_data
	.globl _joypad
	.globl _delay
	.globl _jean_bob
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_jean_bob::
	.ds 32
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
;Sprite.c:26: unsigned char jean_bob[] =
	ld	hl, #_jean_bob
	ld	(hl), #0x7e
	ld	hl, #(_jean_bob + 0x0001)
	ld	(hl), #0x7e
	ld	hl, #(_jean_bob + 0x0002)
	ld	(hl), #0xff
	ld	hl, #(_jean_bob + 0x0003)
	ld	(hl), #0x81
	ld	hl, #(_jean_bob + 0x0004)
	ld	(hl), #0xff
	ld	hl, #(_jean_bob + 0x0005)
	ld	(hl), #0xa5
	ld	hl, #(_jean_bob + 0x0006)
	ld	(hl), #0xff
	ld	hl, #(_jean_bob + 0x0007)
	ld	(hl), #0x81
	ld	hl, #(_jean_bob + 0x0008)
	ld	(hl), #0xff
	ld	hl, #(_jean_bob + 0x0009)
	ld	(hl), #0x81
	ld	hl, #(_jean_bob + 0x000a)
	ld	(hl), #0xff
	ld	hl, #(_jean_bob + 0x000b)
	ld	(hl), #0xbd
	ld	hl, #(_jean_bob + 0x000c)
	ld	(hl), #0xff
	ld	hl, #(_jean_bob + 0x000d)
	ld	(hl), #0x81
	ld	hl, #(_jean_bob + 0x000e)
	ld	(hl), #0x7e
	ld	hl, #(_jean_bob + 0x000f)
	ld	(hl), #0x7e
	ld	hl, #(_jean_bob + 0x0010)
	ld	(hl), #0x7e
	ld	hl, #(_jean_bob + 0x0011)
	ld	(hl), #0x7e
	ld	hl, #(_jean_bob + 0x0012)
	ld	(hl), #0xff
	ld	hl, #(_jean_bob + 0x0013)
	ld	(hl), #0x81
	ld	hl, #(_jean_bob + 0x0014)
	ld	(hl), #0xff
	ld	hl, #(_jean_bob + 0x0015)
	ld	(hl), #0xa5
	ld	hl, #(_jean_bob + 0x0016)
	ld	(hl), #0xff
	ld	hl, #(_jean_bob + 0x0017)
	ld	(hl), #0x81
	ld	hl, #(_jean_bob + 0x0018)
	ld	(hl), #0xff
	ld	hl, #(_jean_bob + 0x0019)
	ld	(hl), #0xa5
	ld	hl, #(_jean_bob + 0x001a)
	ld	(hl), #0xff
	ld	hl, #(_jean_bob + 0x001b)
	ld	(hl), #0x99
	ld	hl, #(_jean_bob + 0x001c)
	ld	(hl), #0xff
	ld	hl, #(_jean_bob + 0x001d)
	ld	(hl), #0x81
	ld	hl, #(_jean_bob + 0x001e)
	ld	(hl), #0x7e
	ld	hl, #(_jean_bob + 0x001f)
	ld	(hl), #0x7e
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:6: void main (void){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:8: set_sprite_data(0, 2, jean_bob);
	ld	hl, #_jean_bob
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;main.c:9: set_sprite_tile(0, 0);
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_sprite_tile
	add	sp, #2
;main.c:10: move_sprite(0, 80, 72);
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
;main.c:11: SHOW_SPRITES;
	ld	hl, #0xff40
	ld	a, (hl)
	set	1, a
	ld	hl, #0xff40
	ld	(hl), a
;main.c:13: while(1){
00107$:
;main.c:14: switch(joypad()){
	call	_joypad
	ld	a, e
	cp	a, #0x01
	jr	Z,00102$
	cp	a, #0x02
	jr	Z,00101$
	cp	a, #0x04
	jr	Z,00103$
	sub	a, #0x08
	jp	Z,00104$
	jp	00105$
;main.c:15: case J_LEFT:
00101$:
;main.c:16: scroll_sprite(0, -1, 0);
	xor	a, a
	push	af
	inc	sp
	ld	a, #0xff
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_scroll_sprite
	add	sp, #3
;main.c:17: break;
	jp	00105$
;main.c:18: case J_RIGHT:
00102$:
;main.c:19: scroll_sprite(0, 1, 0);
	xor	a, a
	push	af
	inc	sp
	ld	a, #0x01
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_scroll_sprite
	add	sp, #3
;main.c:20: break;
	jr	00105$
;main.c:21: case J_UP:
00103$:
;main.c:22: scroll_sprite(0, 0, -1);
	ld	a, #0xff
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_scroll_sprite
	add	sp, #3
;main.c:23: break;
	jr	00105$
;main.c:24: case J_DOWN:
00104$:
;main.c:25: scroll_sprite(0, 0, 1);
	ld	a, #0x01
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_scroll_sprite
	add	sp, #3
;main.c:28: }
00105$:
;main.c:30: set_sprite_tile(0, currentsprite);
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_sprite_tile
	add	sp, #2
;main.c:31: delay(10);
	ld	hl, #0x000a
	push	hl
	call	_delay
	add	sp, #2
	jp	00107$
;main.c:33: }
	ret
	.area _CODE
	.area _CABS (ABS)
