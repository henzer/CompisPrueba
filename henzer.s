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
	MOV R1, #2
	CMP R0, R1
	BLT IFTRUE1
	B IFFALSE1
IFTRUE1:
	LDR R1 , [SP, #-4]
	POP {R0}
	PUSH {R1}
	MOV PC, R0


	B NEXT1
IFFALSE1:
	LDR R1 , [SP, #-4]
	MOV R2, #1
	SUB R3, R1, R2

	SUB SP, SP, #12
	LDR R11, =retorno1
	PUSH {R11}
	STR R3, [SP, #-4] 

	BL fib_0
retorno1:
	POP {R2}
	ADD SP, SP, #12
	SUB R0, SP, #8
	STR R2, [R0]

	LDR R2 , [SP, #-4]
	MOV R1, #2
	SUB R4, R2, R1

	SUB SP, SP, #12
	LDR R11, =retorno2
	PUSH {R11}
	STR R4, [SP, #-4] 

	BL fib_0
retorno2:
	POP {R1}
	ADD SP, SP, #12
	SUB R0, SP, #12
	STR R1, [R0]

	LDR R0 , [SP, #-8]
	LDR R1 , [SP, #-12]
	ADD R2, R0, R1
	POP {R1}
	PUSH {R2}
	MOV PC, R1


NEXT1:

main_0:
	MOV R1, #1

	SUB SP, SP, #4
	LDR R11, =retorno3
	PUSH {R11}
	STR R1, [SP, #-4] 

	BL fib_0
retorno3:
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

	MOV R3, #2

	SUB SP, SP, #4
	LDR R11, =retorno4
	PUSH {R11}
	STR R3, [SP, #-4] 

	BL fib_0
retorno4:
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
	LDR R11, =retorno5
	PUSH {R11}
	STR R5, [SP, #-4] 

	BL fib_0
retorno5:
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

	MOV R7, #4

	SUB SP, SP, #4
	LDR R11, =retorno6
	PUSH {R11}
	STR R7, [SP, #-4] 

	BL fib_0
retorno6:
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

	MOV R9, #5

	SUB SP, SP, #4
	LDR R11, =retorno7
	PUSH {R11}
	STR R9, [SP, #-4] 

	BL fib_0
retorno7:
	POP {R10}
	ADD SP, SP, #4
	SUB R8, SP, #4
	STR R10, [R8]

	LDR R8 , [SP, #-4]
	PUSH {R0, R1}
	MOV R1, R8
	LDR R0, =$int
	BL printf
	POP {R0, R1}

	POP {R10}
	PUSH {R0}
	MOV PC, R10
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
