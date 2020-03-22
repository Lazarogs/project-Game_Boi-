#include <gb/gb.h>
#include <stdio.h>
#include "Sprite.c"


int main (void){
	UINT8 currentsprite = 0;
	set_sprite_data(0, 2, jean_bob);
	set_sprite_tile(0, 0);
	move_sprite(0, 80, 72);
	SHOW_SPRITES;

	while(1){
		if (currentsprite == 0){
			currentsprite = 1;
		}

		else {
			currentsprite = 0;
		}

		set_sprite_tile(0, currentsprite);
		delay(1000);
	}
	return 0;
}
