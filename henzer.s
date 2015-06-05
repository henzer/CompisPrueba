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
	
factorial_0:

	LDR R0 , [SP, #-4]
	MOV R1, #2
	CMP R0, R1
	BLT IFTRUE1
	B IFFALSE1
IFTRUE1:
	MOV R1, #1
	POP {R0}
	PUSH {R1}
	MOV PC, R0


	B NEXT1
IFFALSE1:
	LDR R1 , [SP, #-4]
	MOV R2, #1
	SUB R3, R1, R2

	SUB SP, SP, #8
	LDR R11, =retorno1
	PUSH {R11}
	STR R3, [SP, #-4] 

	BL factorial_0
retorno1:
	POP {R2}
	ADD SP, SP, #8
	SUB R0, SP, #8
	STR R2, [R0]

	LDR R0 , [SP, #-8]
	LDR R2 , [SP, #-4]
	MUL R1, R0, R2
	POP {R2}
	PUSH {R1}
	MOV PC, R2


NEXT1:

main_0:
	MOV R1, #5

	SUB SP, SP, #4
	LDR R11, =retorno2
	PUSH {R11}
	STR R1, [SP, #-4] 

	BL factorial_0
retorno2:
	POP {R2}
	ADD SP, SP, #4
	SUB R0, SP, #4
	STR R2, [R0]

	LDR R0 , [SP, #-4]
	PUSH {R0, R1}
	MOV R1, R0
	LDR R0, =$int
	BL printf
	POP {R0, R1}

	MOV R3, #4

	SUB SP, SP, #4
	LDR R11, =retorno3
	PUSH {R11}
	STR R3, [SP, #-4] 

	BL factorial_0
retorno3:
	POP {R4}
	ADD SP, SP, #4
	SUB R2, SP, #4
	STR R4, [R2]

	LDR R2 , [SP, #-4]
	PUSH {R0, R1}
	MOV R1, R2
	LDR R0, =$int
	BL printf
	POP {R0, R1}

	MOV R5, #3

	SUB SP, SP, #4
	LDR R11, =retorno4
	PUSH {R11}
	STR R5, [SP, #-4] 

	BL factorial_0
retorno4:
	POP {R6}
	ADD SP, SP, #4
	SUB R4, SP, #4
	STR R6, [R4]

	LDR R4 , [SP, #-4]
	PUSH {R0, R1}
	MOV R1, R4
	LDR R0, =$int
	BL printf
	POP {R0, R1}

	MOV R7, #2

	SUB SP, SP, #4
	LDR R11, =retorno5
	PUSH {R11}
	STR R7, [SP, #-4] 

	BL factorial_0
retorno5:
	POP {R8}
	ADD SP, SP, #4
	SUB R6, SP, #4
	STR R8, [R6]

	LDR R6 , [SP, #-4]
	PUSH {R0, R1}
	MOV R1, R6
	LDR R0, =$int
	BL printf
	POP {R0, R1}

	POP {R8}
	PUSH {R0}
	MOV PC, R8
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
