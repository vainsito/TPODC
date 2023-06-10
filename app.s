.include "data.s"
.include "shapes.s"
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
// ------------------------------ -------- Arena ---------------------------------------- //

	movz x1, 0              	// Coordenada X
	movz x2, 380				// Coordenada Y
	movz x3, SCREEN_WIDTH		// Width 
	movz x4, 100				// Heigh 
	movz x10, 0xF0, lsl 16		// Color
	movk x10, 0xE68C, lsl 00 	// Color 
	bl rectangle
// ------------------------------ Cuadrado --------------------------------------- //

	movz x1, 150
	movz x2, 200
	movz x3, 120
	movz x4, 100
	movz x10, 0xF0, lsl 16
	movk x10, 0xE68C, lsl 00 
	bl rectangle
// ----------------------------- Burbujas -----------------------------------------// 
	mov x1, 230		
	mov x2, 100
	mov x3, 50
	movz x10, 0x18, lsl 16
	movk x10, 0x2E3D, lsl 00	

	bl circle 
// ------------------------------  -----------------------------------------------//

    // Infinite Loop
InfLoop:
    b InfLoop
