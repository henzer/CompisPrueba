.TEXT
.ALIGN 2
.GLOBAL main
main:
	LDR R0, =$EXIT
	STR LR, [R0]
	MOV R12, SP
	SUB SP, SP, #0
	LDR R0, =$FIN
	PUSH {R0}
	BL main_0
	
suma_0:
	MOV R1, #10
	SUB R0, SP, #4
	STR R1, [R0]

STARTWHILE1:
	LDR R0 , [SP, #-4]
	MOV R1, #0
	CMP R0, R1
	BGT WHILETRUE1
	B NEXT2
WHILETRUE1:
	LDR R0 , [SP, #-4]
	MOV R2, #1
	SUB R3, R0, R2
	SUB R1, SP, #4
	STR R3, [R1]

	LDR R1 , [SP, #-4]
	PUSH {R1, R0}
	MOV R1, R1
	LDR R0, =$int
	BL printf
	POP {R1, R0}

	B STARTWHILE1
NEXT2:
	POP {R3}
	PUSH {R0}
	MOV PC, R3

main_0:

	SUB SP, SP, #0

	LDR R0, =retorno1
	PUSH {R0}
	BL suma_0
retorno1:
	POP {R3}
	ADD SP, SP, #0

	POP {R3}
	PUSH {R0}
	MOV PC, R3
$ERROR:
	PUSH {R0}
	LDR R0, =$indexoutofbounds
	BL printf
	POP {R0}

$FIN:
	MOV R0,#0
	MOV R3,#0
	ADD SP, SP, #0
	LDR LR, =$EXIT
	LDR LR, [LR]
	BX LR

.DATA
.ALIGN 2
	$GLOBAL: .word 0
	$EXIT: .word 0
	$int:	.asciz "%d"
	$char:	.asciz "%c"
	$vacio:	.asciz " "
	$indexoutofbounds:	.asciz "Error.-IndexOutOfBoundsException!"
