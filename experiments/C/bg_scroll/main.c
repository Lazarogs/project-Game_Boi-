#include <gb/gb.h>
#include "Background_map.c"
#include "Sprites.c"

void main (){
	set_bkg_data(0, 2, Checkerboard);
	set_bkg_tiles(0, 0, 32, 32, background);
	SHOW_BKG;
	DISPLAY_ON;

	while (1){
		scroll_bkg(1, -1);
		delay(100);
	}
}
