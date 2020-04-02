#include <gb/gb.h>
#include <stdio.h>
#include "Sprite.c"


void main (void){
	UINT8 currentsprite = 0;
	set_sprite_data(0, 2, jean_bob);
	set_sprite_tile(0, 0);
	move_sprite(0, 80, 72);
	SHOW_SPRITES;

	while(1){
		switch(joypad()){
			case J_LEFT:
				scroll_sprite(0, -1, 0);
				break;
			case J_LEFT + J_UP:
				scroll_sprite(0, -1, -1);
				break;
			case J_LEFT + J_DOWN:
				scroll_sprite(0, -1, 1);
				break;
			case J_RIGHT:
				scroll_sprite(0, 1, 0);
				break;
			case J_RIGHT + J_UP:
				scroll_sprite(0, 1, -1);
			        break;
			case J_RIGHT + J_DOWN:
				scroll_sprite(0, 1, 1);
				break;	
			case J_UP:
				scroll_sprite(0, 0, -1);
				break;
			case J_DOWN:
				scroll_sprite(0, 0, 1);
				break;
	
		}
		set_sprite_tile(0, currentsprite);
		delay(10);
	}
}
