.include "data.s"
.include "background.s"
.include "shapes.s"
.globl main

main:
	mov x25,SCREEN_WIDTH
    // x0 contiene la direccion base del framebuffer
    mov x20, x0 // Guarda la dirección base del framebuffer en x20

    // Dibujar el fondo
    // Dibujar la arena
	movz x1, 0
	movz x2, 380
	movz x3, SCREEN_WIDTH
	movz x4, 100
	movz x10, 0x4A, lsl 16
	movz x10, 0x6F78, lsl 00
	bl rectangle


    // Infinite Loop
InfLoop:
    b InfLoop
