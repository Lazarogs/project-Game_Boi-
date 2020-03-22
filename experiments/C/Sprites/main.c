#include <gb/gb.h>
#include "Sprites.h"

UINT8 Sprite_Index = 0;

int main (void){
	set_sprite_data(0, 2, Jean_Bob);
	set_sprite_tile(0, 0);
	move_sprite(0, 80, 72);
	SHOW_SPRITES;
	
	while (1){
		if (Sprite_Index == 0){
			Sprite_Index = 1;
		}

		else {
			Sprite_Index = 0;
		}

		set_sprite_tile(0, Sprite_Index);
		delay(1000);
	}
	return 0;
}
