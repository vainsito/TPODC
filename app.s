	.equ SCREEN_WIDTH,   640
	.equ SCREEN_HEIGH,   480
	.equ BITS_PER_PIXEL, 32

	.equ GPIO_BASE,    0x3f200000
	.equ GPIO_GPFSEL0, 0x00
	.equ GPIO_GPLEV0,  0x34

	.globl main

main:
	// x0 contiene la direccion base del framebuffer
	mov x20, x0 // Guarda la dirección base del framebuffer en x20
	//---------------- CODE HERE -----------------------------------

	mov x2, SCREEN_HEIGH         // Y Size
	mov x3, #0
	mov x4, x2
	
loop1:
	mov x1, SCREEN_WIDTH         // X Size 
loop0:
	capa_0:
		bl color_fondo

	capa_2:
		cmp x2,#100 //Si la fila donde estamos es mas chica que esa altura entonces pintamos la arena 
		b.le color_arena 

	capa_3:

		mov x3, #50                 // Radio del circulo
		mul x4, x3, x3	 
		mov x5, #300			      // Coordenada X (centro del circulo)
		mov x6, #370			     // Coordenada Y
		bl pez

	capa_4:

		//Capa de los objetos//

		//ojos del pez//
		mov x3, #20                // Radio del circulo
		mul x4, x3, x3	 
		mov x5, #300			      // Coordenada X (centro del circulo)
		mov x6, #370			     // Coordenada Y
		bl ojos_pez

		mov x3, #20                 // Radio del circulo
		mul x4, x3, x3	 
		mov x5, #260			      // Coordenada X (centro del circulo)
		mov x6, #370			     // Coordenada Y
		bl ojos_pez

		//Pupilas//
		//pupila izquierda//
		mov x3, #10                // Radio del circulo
		mul x4, x3, x3	 
		mov x5, #300			      // Coordenada X (centro del circulo)
		mov x6, #370			     // Coordenada Y
		bl pupilas_pez
		//pupila derecha//
		mov x3, #10                 // Radio del circulo
		mul x4, x3, x3	 
		mov x5, #260			      // Coordenada X (centro del circulo)
		mov x6, #370			     // Coordenada Y
		bl pupilas_pez

		//Labios pez//
		mov x5, #250   	       // coordenada x (esquina derecha)
		mov x6, #330		       // coordenada y (esqueina inferior)
		mov x3, #70               // rectangle Length
		mov x4, #20			   // rectangle Height
		bl labios               // imprime un cuadrado con los datos dados
		//comisura Labios//
		mov x5, #250   	       // coordenada x (esquina derecha)
		mov x6, #340		       // coordenada y (esqueina inferior)
		mov x3, #60               // rectangle Length
		mov x4, #5			   // rectangle Height
		bl labios_comisura               // imprime un cuadrado con los datos dados

		//Aleta//
		mov x5, #348   	       // coordenada x (esquina derecha)
		mov x6, #340		       // coordenada y (esqueina inferior)
		mov x3, #30               // rectangle Length
		mov x4, #70			   // rectangle Height
		bl Aleta               // imprime un cuadrado con los datos dados



	 
//-----------------------------------------------------------------------------------------------------//

ciclo:
	stur w10,[x0]  // Colorear el pixel N
	add x0,x0,4    // Siguiente pixel
	sub x1,x1,1    // Decrementar contador X
	cbnz x1,loop0  // Si no terminó la fila, salto
	sub x2,x2,1    // Decrementar contador Y
	cbnz x2,loop1  // Si no es la última fila, salto

//---------------------------------------------------------------------------------------------------//

/*
pinta_fondo:
	cmp x4,x2 	//Para que en la primera iteracion de pinte de el color que querias 
	b.eq end 	//pinta
	cmp x3,#3 	//Quiero saber si llego el momento de cambiar de color 
	b.lt contador	//si es menor aumento el contador 
	sub x10,x10,x11 	//si son iguales paso al siguiente color 
	mov x3,#0 	//lo reinicio a 0
	b end
contador:
	add x3,x3,#1 	//aumento el contador
	mov x4,x2 	//copio para que siga pintando de ese color 
end:
	ret*/

pez:                
	sub x9, x5, x1 
	sub x11, x6, x2
	mul x9, x9, x9
	mul x11, x11, x11
	add x9, x9, x11
	cmp x4, x9
	b.ge color_pez
	ret

ojos_pez:                
	sub x9, x5, x1 
	sub x11, x6, x2
	mul x9, x9, x9
	mul x11, x11, x11
	add x9, x9, x11
	cmp x4, x9
	b.ge color_ojos
	ret

pupilas_pez:
	sub x9, x5, x1 
	sub x11, x6, x2
	mul x9, x9, x9
	mul x11, x11, x11
	add x9, x9, x11
	cmp x4, x9
	b.ge color_pupilas
	ret

labios: 
	sub x9, x5, x1
	sub x11, x6, x2
	cmp x9, xzr
	b.ge end_labios
	cmp x11, xzr
	b.ge end_labios
	add x5, x5, x3
	add x6, x6, x4
	sub x9, x11, x2
	sub x9, x5, x1
	sub x11, x6, x2
	cmp x9, xzr
	b.le end_labios
	cmp x11, xzr
	b.le end_labios
	b.ge color_labios
	end_labios:
	ret
	
labios_comisura: 
	sub x9, x5, x1
	sub x11, x6, x2
	cmp x9, xzr
	b.ge end_labios_comisura
	cmp x11, xzr
	b.ge end_labios_comisura
	add x5, x5, x3
	add x6, x6, x4
	sub x9, x11, x2
	sub x9, x5, x1
	sub x11, x6, x2
	cmp x9, xzr
	b.le end_labios_comisura
	cmp x11, xzr
	b.le end_labios_comisura
	b.ge color_pupilas
	end_labios_comisura:
	ret

Aleta: 
	sub x9, x5, x1
	sub x11, x6, x2
	cmp x9, xzr
	b.ge end_aleta
	cmp x11, xzr
	b.ge end_aleta
	add x5, x5, x3
	add x6, x6, x4
	sub x9, x11, x2
	sub x9, x5, x1
	sub x11, x6, x2
	cmp x9, xzr
	b.le end_aleta
	cmp x11, xzr
	b.le end_aleta
	b.ge color_aleta
	end_aleta:
	ret

//---------------------------------------------------------------------------------------------------//


color_pez:
	movz x10, 0xE6, lsl 16
	movk x10, 0x0808, lsl 00     // w10 = -color gris (0xA2ABB1)
	ret

color_arena:
	movz x10, 0xCE, lsl 16 
	movk x10, 0xC4A8, lsl 00
	b capa_3

color_fondo: 
	movz x10, 0x00, lsl 16
	movk x10, 0x0033, lsl 00
	ret

color_ojos:
	movz x10, 0xFF, lsl 16
	movk x10, 0xFFFF, lsl 00
	ret

color_pupilas:
	movz x10, 0x00, lsl 16
	movk x10, 0x0000, lsl 00
	ret

color_labios:
	movz x10, 0xFF, lsl 16
	movk x10, 0x99CC, lsl 00
	ret

color_aleta:
	movz x10, 0x66, lsl 16
	movk x10, 0x3300, lsl 00
	ret

	// Ejemplo de uso de gpios (teclas)
	mov x9, GPIO_BASE

	// Atención: se utilizan registros w porque la documentación de broadcom
	// indica que los registros que estamos leyendo y escribiendo son de 32 bits

	// Setea gpios 0 - 9 como lectura
	str wzr, [x9, GPIO_GPFSEL0]

	// Lee el estado de los GPIO 0 - 31
	ldr w10, [x9, GPIO_GPLEV0]

	// And bit a bit mantiene el resultado del bit 2 en w10 (notar 0b... es binario)
	// al inmediato se lo refiere como "máscara" en este caso:
	// - Al hacer AND revela el estado del bit 2
	// - Al hacer OR "setea" el bit 2 en 1
	// - Al hacer AND con el complemento "limpia" el bit 2 (setea el bit 2 en 0)
	and w11, w10, 0b00000010

	// si w11 es 0 entonces el GPIO 1 estaba liberado
	// de lo contrario será distinto de 0, (en este caso particular 2)
	// significando que el GPIO 1 fue presionado

	//---------------------------------------------------------------
	// Infinite Loop

InfLoop:
	b InfLoop
