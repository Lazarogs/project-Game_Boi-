#include <gb/gb.h>
#include "character.h" // sprites de notre personnage
//On va ici créer des variables pour le personnage à l'écran :

#define PLAYER 0 // Nous permettra d'identifier le sprite de notre joueur, au lieu d'appeller une valeur magique
_Bool is_flipedX = 0; //va nous permettre de faire retourner le sprite de notre personnage, nous permettant d'économiser un sprite dans la VRAM

void main(){
	set_sprite_data(0, 3, character); //On charge les images de notre personnage.
	set_sprite_tile(PLAYER, 0);
	move_sprite(PLAYER, 80, 72); // position de départ
	
	SHOW_SPRITES;

	while(1){
		switch (joypad()){
			wait_vbl_done();
			case J_RIGHT: 
				set_sprite_tile(PLAYER, 2);	
				move_sprite(PLAYER, 5, 0);
				break;
			case J_LEFT:
				set_sprite_tile(PLAYER, 2);
		//		set_sprite_prop(PLAYER, S_FLIPX);
				move_sprite(PLAYER, -5, 0);
				break;
			case J_UP:
				set_sprite_tile(PLAYER, 1);
				move_sprite(PLAYER, 0, -5);
				break;
			case J_DOWN:
				set_sprite_tile(PLAYER, 0);
				move_sprite(PLAYER, 0, 5);
			       break;
		}
		delay(100);
	}
}

