INCLUDE "hardware.inc"

SECTION "Header", ROM0[$100] ; l'execution démare à l'emplacement 0x100

EntryPoint: ;ici débute l'execution de notre programme
	di ; désactive les instructions
	jp Start ; Un saut à la section START
	
REPT $150 - $104 ; j'ai aucune idée de ce que ça fait mais je suis un tuto :D
	db 0
ENDR

SECTION "Game code", ROM0 ; Ici, c'est la section où on va vraiment exécuter le code utile

Start: ; Retours à l'attérissage de notre saut

.waitVBlank ; le processeur ne peut pas avoir accèes à la VRAM si le ppu l'utilise, on attends le VBLANK pour que le ppu arrête d'utiliser le VBlank et afficher du contenu
	ld a, [rLY] ; on regarde quelle scanline est en train d'être déssiné, et on le charge dans le registre a
	cp a, 144 ; est-ce que l'on est en situation de VBLANK?
	jr c, .waitVBlank ; si non, alors on attend le VBlank...
	
	xor a ; on charge 0 dans a
	ld [rLCDC], a ; ptdr je sais pas ce que ça fait mais aux moins, je sais qu'on écrit a dans la valeur que contient rLCDC, (on le réinitialise?)

	ld hl, $9000 ; ptdr
	ld de, FontTiles ; on euh... Charge les ... Tiles?
	ld bc, FontTilesEnd - FontTiles ; Non sérieusement, je sais pas vraiment ce que je suis en train de faire
.copyFont
	ld a, [de] ; on chope 1 byte de la source
	ld [hli], a ; on le place à sa destination, incrémentant hl
	inc de ; on bouge au byte suivant
	dec bc ; on décrémente le double registre en 16 bit bc
	ld a, b ; on vérifie que notre compteur est à zéro vu que dec bc ne modifie pas les flags
	or c ; en gros, on vérifie que on à tout les tiles, c'est, si j'ai bien compris, une boucle!
	jr nz, .copyFont

	ld hl, $9800 ; ça va nous permettre d'afficher le string en haut à gauche de notre écran
	ld de, HelloWorldStr
.copyString
	ld a, [de]
	ld [hli], a
	inc de
	and a ; en gros, on vérifie si notre byte est égal à 0
	jr nz, .copyString ;on continue si c'est toujours pas le cas, en gros, c'est une boucle

	;on démarre les registres pour les registres
	ld a, %11100100 ; on choisis la couleur de la palette
	ld [rBGP], a

	xor a ; on charge 0 dans a
	ld [rSCY], a ;on passe la valeur du scrolling vertical a 0
	ld [rSCX], a ;idem mais pour l'horizontal

	ld [rNR52], a ; on retire le son

	;On allume notre écran, on affiche le fond
	ld a, %10000001
	ld [rLCDC], a

	;alors c'est bien sympa, mais si on le laisse sans code, notre programme, bah il se termine, donc on va créer une boucle infinie
.lockup
	jr .lockup

	;On à notre code, mais on à pas de police :p

SECTION "Font", ROM0

FontTiles:
INCBIN "font.chr"
FontTilesEnd: ;En gros, on dit à notre assembleur de charger nos chars

Section "Hello World string", ROM0

HelloWorldStr:
	db "Hello World!", 0
