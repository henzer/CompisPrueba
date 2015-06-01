.TEXT
.ALIGN 2
.GLOBAL main
main:
	STMFD SP!,{LR}
	SUB SP, SP, #8
	LDR R0, =$GLOBAL
	STR SP, [R0]
	LDR R0, =$FIN
	PUSH {R0}
	BL main_0
	
suma_0:
	LDR R0, [SP, #0]
	LDR R1, [SP, #4]
	ADD R2, R0, R1
	POP {R1}
	PUSH {R2}
	MOV PC, R1

main_0:
	LDR R1, =$GLOBAL
	LDR R1, [R1, #0]
	LDR R2, =$GLOBAL
	LDR R2, [R2, #4]
	SUB SP, SP, #4
	STR R1, [SP, #0] 
	STR R2, [SP, #4] 
	LDR R0, =retorno1
	PUSH {R0}
	BL suma_0
retorno1:
	POP {R2}
	ADD SP, SP, #4
	LDR R0, [SP, #0]
	STR R2, [R0]
	LDR R0, [SP, #0]
	PUSH {R1, R0}
	MOV R1, R0
	LDR R0, =$int
	BL printf
	POP {R1, R0}
	POP {R2}
	PUSH {R0}
	MOV PC, R2
$FIN:
	MOV R0,#0
	MOV R3,#0
	POP {R0}
	ADD SP, SP, #8
	LDMFD SP!,{LR}
	BX LR

.DATA
.ALIGN 2
	$GLOBAL: .word 0
	$int:	.asciz "%d"
	$char:	.asciz "%c"
	$vacio:	.asciz " "
	$indexoutofbounds:	.asciz "Error.-IndexOutOfBoundsException!"
