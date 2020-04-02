#include <stdio.h>
#include <gb/gb.h>

void main(void){
	while(1){
		printf("Nombre_renvoyé:  %d\n", joypad());
		delay(1000);	
	}
}
