;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
	.module j_test
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _joypad
	.globl _delay
	.globl _printf
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
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
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;j_test.c:4: void main(void){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;j_test.c:5: while(1){
00102$:
;j_test.c:6: printf("Nombre_renvoyé:  %d\n", joypad());
	call	_joypad
	ld	d, #0x00
	push	de
	ld	hl, #___str_0
	push	hl
	call	_printf
	add	sp, #4
;j_test.c:7: delay(1000);	
	ld	hl, #0x03e8
	push	hl
	call	_delay
	add	sp, #2
	jr	00102$
;j_test.c:9: }
	ret
___str_0:
	.ascii "Nombre_renvoy"
	.db 0xc3
	.db 0xa9
	.ascii ":  %d"
	.db 0x0a
	.db 0x00
	.area _CODE
	.area _CABS (ABS)
