.TEXT
.ALIGN 2
.GLOBAL main
main:
	LDR R0, =$EXIT
	STR LR, [R0]
	MOV R12, SP
	SUB SP, SP, #4
	LDR R0, =$FIN
	PUSH {R0}
	BL main_0
	
suma_0:
	MOV R2, #5
	MOV R0, #1

	CMP R0, #10
	BGE $ERROR
	MOV R1, #4
	MUL R1, R0, R1
	ADD R1, R1, #4
	SUB R1, SP, R1
	STR R2, [R1]
	MOV R2, #1

	CMP R2, #10
	BGE $ERROR
	MOV R3, #4
	MUL R3, R2, R3
	ADD R3, R3, #4
	LDR R3 , [SP, -R3]
	MOV R4, #2
	ADD R5, R3, R4
	SUB R1, R12, #4
	STR R5, [R1]
	LDR R1 , [R12, #-4]
	PUSH {R1, R0}
	MOV R1, R1
	LDR R0, =$int
	BL printf
	POP {R1, R0}
	POP {R5}
	PUSH {R0}
	MOV PC, R5

main_0:
	SUB SP, SP, #0
	LDR R0, =retorno1
	PUSH {R0}
	BL suma_0
retorno1:
	POP {R5}
	ADD SP, SP, #0
	POP {R5}
	PUSH {R0}
	MOV PC, R5
$ERROR:
	PUSH {R0}
	LDR R0, =$indexoutofbounds
	BL printf
	POP {R0}

$FIN:
	MOV R0,#0
	MOV R3,#0
	ADD SP, SP, #4
	LDR LR, =$EXIT
	BX LR

.DATA
.ALIGN 2
	$GLOBAL: .word 0
	$int:	.asciz "%d"
	$char:	.asciz "%c"
	$vacio:	.asciz " "
	$indexoutofbounds:	.asciz "Error.-IndexOutOfBoundsException!"
