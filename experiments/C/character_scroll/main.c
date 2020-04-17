#include <gb/gb.h>
#include <gb/cgb.h> //ajoute des couleurs simples à utiliser
#include "character.h" // sprites de notre personnage

// définition de valeurs, pour ajouter de la lisibilité au code.
#define PLAYER 0
#define PLAYER_PALETTE 0

_Bool is_flippedX = 0; //va nous permettre de faire retourner le sprite de notre personnage, nous permettant d'économiser un sprite dans la VRAM

UWORD spritePalette[] = { // les couleurs de notre palette
	0, RGB_LIGHTFLESH, RGB_BLUE, RGB_BLACK
}; 

void main(){
	set_sprite_palette(PLAYER_PALETTE, 3, spritePalette);
	set_sprite_data(0, 3, character); //On charge les images de notre personnage.
	set_sprite_tile(PLAYER, 0);
	set_sprite_prop(PLAYER, PLAYER_PALETTE); //On donne la palette de couleurs PLAYER_PALETTE a notre joueur
	move_sprite(PLAYER, 80, 72); // position de départ
	
	SHOW_SPRITES;

	while(1){
		switch (joypad()){
			wait_vbl_done();
			case J_RIGHT: 
				if (is_flippedX == 1){
						set_sprite_tile(PLAYER, 2);
						set_sprite_prop(PLAYER, 0);
						is_flippedX = 0;
				}
				else {	
					set_sprite_tile(PLAYER, 2);
				}	
				//move_sprite(PLAYER, 5, 0);
				break;
			case J_LEFT:
				if (is_flippedX == 1){
					set_sprite_tile(PLAYER, 2);
				}
				else {
					set_sprite_tile(PLAYER, 2);
					set_sprite_prop(PLAYER, S_FLIPX);
					is_flippedX = 1;
				}
				break;
			case J_UP:
				set_sprite_tile(PLAYER, 1);
				//move_sprite(PLAYER, 0, -5);
				break;
			case J_DOWN:
				set_sprite_tile(PLAYER, 0);
				//move_sprite(PLAYER, 0, 5);
			       break;
		}
		delay(100);
	}
}
