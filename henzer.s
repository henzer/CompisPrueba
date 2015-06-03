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
	LDR R1 , [SP, #-4]
	LDR R2 , [SP, #-8]
	ADD R3, R1, R2
	SUB R0, SP, #12
	STR R3, [R0]

	LDR R0 , [SP, #-12]
	POP {R3}
	PUSH {R0}
	MOV PC, R3


main_0:
	MOV R3, #10
	SUB R2, SP, #4
	STR R3, [R2]

	MOV R3, #5
	SUB R2, SP, #8
	STR R3, [R2]

	LDR R3 , [SP, #-4]
	LDR R0 , [SP, #-8]

	SUB SP, SP, #12
	LDR R0, =retorno1
	PUSH {R0}
	STR R3, [SP, #-4] 
	STR R0, [SP, #-8] 

	BL suma_0
retorno1:
	POP {R0}
	ADD SP, SP, #12
	SUB R2, SP, #12
	STR R0, [R2]

	LDR R2 , [SP, #-12]
	PUSH {R0, R1}
	MOV R1, R2
	LDR R0, =$int
	BL printf
	POP {R0, R1}

	POP {R0}
	PUSH {R0}
	MOV PC, R0
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
