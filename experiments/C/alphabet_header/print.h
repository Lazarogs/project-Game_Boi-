#include <gb/gb.h>
#include "alphabet.c"

//alternative à printf mais qui utilise moins de VRAM

set_sprite_data(0, 39, alphabet);
void gbprint(char * string, int length, UINT8 x, UINT8 y){
	for(UINT8 i = 0; i <= length; i++){
		switch (string[i]){
			(case 'A') || (case 'a'):
				set_sprite(i, 0);
				move_sprite(i, x, y);
				x+=8;
				break;
			case 'B' || case 'b':
				set_sprite(i, 1);
				move_sprite(i, x, y);
				x+=8;
				break;
		}
	}
	SHOW_SPRITES;
}	
