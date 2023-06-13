.include "data.s"
.include "shapes.s"
.globl main

main:
	mov x25,SCREEN_WIDTH
    // x0 contiene la direccion base del framebuffer
    mov x20, x0 // Guarda la dirección base del framebuffer en x20

// ------------------------------ Dibujar el fondo --------------------------------------- //


	mov x19, 240 	//COORDENADA X DE BOB
	mov x18, 100 	//COORDENADA Y DE BOB
	
	mov x21, #50 	//Coordenada x de burbujas 
	mov x22, #150	//Coordenada y de burbujas 

	mov x27, 0

repeat:

	movz x10, 0x00, lsl 16
	movk x10, 0x00FF, lsl 00 // Color de fondo

	mov x0,x20
	mov x2, SCREEN_HEIGH        // Y Size 

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


//--------------------------------------- Arena ----------------------------------------//

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


	mov x3, #8                // Radio del circulo
	mul x4, x3, x3	 
	mov x2, x21			      // Coordenada X (centro del circulo)
	mov x1, x22			     // Coordenada Y
	movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
	bl circle
	sub x3,x3,1
	movz x10, 0x66, lsl 16
	movk x10, 0xB2FF, lsl 00
	bl circle

	mov x3, #8                // Radio del circulo
	mul x4, x3, x3	 
	add x2, x21, 80			      // Coordenada X (centro del circulo)
	add x1, x22, 100			     // Coordenada Y
	movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
	bl circle 
	sub x3,x3,1
	movz x10, 0x66, lsl 16
	movk x10, 0xB2FF, lsl 00
	bl circle

	mov x3, #8              // Radio del circulo
	mul x4, x3, x3	 
	add x2, x21,110		      // Coordenada X (centro del circulo)
	add x1, x22, 30			     // Coordenada Y
	movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
	bl circle 
	sub x3,x3,1
	movz x10, 0x66, lsl 16
	movk x10, 0xB2FF, lsl 00
	bl circle

	mov x3, #8              // Radio del circulo
	mul x4, x3, x3	 
	add x2, x21, 120		      // Coordenada X (centro del circulo)
	add x1, x22, 200			     // Coordenada Y
	movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
	bl circle
	sub x3,x3,1
	movz x10, 0x66, lsl 16
	movk x10, 0xB2FF, lsl 00
	bl circle 

	mov x3, #8                // Radio del circulo
	mul x4, x3, x3	 
	add x2, x21, 450			      // Coordenada X (centro del circulo)
	add x1, x22, 80			     // Coordenada Y
	movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
	bl circle 
	sub x3,x3,1
	movz x10, 0x66, lsl 16
	movk x10, 0xB2FF, lsl 00
	bl circle

	mov x3, #8                // Radio del circulo
	mul x4, x3, x3	 
	add x2, x21, 550			      // Coordenada X (centro del circulo)
	add x1, x22, 50		     	// Coordenada Y
	movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
	bl circle
	sub x3,x3,1
	movz x10, 0x66, lsl 16
	movk x10, 0xB2FF, lsl 00
	bl circle 

	mov x3, #8              // Radio del circulo
	mul x4, x3, x3	 
	add x2, x21, 400			      // Coordenada X (centro del circulo)
	sub x1, x22, 10			     // Coordenada Y
	movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
	bl circle 
	sub x3,x3,1
	movz x10, 0x66, lsl 16
	movk x10, 0xB2FF, lsl 00
	bl circle

	mov x3, #8                // Radio del circulo
	mul x4, x3, x3	 
	add x2, x21, 50		      // Coordenada X (centro del circulo)
	add x1, x22, 120			     // Coordenada Y
	movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
	bl circle
	sub x3,x3,1
	movz x10, 0x66, lsl 16
	movk x10, 0xB2FF, lsl 00
	bl circle

	mov x3, #8                // Radio del circulo
	mul x4, x3, x3	 
	add x2, x21, 450			      // Coordenada X (centro del circulo)
	add x1, x22, 250		     // Coordenada Y
	movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
	bl circle
	sub x3,x3,1
	movz x10, 0x66, lsl 16
	movk x10, 0xB2FF, lsl 00
	bl circle

	mov x3, #8                // Radio del circulo
	mul x4, x3, x3	 
	add x2, x21, 530			      // Coordenada X (centro del circulo)
	sub x1, x22, 130			     // Coordenada Y
	movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
	bl circle
	sub x3,x3,1
	movz x10, 0x66, lsl 16
	movk x10, 0xB2FF, lsl 00
	bl circle

	mov x3, #8                // Radio del circulo
	mul x4, x3, x3	 
	add x2, x21, 50			      // Coordenada X (centro del circulo)
	sub x1, x22, 60			     // Coordenada Y
	movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
	bl circle 
	sub x3,x3,1
	movz x10, 0x66, lsl 16
	movk x10, 0xB2FF, lsl 00
	bl circle
	
//--------------------------------------------BOB ESPONJA------------------------------------------------//

	// --------------- CUERPO ---------------//

	add x1, x19, xzr // Coordenada X
	add x2, x18, xzr // Coordenada Y
	movz x3, 170 // Ancho
	movz x4, 250 // Alto
	movz x10, 0xFF, lsl 16
	movk x10, 0xFF33, lsl 00 
	bl rectangle
	
	// ---------- CACHETES BOB --------------//
	
	mov x3, #5                // Radio del circulo
    mul x4, x3, x3
    add x2, x19, 40                  // Coordenada X (centro del circulo)
    add x1, x18, 90               // Coordenada Y
	movz x10, 0xFF, lsl 16
    movk x10, 0x678B, lsl 00
    bl circle
	
	//------- DIENTES BOB ------------------//

	add x1, x19, 88 // Coordenada X
	add x2, x18, 112 // Coordenada Y
	movz x3, 10 // Ancho
	movz x4, 15 // Alto
	movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00 
	bl rectangle
	
	add x1,x19,74 // Coordenada X
	add x2, x18, 112 // Coordenada Y
	movz x3, 10 // Ancho
	movz x4, 15 // Alto
	movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00 
	bl rectangle

	// ----------------- SONRISA -----------//

	mov x3, #52              // Radio del circulo
    mul x4, x3, x3
    add x2, x19 ,85                  // Coordenada X (centro del circulo)
    add x1, x18, 63                // Coordenada Y
	movz x10, 0x00, lsl 16
    movk x10, 0x0000, lsl 00
    bl circle
	mov x3, #55                // Radio del circulo
    add x2, x19,85                  // Coordenada X (centro del circulo)
    add x1, x18,57                 // Coordenada Y
	movz x10, 0xFF, lsl 16
    movk x10, 0xFF33, lsl 00
    bl circle

	//---------- CACHETE IZQUIERDO -------//

	mov x3, #8                // Radio del circulo
    mul x4, x3, x3
    add x2, x19,43                  // Coordenada X (centro del circulo)
    add x1, x18,95                // Coordenada Y
	movz x10, 0xFF, lsl 16
    movk x10, 0xA07A, lsl 00
    bl circle
	mov x3, #7                // Radio del circulo
    add x2, x19,45                  // Coordenada X (centro del circulo)
    add x1, x18,96                // Coordenada Y
	movz x10, 0xFF, lsl 16
    movk x10, 0xFF33, lsl 00
    bl circle

	//----------- PECAS IZQUIERDA ---------//

	mov x3, #1                // Radio del circulo
    mul x4, x3, x3
    add x2, x19, 43                  // Coordenada X (centro del circulo)
    add x1, x18, 93                // Coordenada Y
	movz x10, 0x8B, lsl 16
    movk x10, 0x4513, lsl 00
    bl circle               
    add x2, x19, 43                  // Coordenada X (centro del circulo)
    add x1, x18, 97                // Coordenada Y
    bl circle              
    add x2, x19,50                  // Coordenada X (centro del circulo)
    add x1, x18,96                // Coordenada Y
    bl circle

	// ------ CACHETE DERECHO -----------//

	mov x3, #8                // Radio del circulo
    mul x4, x3, x3
    add x2, x19,124                  // Coordenada X (centro del circulo)
    add x1, x18, 95                // Coordenada Y
	movz x10, 0xFF, lsl 16
    movk x10, 0xA07A, lsl 00
    bl circle
	mov x3, #7                // Radio del circulo
    add x2, x19,122                  // Coordenada X (centro del circulo)
    add x1, x18,96                // Coordenada Y
	movz x10, 0xFF, lsl 16
    movk x10, 0xFF33, lsl 00
    bl circle

	//------- PECAS DERECHAS -----------//
	
	mov x3, #1                // Radio del circulo
    add x2, x19,123                 // Coordenada X (centro del circulo)
    add x1, x18, 93                // Coordenada Y
	movz x10, 0x8B, lsl 16
    movk x10, 0x4513, lsl 00
    bl circle
    add x2, x19,120                  // Coordenada X (centro del circulo)
    add x1, x18,97               // Coordenada Y
    bl circle
    add x2, x19,126                  // Coordenada X (centro del circulo)
    add x1, x18,96                // Coordenada Y
    bl circle

	// ---------- PANTALON BOB --------//

	mov x1, x19 // Coordenada X
	add x2, x18,170 // Coordenada Y
	movz x3, 170 // Ancho
	movz x4, 87 // Alto
	movz x10, 0xCD, lsl 16
	movk x10, 0x853F, lsl 00 
	bl rectangle

	// --------- CINTURON -------- //

	add x1, x19, 10 // Coordenada X
	add x2, x18, 200 // Coordenada Y
	movz x3, 30 // Ancho
	movz x4, 10 // Alto
	movz x10, 0x8B, lsl 16
	movk x10, 0x4513, lsl 00 
	bl rectangle
	add x2, x18, 200 // Coordenada Y
	add x1,x1,40
	movz x4, 10 // Alto
	bl rectangle
	add x2, x18, 200 // Coordenada Y
	add x1, x1, 40
	movz x4, 10 // Alto
	bl rectangle
	add x2, x18, 200 // Coordenada Y
	add x1, x1, 40
	movz x4, 10 // Alto
	bl rectangle 

	// ----------- CAMISA BOB ------- //

	mov x1, x19 // Coordenada X
	add x2, x18,160 // Coordenada Y
	movz x3, 170 // Ancho
	movz x4, 30 // Alto
	movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00 
	bl rectangle

	//---------- CORBATA BOB -----------//

	add x1, x19,80 // Coordenada X
	add x2, x18,160 // Coordenada Y
	movz x3, 10 // Ancho
	movz x4, 50 // Alto
	movz x10, 0xFF, lsl 16
	movk x10, 0x6666, lsl 00 
	bl rectangle

	//-------- PESTAÑAS IZQUIERDAS ------------//

	cbnz x27, skip1
	add x1, x19,39 // Coordenada X
	add x2, x18,29 // Coordenada Y
	movz x3, 3 // Ancho
	movz x4, 11 // Alto
	movz x10, 0x00, lsl 16
	movk x10, 0x0000, lsl 00 
	bl rectangle
	add x1, x19,47 // Coordenada X
	add x2, x18,25 // Coordenada Y
	movz x3, 3 // Ancho
	movz x4, 20 // Alto
	bl rectangle
	add x1, x19,57 // Coordenada X
	add x2, x18,29 // Coordenada Y
	movz x3, 3 // Ancho
	movz x4, 11 // Alto
	bl rectangle
  
 	//----------- PESTAÑAS DERECHAS ------------ //

  	add x1, x19,109 // Coordenada X
	add x2, x18,29 // Coordenada Y
	movz x3, 3 // Ancho
	movz x4, 11 // Alto
	bl rectangle
	add x1, x19,117 // Coordenada X
	add x2, x18,25 // Coordenada Y
	movz x3, 3 // Ancho
	movz x4, 20 // Alto
	bl rectangle
	add x1, x19,127 // Coordenada X
	add x2, x18,29 // Coordenada Y
	movz x3, 3 // Ancho
	movz x4, 11 // Alto
	bl rectangle
	
	// ------------- OJOS BOB ------------- //

skip1:

	mov x3, #26                // Radio del circulo
    mul x4, x3, x3
    add x2, x19,50                  // Coordenada X (centro del circulo)
    add x1, x18,60                 // Coordenada Y
	movz x10, 0x00, lsl 16
    movk x10, 0x0000, lsl 00
    bl circle
	add x2, x2, 70
	bl circle 
	sub x3, x3, 1                // Radio del circulo
    add x2, x19,50                   // Coordenada X (centro del circulo)
    add x1, x18,60                 // Coordenada Y
	movz x10, 0xF5, lsl 16
    movk x10, 0xFFFA, lsl 00
    bl circle
	add x2, x2, 70
	bl circle 

	// --------- PUPILAS ------------//

	mov x3, #10                // Radio del circulo
    mul x4, x3, x3
    add x2, x19,50                 // Coordenada X (centro del circulo)
    add x1, x18,60                // Coordenada Y
	movz x10, 0x40, lsl 16
    movk x10, 0xE0D0, lsl 00
    bl circle
	add x2, x2, 70
	bl circle 
	sub x3, x3,5                // Radio del circulo
    add x2, x19,50                  // Coordenada X (centro del circulo)
    add x1, x18,60                  // Coordenada Y
	movz x10, 0x00, lsl 16
    movk x10, 0x0000, lsl 00
    bl circle
	add x2, x2, 70
	bl circle 

	// ------------- PARPADOS -------- //

	cbz x27, skip2
	mov x3, #26                // Radio del circulo
    mul x4, x3, x3
    add x2, x19,50                  // Coordenada X (centro del circulo)
    add x1, x18,60                 // Coordenada Y
	movz x10, 0xFF, lsl 16
    movk x10, 0xD700, lsl 00
    bl circle
	add x2, x2, 70
	bl circle 

skip2:

	//---------- MANCHAS BOB ----------//

	mov x3, #3                // Radio del circulo
    mul x4, x3, x3
    add x2, x19,10                  // Coordenada X (centro del circulo) 
    add x1, x18,60                // Coordenada Y 
	movz x10, 0xB8, lsl 16
    movk x10, 0x860B, lsl 00
    bl circle
	mov x3, #10 
	add x2,x2,3 //253X
	sub x1,x1,20 //140Y
	bl circle
	mov x3, #7  
	add x2,x2,137 //390x
	sub x1,x1,20 //120y
	bl circle
	mov x3, #12  
	sub x2,x2,20 //370x
	add x1,x1,110 //230y
	bl circle 
	mov x3, #4
	sub x2,x2,20 //350x
	add x1,x1,20 //250y
	bl circle
	mov x3, #11
	sub x2,x2,70 //280x
	sub x1,x1,10 //240y
	bl circle
	mov x3, #6
	sub x2,x2,13 //370x
	sub x1,x1,20 //220y  
	bl circle
	
	//----------- MEDIAS -------------//

    add x1, x19, 45 // Coordenada X
    add x2, x18, 260 // Coordenada Y
    movz x3, 10 // Ancho
    movz x4, 80 // Alto
    movz x10, 0xFF, lsl 16
    movk x10, 0xFFFF, lsl 00 
    bl rectangle 
	add x1, x19, 115 // Coordenada X
    add x2, x18, 260 // Coordenada Y
    movz x3, 10 // Ancho
    movz x4, 80 // Alto 
    bl rectangle 

    //--------- PIERNAS ---------//

    add x1, x19, 45 // Coordenada X
    add x2, x18, 257 // Coordenada Y
    movz x3, 10 // Ancho
    movz x4, 40 // Alto
    movz x10, 0xFF, lsl 16
    movk x10, 0xFF00, lsl 00 
    bl rectangle 
	add x1, x19, 115 // Coordenada X
    add x2, x18, 257 // Coordenada Y
    movz x3, 10 // Ancho
    movz x4, 40 // Alto
    bl rectangle 

	//------------ ZAPATOS --------------//

    add x1, x19, 26 // Coordenada X //266
    add x2, x18, 337 // Coordenada Y
    movz x3, 30 // Ancho
    movz x4, 10 // Alto
    movz x10, 0x00, lsl 16
    movk x10, 0x0000, lsl 00 
    bl rectangle 
	add x1, x19, 115 // Coordenada X //
    add x2, x18, 337 // Coordenada Y
    movz x3, 30 // Ancho
    movz x4, 10 // Alto 
    bl rectangle 

    //---------- BRAZOS --------------//
	
    sub x1, x19, 30 // Coordenada X
    add x2, x18, 160 // Coordenada Y
    movz x3, 30 // Ancho
    movz x4, 10 // Alto
	movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
    bl rectangle
	add x1, x19, 160 // Coordenada X
    add x2, x18, 160 // Coordenada Y
    movz x3, 30 // Ancho
    movz x4, 10 // Alto
    bl rectangle
	sub x1, x19, 80 // Coordenada X
    add x2, x18, 160 // Coordenada Y
    movz x3, 50 // Ancho
    movz x4, 10 // Alto
    movz x10, 0xFF, lsl 16
    movk x10, 0xFF00, lsl 00 
    bl rectangle
    sub x1, x19, 80 // Coordenada X
    add x2, x18, 80 // Coordenada Y
    movz x3, 10 // Ancho
    movz x4, 80 // Alto
    bl rectangle
	add x1, x19, 210 // Coordenada X
    add x2, x18, 160 // Coordenada Y
    movz x3, 10 // Ancho
    movz x4, 80 // Alto
    bl rectangle
	add x1, x19, 190 // Coordenada X
    add x2, x18, 160 // Coordenada Y
    movz x3, 20 // Ancho
    movz x4, 10 // Alto
    bl rectangle

//--------------------------------------MOVIMIENTO Y GPIOM------------------------------------------//

/* 
	Utilizamos delay ya que de esta manera podemos evitar que nuestra animacion porpadee, debido a la cantidad de formas que se pintan por frame.
	Al ser un dibujo grande y con muchas formas, si no utilizamos delay, el dibujo se veria como si parpadeara, ya que se pintaria y borraria muy rapido.
	En este caso utilizamos delay de 3000, ya que es el que mejor se ve, pero se puede modificar a gusto.
 */

movz x4, 3000 //ACA DEFINO EL DELAY
delayr:
    bl delay
    sub x4, x4, 1
    cmp x4, 0
    b.ne delayr

    b end

/* 
	En end se encuentra el codigo que se utiliza para el movimiento del personaje, el cual se mueve con las teclas WASD y ESPACIO para que pestanee.
 */

end:
		
	mov x9, GPIO_BASE
	str wzr, [x9, GPIO_GPFSEL0]
	ldr w15, [x9, GPIO_GPLEV0]
	and w11, w15, 0x10
	cmp w11, 0x10
	b.eq tecla_d
	and w11, w15, 0x04
	cmp w11,0x04
	b.eq tecla_a
	and w11, w15, 0x08
	cmp w11,0x08
	b.eq tecla_s
	and w11, w15, 0x02
	cmp w11,0x02
	b.eq tecla_w
	and w11, w15, 0x20
	cmp w11,0x20
	b.eq tecla_esp
	add x21,x21,8 //(50)
	cmp x21,50
	b repeat
	B end

	tecla_a: //movimiento hacia la izquierda de bob 
	sub x19, x19, 10
	b repeat

	tecla_d:	//movimiento hacia la derecha de bob 
	add x19, x19, 10
	b repeat 

	tecla_w:	//movimiento hacia arriba de bob 
	cmp x18,50
	b.lt end
	sub x18, x18, 10
	b repeat 

	tecla_s:	//movimiento hacia abajo de bob 
	cmp x18,130
	b.gt end
	add x18, x18, 10
	b repeat 

	tecla_esp:	//Pestañeo de bob 
    cbz x27, on
    mov x27, #0
    b repeat
    on:
        mov x27, #1
		b repeat 	

    // Infinite Loop
InfLoop:
    b InfLoop
