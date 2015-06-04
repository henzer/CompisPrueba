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

	LDR R0 , [SP, #-12]
	MOV R1, #2
	CMP R0, R1
	BLT IFTRUE1
	B IFFALSE1
IFTRUE1:
	MOV R1, #1
	LDR R0, [ SP , #-4 ]
	STR R1, [SP, #-8]
	MOV PC, R0


	B NEXT1
IFFALSE1:
	LDR R1 , [SP, #-12]
	MOV R2, #1
	SUB R3, R1, R2

	SUB SP, SP, #20
	LDR R11, =retorno1
	STR R11, [SP, #-4]
	STR R3, [SP, #-12] 

	BL fib_0
retorno1:
	LDR R2, [SP, #-8]
	ADD SP, SP, #20
	SUB R0, SP, #16
	STR R2, [R0]

	LDR R2 , [SP, #-12]
	MOV R1, #2
	SUB R4, R2, R1

	SUB SP, SP, #20
	LDR R11, =retorno2
	STR R11, [SP, #-4]
	STR R4, [SP, #-12] 

	BL fib_0
retorno2:
	LDR R1, [SP, #-8]
	ADD SP, SP, #20
	SUB R0, SP, #20
	STR R1, [R0]

	LDR R0 , [SP, #-16]
	LDR R1 , [SP, #-20]
	ADD R2, R0, R1
	LDR R1, [ SP , #-4 ]
	STR R2, [SP, #-8]
	MOV PC, R1


NEXT1:

main_0:
	MOV R1, #5
	SUB R0, SP, #16
	STR R1, [R0]

	MOV R1, #0
	SUB R0, SP, #12
	STR R1, [R0]

STARTWHILE1:
	LDR R0 , [SP, #-12]
	MOV R1, #10
	CMP R0, R1
	BEQ WHILETRUE1
	B NEXT8
WHILETRUE1:
	LDR R0 , [SP, #-12]
	PUSH {R0, R1}
	MOV R1, R0
	LDR R0, =$int
	BL printf
	POP {R0, R1}

	MOV R3, #10

	SUB SP, SP, #16
	LDR R11, =retorno3
	STR R11, [SP, #-4]
	STR R3, [SP, #-12] 

	BL fib_0
retorno3:
	LDR R4, [SP, #-8]
	ADD SP, SP, #16
	SUB R2, SP, #16
	STR R4, [R2]

	LDR R2 , [SP, #-16]
	PUSH {R0, R1}
	MOV R1, R2
	LDR R0, =$int
	BL printf
	POP {R0, R1}

	LDR R5 , [SP, #-12]
	MOV R6, #1
	ADD R7, R5, R6
	SUB R4, SP, #12
	STR R7, [R4]

	B STARTWHILE1
NEXT8:
	LDR R4, [ SP , #-4 ]
	STR R0, [SP, #-8]
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
