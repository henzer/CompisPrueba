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
	MOV R1, #1
	POP {R0}
	PUSH {R1}
	MOV PC, R0


	B NEXT1
IFFALSE1:
	LDR R0 , [SP, #-4]
	MOV R1, #1
	SUB R3, R0, R1

	SUB SP, SP, #12
	LDR R11, =retorno1
	PUSH {R11}
	STR R3, [SP, #-4] 

	BL fib_0
retorno1:
	POP {R1}
	ADD SP, SP, #12
	SUB R2, SP, #8
	STR R1, [R2]

	LDR R1 , [SP, #-4]
	MOV R0, #2
	SUB R4, R1, R0

	SUB SP, SP, #12
	LDR R11, =retorno2
	PUSH {R11}
	STR R4, [SP, #-4] 

	BL fib_0
retorno2:
	POP {R0}
	ADD SP, SP, #12
	SUB R2, SP, #12
	STR R0, [R2]

	LDR R2 , [SP, #-8]
	LDR R0 , [SP, #-12]
	ADD R1, R2, R0
	POP {R0}
	PUSH {R1}
	MOV PC, R0


NEXT1:

main_0:
	MOV R0, #5

	SUB SP, SP, #4
	LDR R11, =retorno3
	PUSH {R11}
	STR R0, [SP, #-4] 

	BL fib_0
retorno3:
	POP {R1}
	ADD SP, SP, #4
	SUB R2, SP, #4
	STR R1, [R2]

	LDR R2 , [SP, #-4]
	PUSH {R0, R1}
	MOV R1, R2
	LDR R0, =$int
	BL printf
	POP {R0, R1}

	POP {R1}
	PUSH {R0}
	MOV PC, R1
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
