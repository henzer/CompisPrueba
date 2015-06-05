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
	
main_0:
	MOV R2, #100
	MOV R0, #0

	CMP R0, #3
	BGE $ERROR
	MOV R1, #4
	MUL R1, R0, R1
	ADD R1, R1, #4
	SUB R1, SP, R1
	STR R2, [R1]

	MOV R3, #200
	MOV R1, #1

	CMP R1, #3
	BGE $ERROR
	MOV R2, #4
	MUL R2, R1, R2
	ADD R2, R2, #4
	SUB R2, SP, R2
	STR R3, [R2]

	MOV R4, #300
	MOV R2, #2

	CMP R2, #3
	BGE $ERROR
	MOV R3, #4
	MUL R3, R2, R3
	ADD R3, R3, #4
	SUB R3, SP, R3
	STR R4, [R3]

	MOV R3, #0

	CMP R3, #3
	BGE $ERROR
	MOV R4, #4
	MUL R4, R3, R4
	ADD R4, R4, #4
	LDR R4 , [SP, -R4]
	PUSH {R0, R1}
	MOV R1, R4
	LDR R0, =$int
	BL printf
	POP {R0, R1}

	MOV R7, #0

	CMP R7, #3
	BGE $ERROR
	MOV R8, #4
	MUL R8, R7, R8
	ADD R8, R8, #4
	LDR R8 , [SP, -R8]
	MOV R9, #10
	ADD R10, R8, R9
	MOV R5, #1

	CMP R5, #3
	BGE $ERROR
	MOV R6, #4
	MUL R6, R5, R6
	ADD R6, R6, #4
	SUB R6, SP, R6
	STR R10, [R6]

	MOV R6, #1

	CMP R6, #3
	BGE $ERROR
	MOV R10, #4
	MUL R10, R6, R10
	ADD R10, R10, #4
	LDR R10 , [SP, -R10]
	PUSH {R0, R1}
	MOV R1, R10
	LDR R0, =$int
	BL printf
	POP {R0, R1}

	POP {R9}
	PUSH {R0}
	MOV PC, R9
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
