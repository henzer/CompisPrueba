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

	LDR R0 , [SP, #-4]
	MOV R1, #10
	CMP R0, R1
	BEQ IFTRUE1
	B IFFALSE1
IFTRUE1:
	MOV R2, #1
	SUB R0, SP, #8
	STR R2, [R0]
	B NEXT2
IFFALSE1:
	MOV R2, #2
	SUB R0, SP, #8
	STR R2, [R0]
NEXT2:
	LDR R0 , [SP, #-8]
	PUSH {R1, R0}
	MOV R1, R0
	LDR R0, =$int
	BL printf
	POP {R1, R0}
	POP {R2}
	PUSH {R0}
	MOV PC, R2

main_0:

	SUB SP, SP, #0

	LDR R0, =retorno1
	PUSH {R0}
	BL suma_0
retorno1:
	POP {R2}
	ADD SP, SP, #0
	POP {R2}
	PUSH {R0}
	MOV PC, R2
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
