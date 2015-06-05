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
	LDR R1 , [SP, #-8]
	ADD R2, R0, R1
	POP {R1}
	PUSH {R2}
	MOV PC, R1


restar_0:
	LDR R0 , [SP, #-4]
	LDR R1 , [SP, #-8]
	SUB R2, R0, R1
	POP {R1}
	PUSH {R2}
	MOV PC, R1


mult_0:
	LDR R0 , [SP, #-4]
	LDR R1 , [SP, #-8]
	MUL R2, R0, R1
	POP {R1}
	PUSH {R2}
	MOV PC, R1


main_0:
	MOV R1, #100
	MOV R2, #50

	SUB SP, SP, #4
	LDR R11, =retorno1
	PUSH {R11}
	STR R1, [SP, #-4] 
	STR R2, [SP, #-8] 

	BL suma_0
retorno1:
	POP {R3}
	ADD SP, SP, #4
	SUB R0, SP, #4
	STR R3, [R0]

	LDR R0 , [SP, #-4]
	PUSH {R0, R1}
	MOV R1, R0
	LDR R0, =$int
	BL printf
	POP {R0, R1}

	MOV R4, #100
	MOV R5, #50

	SUB SP, SP, #4
	LDR R11, =retorno2
	PUSH {R11}
	STR R4, [SP, #-4] 
	STR R5, [SP, #-8] 

	BL restar_0
retorno2:
	POP {R6}
	ADD SP, SP, #4
	SUB R3, SP, #4
	STR R6, [R3]

	LDR R3 , [SP, #-4]
	PUSH {R0, R1}
	MOV R1, R3
	LDR R0, =$int
	BL printf
	POP {R0, R1}

	MOV R7, #5
	MOV R8, #50

	SUB SP, SP, #4
	LDR R11, =retorno3
	PUSH {R11}
	STR R7, [SP, #-4] 
	STR R8, [SP, #-8] 

	BL mult_0
retorno3:
	POP {R9}
	ADD SP, SP, #4
	SUB R6, SP, #4
	STR R9, [R6]

	LDR R6 , [SP, #-4]
	PUSH {R0, R1}
	MOV R1, R6
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
