.include "data.s"
.include "shape.s"
.globl main

main:
	mov x25,SCREEN_WIDTH
    // x0 contiene la direccion base del framebuffer
    mov x20, x0 // Guarda la dirección base del framebuffer en x20

// ------------------------------ Dibujar el fondo --------------------------------------- //

	mov x20, x0
	movz x10, 0x00, lsl 16
	movk x10, 0x00FF, lsl 00 // Color de fondo

	mov x2, SCREEN_HEIGH         // Y Size 
loop1:
	mov x1, SCREEN_WIDTH         // X Size
loop0:
	stur x10,[x0]  // Colorear el pixel N 
	add x0,x0,4    // Siguiente pixel    
	sub x1,x1,1    // Decrementar contador X 
	cbnz x1,loop0  // Si no terminó la fila, salto (hago lo mismo hasta que se termine la fila)
	sub x2,x2,1    // Decrementar contador Y (si se termina la fila paso a la siguiente columna) 
	cmp x2, #100 
	b.le endloop
	cmp x2,#250   //A partir de esa altura fijamos un color 
	b.lt loop1 	
	bl cambio_color
	cbnz x2,loop1 	// Si no es la última fila, salto 

cambio_color:
	sub x10,x10, 1 //Vamos cambiando progresivamente el color  
    ret 

endloop:  

// ------------------------------ Casa de Patricio --------------------------------------- //

	movz x10, 0x66, lsl 16
	movk x10, 0x3300, lsl 00

	mov x3, #75                // Radio del circulo
	mul x4, x3, x3	 
	mov x2, #90			      // Coordenada X (centro del circulo)
	mov x1, #390			     // Coordenada Y
	bl circle 


// ------------------------------ -------- Arena ---------------------------------------- //

	movz x1, 0              	// Coordenada X
	movz x2, 380				// Coordenada Y
	movz x3, SCREEN_WIDTH		// Width 
	movz x4, 100				// Heigh 
	movz x10, 0xFF, lsl 16		// Color
	movk x10, 0xB266, lsl 00 	// Color 
	bl rectangle
	
// ----------------------------------- Casa de calamardo  ----------------------------------------//

	movz x10, 0x00, lsl 16
	movk x10, 0x3366, lsl 00

	movz x1, 560 // Coordenada X
	movz x2, 300 // Coordenada Y
	movz x3, 50 // Ancho
	movz x4, 100 // Alto
	bl rectangle  

	mov x3, #5                // Radio del circulo
	mul x4, x3, x3	 
	mov x2, #573			      // Coordenada X (centro del circulo)
	mov x1, #343			     // Coordenada Y
	movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
	bl circle
	sub x3,x3,1
	movz x10, 0x66, lsl 16
	movk x10, 0xB2FF, lsl 00
	bl circle

	mov x3, #5                // Radio del circulo
	mul x4, x3, x3	 
	mov x2, #593			      // Coordenada X (centro del circulo)
	mov x1, #343			     // Coordenada Y
	movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
	bl circle
	sub x3,x3,1
	movz x10, 0x66, lsl 16
	movk x10, 0xB2FF, lsl 00
	bl circle

	movz x10, 0x99, lsl 16
	movk x10, 0x4C00, lsl 00

	movz x1, 580 // Coordenada X
	movz x2, 380 // Coordenada Y
	movz x3, 10 // Ancho
	movz x4, 20 // Alto
	bl rectangle  

	movz x10, 0x00, lsl 16
	movk x10, 0x0066, lsl 00

	movz x1, 610 // Coordenada X
	movz x2, 330 // Coordenada Y
	movz x3, 10 // Ancho
	movz x4, 40 // Alto
	bl rectangle 

	movz x1, 550 // Coordenada X
	movz x2, 330 // Coordenada Y
	movz x3, 10 // Ancho
	movz x4, 40 // Alto
	bl rectangle 
	
	movz x1, 570 // Coordenada X
	movz x2, 330 // Coordenada Y
	movz x3, 30 // Ancho
	movz x4, 10 // Alto
	bl rectangle 
	
	movz x1, 580 // Coordenada X
	movz x2, 340 // Coordenada Y
	movz x3, 10 // Ancho
	movz x4, 20 // Alto
	bl rectangle 
	
// ----------------------------------- Burbujas  ----------------------------------------------//

	
	mov x3, #6                // Radio del circulo
	mul x4, x3, x3	 
	mov x2, #50			      // Coordenada X (centro del circulo)
	mov x1, #150			     // Coordenada Y
	movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
	bl circle
	sub x3,x3,1
	movz x10, 0x66, lsl 16
	movk x10, 0xB2FF, lsl 00
	bl circle

	mov x3, #6                // Radio del circulo
	mul x4, x3, x3	 
	mov x2, #120			      // Coordenada X (centro del circulo)
	mov x1, #50			     // Coordenada Y
	movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
	bl circle 
	sub x3,x3,1
	movz x10, 0x66, lsl 16
	movk x10, 0xB2FF, lsl 00
	bl circle

	mov x3, #6              // Radio del circulo
	mul x4, x3, x3	 
	mov x2, #160		      // Coordenada X (centro del circulo)
	mov x1, #180			     // Coordenada Y
	movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
	bl circle 
	sub x3,x3,1
	movz x10, 0x66, lsl 16
	movk x10, 0xB2FF, lsl 00
	bl circle

	mov x3, #6               // Radio del circulo
	mul x4, x3, x3	 
	mov x2, #170		      // Coordenada X (centro del circulo)
	mov x1, #350			     // Coordenada Y
	movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
	bl circle
	sub x3,x3,1
	movz x10, 0x66, lsl 16
	movk x10, 0xB2FF, lsl 00
	bl circle 

	mov x3, #6                // Radio del circulo
	mul x4, x3, x3	 
	mov x2, #500			      // Coordenada X (centro del circulo)
	mov x1, #70			     // Coordenada Y
	movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
	bl circle 
	sub x3,x3,1
	movz x10, 0x66, lsl 16
	movk x10, 0xB2FF, lsl 00
	bl circle

	mov x3, #6                // Radio del circulo
	mul x4, x3, x3	 
	mov x2, #600			      // Coordenada X (centro del circulo)
	mov x1, #200			     // Coordenada Y
	movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
	bl circle
	sub x3,x3,1
	movz x10, 0x66, lsl 16
	movk x10, 0xB2FF, lsl 00
	bl circle 

	mov x3, #6               // Radio del circulo
	mul x4, x3, x3	 
	mov x2, #450			      // Coordenada X (centro del circulo)
	mov x1, #140			     // Coordenada Y
	movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
	bl circle 
	sub x3,x3,1
	movz x10, 0x66, lsl 16
	movk x10, 0xB2FF, lsl 00
	bl circle

	mov x3, #6                // Radio del circulo
	mul x4, x3, x3	 
	mov x2, #520			      // Coordenada X (centro del circulo)
	mov x1, #300			     // Coordenada Y
	movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
	bl circle
	sub x3,x3,1
	movz x10, 0x66, lsl 16
	movk x10, 0xB2FF, lsl 00
	bl circle

	mov x3, #6                // Radio del circulo
	mul x4, x3, x3	 
	mov x2, #100			      // Coordenada X (centro del circulo)
	mov x1, #270			     // Coordenada Y
	movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
	bl circle
	sub x3,x3,1
	movz x10, 0x66, lsl 16
	movk x10, 0xB2FF, lsl 00
	bl circle

	mov x3, #6                // Radio del circulo
	mul x4, x3, x3	 
	mov x2, #500			      // Coordenada X (centro del circulo)
	mov x1, #350		     // Coordenada Y
	movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
	bl circle
	sub x3,x3,1
	movz x10, 0x66, lsl 16
	movk x10, 0xB2FF, lsl 00
	bl circle

	mov x3, #6                // Radio del circulo
	mul x4, x3, x3	 
	mov x2, #580			      // Coordenada X (centro del circulo)
	mov x1, #20			     // Coordenada Y
	movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
	bl circle
	sub x3,x3,1
	movz x10, 0x66, lsl 16
	movk x10, 0xB2FF, lsl 00
	bl circle

	mov x3, #6                // Radio del circulo
	mul x4, x3, x3	 
	mov x2, #200			      // Coordenada X (centro del circulo)
	mov x1, #90			     // Coordenada Y
	movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
	bl circle 
	sub x3,x3,1
	movz x10, 0x66, lsl 16
	movk x10, 0xB2FF, lsl 00
	bl circle
	
//--------------------------------------------BOB ESPONJA------------------------------------------------//

	//CUERPO//

	movz x1, 240 // Coordenada X
	movz x2, 100 // Coordenada Y
	movz x3, 170 // Ancho
	movz x4, 250 // Alto
	movz x10, 0xFF, lsl 16
	movk x10, 0xFF33, lsl 00 
	bl rectangle

	//CACHETES BOB//
	
	mov x3, #5                // Radio del circulo
    mul x4, x3, x3
    mov x2, 280                  // Coordenada X (centro del circulo)
    mov x1, 190                // Coordenada Y
	movz x10, 0xFF, lsl 16
    movk x10, 0x678B, lsl 00
    bl circle

	//DIENTES BOB//

	movz x1, 328 // Coordenada X
	movz x2, 212 // Coordenada Y
	movz x3, 10 // Ancho
	movz x4, 15 // Alto
	movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00 
	bl rectangle

	movz x1, 314 // Coordenada X
	movz x2, 212 // Coordenada Y
	movz x3, 10 // Ancho
	movz x4, 15 // Alto
	movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00 
	bl rectangle
	
	//SONRISA//
	
	mov x3, #52              // Radio del circulo
    mul x4, x3, x3
    mov x2, 325                  // Coordenada X (centro del circulo)
    mov x1, 163                // Coordenada Y
	movz x10, 0x00, lsl 16
    movk x10, 0x0000, lsl 00
    bl circle

	mov x3, #55                // Radio del circulo
    mul x4, x3, x3
    mov x2, 325                  // Coordenada X (centro del circulo)
    mov x1, 157                 // Coordenada Y
	movz x10, 0xFF, lsl 16
    movk x10, 0xFF33, lsl 00
    bl circle

	//CACHETE IZQUIERDO//

	mov x3, #8                // Radio del circulo
    mul x4, x3, x3
    mov x2, 283                  // Coordenada X (centro del circulo)
    mov x1, 195                // Coordenada Y
	movz x10, 0xFF, lsl 16
    movk x10, 0xA07A, lsl 00
    bl circle

	mov x3, #7                // Radio del circulo
    mul x4, x3, x3
    mov x2, 285                  // Coordenada X (centro del circulo)
    mov x1, 196                // Coordenada Y
	movz x10, 0xFF, lsl 16
    movk x10, 0xFF33, lsl 00
    bl circle

	//PECAS IZQUIERDA//

	mov x3, #1                // Radio del circulo
    mul x4, x3, x3
    mov x2, 283                  // Coordenada X (centro del circulo)
    mov x1, 193                // Coordenada Y
	movz x10, 0x8B, lsl 16
    movk x10, 0x4513, lsl 00
    bl circle

	mov x3, #1                // Radio del circulo
    mul x4, x3, x3
    mov x2, 283                  // Coordenada X (centro del circulo)
    mov x1, 197                // Coordenada Y
	movz x10, 0x8B, lsl 16
    movk x10, 0x4513, lsl 00
    bl circle

	mov x3, #1                // Radio del circulo
    mul x4, x3, x3
    mov x2, 290                  // Coordenada X (centro del circulo)
    mov x1, 196                // Coordenada Y
	movz x10, 0x8B, lsl 16
    movk x10, 0x4513, lsl 00
    bl circle

	//CACHETE DERECHO//
	mov x3, #8                // Radio del circulo
    mul x4, x3, x3
    mov x2, 364                  // Coordenada X (centro del circulo)
    mov x1, 195                // Coordenada Y
	movz x10, 0xFF, lsl 16
    movk x10, 0xA07A, lsl 00
    bl circle

	mov x3, #7                // Radio del circulo
    mul x4, x3, x3
    mov x2, 362                  // Coordenada X (centro del circulo)
    mov x1, 196                // Coordenada Y
	movz x10, 0xFF, lsl 16
    movk x10, 0xFF33, lsl 00
    bl circle

	//PECAS DERECHAS//
	
	mov x3, #1                // Radio del circulo
    mul x4, x3, x3
    mov x2, 363                  // Coordenada X (centro del circulo)
    mov x1, 193                // Coordenada Y
	movz x10, 0x8B, lsl 16
    movk x10, 0x4513, lsl 00
    bl circle

	mov x3, #1                // Radio del circulo
    mul x4, x3, x3
    mov x2, 360                  // Coordenada X (centro del circulo)
    mov x1, 197               // Coordenada Y
	movz x10, 0x8B, lsl 16
    movk x10, 0x4513, lsl 00
    bl circle

	mov x3, #1                // Radio del circulo
    mul x4, x3, x3
    mov x2, 366                  // Coordenada X (centro del circulo)
    mov x1, 196                // Coordenada Y
	movz x10, 0x8B, lsl 16
    movk x10, 0x4513, lsl 00
    bl circle

	//PANTALON BOB//

	movz x1, 240 // Coordenada X
	movz x2, 270 // Coordenada Y
	movz x3, 170 // Ancho
	movz x4, 87 // Alto
	movz x10, 0xCD, lsl 16
	movk x10, 0x853F, lsl 00 
	bl rectangle

	//CINTURON//

	movz x1, 250 // Coordenada X
	movz x2, 300 // Coordenada Y
	movz x3, 30 // Ancho
	movz x4, 10 // Alto
	movz x10, 0x8B, lsl 16
	movk x10, 0x4513, lsl 00 
	bl rectangle
	movz x2, 300 // Coordenada Y
	add x1,x1,40
	movz x4, 10 // Alto
	bl rectangle
	movz x2, 300 // Coordenada Y
	add x1,x1,40
	movz x4, 10 // Alto
	bl rectangle
	movz x2, 300 // Coordenada Y
	add x1,x1,40
	movz x4, 10 // Alto
	bl rectangle 

	//CAMISA BOB//

	movz x1, 240 // Coordenada X
	movz x2, 260 // Coordenada Y
	movz x3, 170 // Ancho
	movz x4, 30 // Alto
	movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00 
	bl rectangle

	//CORBATA BOB//

	movz x1, 320 // Coordenada X
	movz x2, 260 // Coordenada Y
	movz x3, 10 // Ancho
	movz x4, 50 // Alto
	movz x10, 0xFF, lsl 16
	movk x10, 0x6666, lsl 00 
	bl rectangle

	//PESTAÑAS IZQUIERDAS//

	movz x1, 279 // Coordenada X
	movz x2, 129 // Coordenada Y
	movz x3, 3 // Ancho
	movz x4, 11 // Alto
	movz x10, 0x00, lsl 16
	movk x10, 0x0000, lsl 00 
	bl rectangle
	
	movz x1, 287 // Coordenada X
	movz x2, 125 // Coordenada Y
	movz x3, 3 // Ancho
	movz x4, 20 // Alto
	movz x10, 0x00, lsl 16
	movk x10, 0x0000, lsl 00 
	bl rectangle

	movz x1, 297 // Coordenada X
	movz x2, 129 // Coordenada Y
	movz x3, 3 // Ancho
	movz x4, 11 // Alto
	movz x10, 0x00, lsl 16
	movk x10, 0x0000, lsl 00 
	bl rectangle
  
 	//PESTAÑAS DERECHAS//

  	movz x1, 349 // Coordenada X
	movz x2, 129 // Coordenada Y
	movz x3, 3 // Ancho
	movz x4, 11 // Alto
	movz x10, 0x00, lsl 16
	movk x10, 0x0000, lsl 00 
	bl rectangle
	
	movz x1, 357 // Coordenada X
	movz x2, 125 // Coordenada Y
	movz x3, 3 // Ancho
	movz x4, 20 // Alto
	movz x10, 0x00, lsl 16
	movk x10, 0x0000, lsl 00 
	bl rectangle

	movz x1, 367 // Coordenada X
	movz x2, 129 // Coordenada Y
	movz x3, 3 // Ancho
	movz x4, 11 // Alto
	movz x10, 0x00, lsl 16
	movk x10, 0x0000, lsl 00 
	bl rectangle
	
	// Ojos bob
	movz x10, 0x00, lsl 16
    movk x10, 0x0000, lsl 00
	
	mov x3, #26                // Radio del circulo
    mul x4, x3, x3
    mov x2, 290                  // Coordenada X (centro del circulo)
    mov x1, 160                 // Coordenada Y
    bl circle
	add x2, x2, 70
	bl circle 

	movz x10, 0xF5, lsl 16
    movk x10, 0xFFFA, lsl 00
	
	mov x3, #25                // Radio del circulo
    mul x4, x3, x3
    mov x2, 290                  // Coordenada X (centro del circulo)
    mov x1, 160                 // Coordenada Y
    bl circle
	add x2, x2, 70
	bl circle 

	//PUPILAS//

	mov x3, #10                // Radio del circulo
    mul x4, x3, x3
    mov x2, 290                  // Coordenada X (centro del circulo)
    mov x1, 160                 // Coordenada Y
	movz x10, 0x40, lsl 16
    movk x10, 0xE0D0, lsl 00
    bl circle
	add x2, x2, 70
	bl circle 

	mov x3, #5                // Radio del circulo
    mul x4, x3, x3
    mov x2, 290                  // Coordenada X (centro del circulo)
    mov x1, 160                 // Coordenada Y
	movz x10, 0x00, lsl 16
    movk x10, 0x0000, lsl 00
    bl circle
	add x2, x2, 70
	bl circle 

	//MANCHAS BOB//

	mov x3, #3                // Radio del circulo
    mul x4, x3, x3
    mov x2, 250                  // Coordenada X (centro del circulo)
    mov x1, 160                 // Coordenada Y
	movz x10, 0xB8, lsl 16
    movk x10, 0x860B, lsl 00
    bl circle

	mov x3, #10                // Radio del circulo
    mul x4, x3, x3
    mov x2, 253                  // Coordenada X (centro del circulo)
    mov x1, 140                 // Coordenada Y
	movz x10, 0xB8, lsl 16
    movk x10, 0x860B, lsl 00
    bl circle

	mov x3, #7               // Radio del circulo
    mul x4, x3, x3
    mov x2, 390                  // Coordenada X (centro del circulo)
    mov x1, 120                 // Coordenada Y
	movz x10, 0xB8, lsl 16
    movk x10, 0x860B, lsl 00
    bl circle

	mov x3, #12                // Radio del circulo
    mul x4, x3, x3
    mov x2, 370                  // Coordenada X (centro del circulo)
    mov x1, 230                 // Coordenada Y
	movz x10, 0xB8, lsl 16
    movk x10, 0x860B, lsl 00
    bl circle

	mov x3, #4                // Radio del circulo
    mul x4, x3, x3
    mov x2, 350                  // Coordenada X (centro del circulo)
    mov x1, 250                 // Coordenada Y
	movz x10, 0xB8, lsl 16
    movk x10, 0x860B, lsl 00
    bl circle

	mov x3, #11                // Radio del circulo
    mul x4, x3, x3
    mov x2, 280                  // Coordenada X (centro del circulo)
    mov x1, 240                 // Coordenada Y
	movz x10, 0xB8, lsl 16
    movk x10, 0x860B, lsl 00
    bl circle

	mov x3, #6               // Radio del circulo
    mul x4, x3, x3
    mov x2, 267                  // Coordenada X (centro del circulo)
    mov x1, 220                 // Coordenada Y
	movz x10, 0xB8, lsl 16
    movk x10, 0x860B, lsl 00
    bl circle 

	//MEDIAS//

    movz x1, 285 // Coordenada X
    movz x2, 360 // Coordenada Y
    movz x3, 10 // Ancho
    movz x4, 80 // Alto
    movz x10, 0xFF, lsl 16
    movk x10, 0xFFFF, lsl 00 
    bl rectangle 
	
	movz x1, 355 // Coordenada X
    movz x2, 360 // Coordenada Y
    movz x3, 10 // Ancho
    movz x4, 80 // Alto
    movz x10, 0xFF, lsl 16
    movk x10, 0xFFFF, lsl 00 
    bl rectangle 

    //PIERNAS//

    movz x1, 285 // Coordenada X
    movz x2, 357 // Coordenada Y
    movz x3, 10 // Ancho
    movz x4, 40 // Alto
    movz x10, 0xFF, lsl 16
    movk x10, 0xFF00, lsl 00 
    bl rectangle 
	
	movz x1, 355 // Coordenada X
    movz x2, 357 // Coordenada Y
    movz x3, 10 // Ancho
    movz x4, 40 // Alto
    movz x10, 0xFF, lsl 16
    movk x10, 0xFF00, lsl 00 
    bl rectangle 


	//ZAPATOS//

    movz x1, 266 // Coordenada X
    movz x2, 437 // Coordenada Y
    movz x3, 30 // Ancho
    movz x4, 10 // Alto
    movz x10, 0x00, lsl 16
    movk x10, 0x0000, lsl 00 
    bl rectangle 

	movz x1, 355 // Coordenada X
    movz x2, 437 // Coordenada Y
    movz x3, 30 // Ancho
    movz x4, 10 // Alto
    movz x10, 0x00, lsl 16
    movk x10, 0x0000, lsl 00 
    bl rectangle 

    //BRAZOS//
	
    movz x1, 210 // Coordenada X
    movz x2, 260 // Coordenada Y
    movz x3, 30 // Ancho
    movz x4, 10 // Alto
	movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    bl rectangle
	
    movz x1, 160 // Coordenada X
    movz x2, 260 // Coordenada Y
    movz x3, 50 // Ancho
    movz x4, 10 // Alto
    movz x10, 0xFF, lsl 16
    movk x10, 0xFF00, lsl 00 
    bl rectangle

    movz x1, 160 // Coordenada X
    movz x2, 180 // Coordenada Y
    movz x3, 10 // Ancho
    movz x4, 80 // Alto
    movz x10, 0xFF, lsl 16
    movk x10, 0xFF00, lsl 00 
    bl rectangle

	movz x1, 450 // Coordenada X
    movz x2, 260 // Coordenada Y
    movz x3, 10 // Ancho
    movz x4, 80 // Alto
    movz x10, 0xFF, lsl 16
    movk x10, 0xFF00, lsl 00 
    bl rectangle
	
	movz x1, 400 // Coordenada X
    movz x2, 260 // Coordenada Y
    movz x3, 30 // Ancho
    movz x4, 10 // Alto
	movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    bl rectangle

	movz x1, 430 // Coordenada X
    movz x2, 260 // Coordenada Y
    movz x3, 20 // Ancho
    movz x4, 10 // Alto
	movz x10, 0xFF, lsl 16
	movk x10, 0xFF00, lsl 00
    bl rectangle


    // Infinite Loop
InfLoop:
    b InfLoop
