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
	LDR R0 , [SP, #-4]
	PUSH {R0, R1}
	MOV R1, R0
	LDR R0, =$int
	BL printf
	POP {R0, R1}

	LDR R2 , [SP, #-4]
	LDR R3 , [SP, #-8]
	ADD R4, R2, R3
	SUB R1, SP, #12
	STR R4, [R1]

	LDR R1 , [SP, #-12]
	POP {R4}
	PUSH {R1}
	MOV PC, R4


main_0:
	MOV R4, #1
	MOV R1, #1

	SUB SP, SP, #4
	LDR R0, =retorno1
	PUSH {R0}

	STR R4, [SP, #-4] 
	STR R1, [SP, #-8] 

	BL suma_0
retorno1:
	POP {R1}
	ADD SP, SP, #4
	SUB R3, SP, #4
	STR R1, [R3]

	LDR R3 , [SP, #-4]
	PUSH {R0, R1}
	MOV R1, R3
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
