character_improved.gb: character_improved.ihx
	/opt/gbdk-n/bin/gbdk-n-make-rom.sh  -yc character_improved.ihx character_improved.gb
	rm character_improved.ihx

character_improved.ihx: main.rel character.rel bg_map.rel bg_sprites.rel
	/opt/gbdk-n/bin/gbdk-n-link.sh main.rel character.rel bg_map.rel bg_sprites.rel -o character_improved.ihx
	rm character_improved.lk character_improved.map character_improved.noi main.rel character.rel bg_map.rel bg_sprites.rel

main.rel: main.c
	/opt/gbdk-n/bin/gbdk-n-compile.sh main.c
	rm main.asm main.lst main.sym

character.rel: character.c character.h
	/opt/gbdk-n/bin/gbdk-n-compile.sh character.c
	rm character.asm character.lst character.sym

bg_sprites.rel: bg_sprites.c bg_sprites.h
	/opt/gbdk-n/bin/gbdk-n-compile.sh bg_sprites.c
	rm bg_sprites.asm bg_sprites.lst bg_sprites.sym

bg_map.rel: bg_map.c bg_map.h
	/opt/gbdk-n/bin/gbdk-n-compile.sh bg_map.c
	rm bg_map.asm bg_map.lst bg_map.sym
