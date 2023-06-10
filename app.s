.include "data.s"
.include "shapes.s"
.globl main

main:
	mov x25,SCREEN_WIDTH
    // x0 contiene la direccion base del framebuffer
    mov x20, x0 // Guarda la dirección base del framebuffer en x20

// ------------------------------ Dibujar el fondo --------------------------------------- //

	mov x20, x0
	movz x10, 0x19, lsl 16
	movk x10, 0x1970, lsl 00 // Color de fondo

	mov x2, SCREEN_HEIGH         // Y Size 
loop1:
	mov x1, SCREEN_WIDTH         // X Size
loop0:
	stur w10,[x0]	   // Set color of pixel N
	add x0,x0,4	   // Next pixel
	sub x1,x1,1	   // decrement X counter
	cbnz x1,loop0	   // If not end row jump
	sub x2,x2,1	   // Decrement Y counter
	cbnz x2,loop1	   // if not last row, jump
// ------------------------------ --------------- --------------------------------------- //
	
// ------------------------------ -------- Arena ---------------------------------------- //

	movz x1, 0
	movz x2, 380
	movz x3, SCREEN_WIDTH
	movz x4, 100
	movz x10, 0xF0, lsl 16
	movk x10, 0xE68C, lsl 00 
	bl rectangle
// ------------------------------==================--------------------------------------- //

    // Infinite Loop
InfLoop:
    b InfLoop
