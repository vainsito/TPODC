.ifndef background_s
.equ background_s, 0

.include "data.s"

/*  En este archivo modularizamos el fondo  */

background:
    mov x19, SCREEN_HEIGH
	lsr x19, x19, #2

//////////////////////////FONDO/////////////////////////////

 	movz x10, 0x00, lsl 16 //(color de el que partimos)
    movk x10, 0x00FF, lsl 00

	mov x2, SCREEN_HEIGH         // Y Size (el eje y)
loop1:
	mov x1, SCREEN_WIDTH         // X Size (el eje de las x)
loop0:
	stur x10,[x0]  // Colorear el pixel N 
	add x0,x0,4    // Siguiente pixel    
	sub x1,x1,1    // Decrementar contador X 
	cbnz x1,loop0  // Si no terminó la fila, salto (hago lo mismo hasta que se termine la fila)
	sub x2,x2,1    // Decrementar contador Y (si se termina la fila paso a la siguiente columna) 
	cmp x2,#250   //A partir de esa altura fijamos un color 
	b.lt loop1 	
	bl cambio_color
	cbnz x2,loop1 	// Si no es la última fila, salto 

cambio_color:
	sub x10,x10, 1 //Vamos cambiando progresivamente el color  
    ret 
	
///////////////////////////////////////////////////////////////
	
	bl color_suelo

	mov x2, SCREEN_HEIGH         // Y Size (el eje y)
loop2:
	mov x1, SCREEN_WIDTH         // X Size (el eje de las x)
loop3:
	bl color_suelo
	stur x10,[x0]  	
	add x0,x0,4       
	sub x1,x1,1    
	cbnz x1,loop2  	
	sub x2,x2,1    	
	cmp x2,x19  	
	b.eq endloop
	cbnz x2,loop3 	
endloop:

color_suelo:
	movz x10, 0xE2, lsl 16 //(color de el que partimos)
    movk x10, 0xD849, lsl 00
	ret //vuelve a donde lo llamaste

.endif