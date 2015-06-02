.TEXT
.ALIGN 2
.GLOBAL main
main:
	STMFD SP!,{LR}
	MOV R12, SP
	SUB SP, SP, #4
	LDR R0, =$FIN
	PUSH {R0}
	BL main_0
	
suma_0:
	MOV R1, #10
	SUB R0, SP, #4
	STR R1, [R0]
	LDR R1 ,[SP, #-4]
	MOV R2, #1
	ADD R3, R1, R2
	SUB R0, R12, #4
	STR R3, [R0]
	LDR R0 ,[R12, #-4]
	PUSH {R1, R0}
	MOV R1, R0
	LDR R0, =$int
	BL printf
	POP {R1, R0}
	POP {R3}
	PUSH {R0}
	MOV PC, R3

main_0:
	SUB SP, SP, #0
	LDR R0, =retorno1
	PUSH {R0}
	BL suma_0
retorno1:
	POP {R3}
	ADD SP, SP, #0
	POP {R3}
	PUSH {R0}
	MOV PC, R3
$FIN:
	MOV R0,#0
	MOV R3,#0
	POP {R0}
	ADD SP, SP, #4
	LDMFD SP!,{LR}
	BX LR

.DATA
.ALIGN 2
	$GLOBAL: .word 0
	$int:	.asciz "%d"
	$char:	.asciz "%c"
	$vacio:	.asciz " "
	$indexoutofbounds:	.asciz "Error.-IndexOutOfBoundsException!"
