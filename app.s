.include "data.s"
.include "background.s"

.globl main
main:
	// x0 contiene la direccion base del framebuffer
	mov x20, x0 // Guarda la dirección base del framebuffer en x20
	//---------------- CODE HERE -----------------------------------

	bl background

	//---------------------------------------------------------------
	// Infinite Loop

InfLoop:
	b InfLoop
