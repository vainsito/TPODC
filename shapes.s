.ifndef shapes_s
.equ shapes_s, 0

.include "data.s"

/*
  Funcion Rectangle: Dibuja un cudrado de ancho y alto asignado en las posiciones (x,y).
  Registros predefinidos: x1: X, x2: Y, x3: Width, x4: Height, x10: Color
  Registros seteados: x5:Pixel, x6.

*/
rectangle: 
rectangle_draw_row: //x5 = x20 +  4*[X + (Y*640)]
	mov x5, SCREEN_WIDTH
	mul x5, x2, x5
	add x5, x5, x1
	lsl x5, x5, #2
	add x5, x5, x20
	mov x6, x3
rectangle_draw_col:
		stur w10, [x5]
		add x5, x5, #4
		sub x6, x6, #1
		cbnz x6, rectangle_draw_col
	add x2, x2, #1
	sub x4, x4, #1
	cbnz x4, rectangle_draw_row

	ret

draw_arena:
    movz x1, 0
	movz x2, 380
	movz x3, SCREEN_WIDTH
	movz x4, 100
    movz x10, 0x44, lsl 16
    movz x10, 0x0F2, lsl 00
    
	bl rectangle

.endif
