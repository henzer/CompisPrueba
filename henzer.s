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
	
fib_0:
	LDR R0 , [SP, #-4]
	MOV R1, #100
	ADD R2, R0, R1
	POP {R1}
	PUSH {R2}
	MOV PC, R1


main_0:
	MOV R1, #5
	SUB R0, SP, #8
	STR R1, [R0]

	MOV R1, #0
	SUB R0, SP, #4
	STR R1, [R0]

STARTWHILE1:
	LDR R0 , [SP, #-4]
	MOV R1, #10
	CMP R0, R1
	BLT WHILETRUE1
	B NEXT4
WHILETRUE1:
	LDR R0 , [SP, #-4]
	MOV R2, #1
	ADD R3, R0, R2
	SUB R1, SP, #4
	STR R3, [R1]

	LDR R1 , [SP, #-4]
	PUSH {R0, R1}
	MOV R1, R1
	LDR R0, =$int
	BL printf
	POP {R0, R1}


	LDR R3 , [SP, #-4]
	MOV R2, #5
	CMP R3, R2
	BEQ IFTRUE1
	B NEXT7
IFTRUE1:
	LDR R0 , [SP, #-4]

	SUB SP, SP, #8
	LDR R11, =retorno1
	PUSH {R11}
	STR R0, [SP, #-4] 

	BL fib_0
retorno1:
	POP {R4}
	ADD SP, SP, #8
	SUB R3, SP, #8
	STR R4, [R3]

	LDR R3 , [SP, #-8]
	PUSH {R0, R1}
	MOV R1, R3
	LDR R0, =$int
	BL printf
	POP {R0, R1}


NEXT7:
	B STARTWHILE1
NEXT4:
	POP {R4}
	PUSH {R0}
	MOV PC, R4
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
	$int:	.asciz "%d\n"
	$char:	.asciz "%c\n"
	$vacio:	.asciz " "
	$indexoutofbounds:	.asciz "Error.-IndexOutOfBoundsException!\n"
