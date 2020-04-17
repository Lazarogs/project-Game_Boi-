character_improved.gb: character_improved.ihx
	/opt/gbdk-n/bin/gbdk-n-make-rom.sh  -yc character_improved.ihx character_improved.gb
	rm character_improved.ihx

character_improved.ihx: main.rel character.rel
	/opt/gbdk-n/bin/gbdk-n-link.sh main.rel character.rel -o character_improved.ihx
	rm character_improved.lk character_improved.map character_improved.noi main.rel character.rel

main.rel: main.c
	/opt/gbdk-n/bin/gbdk-n-compile.sh main.c
	rm main.asm main.lst main.sym

character.rel: character.c character.h
	/opt/gbdk-n/bin/gbdk-n-compile.sh character.c
	rm character.asm character.lst character.sym

