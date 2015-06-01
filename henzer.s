.TEXT
.ALIGN 2
.GLOBAL main
main:
	STMFD SP!,{LR}
	SUB SP, SP, #0
	LDR R0, =$GLOBAL
	STR SP, [R0]
	LDR R0, =$FIN
	PUSH {R0}
	BL main_0
	
suma_0:
	POP {R0}
	PUSH {R0}
	MOV PC, R0

main_0:
	SUB SP, SP, #0
	LDR R0, =retorno1
	PUSH {R0}
	BL suma_0
retorno1:
	POP {R0}
	ADD SP, SP, #0
	POP {R0}
	PUSH {R0}
	MOV PC, R0
$FIN:
	MOV R0,#0
	MOV R3,#0
	POP {R0}
	ADD SP, SP, #0
	LDMFD SP!,{LR}
	BX LR

	hola
	
.DATA
.ALIGN 2
	$GLOBAL: .word 0
	$int:	.asciz "%d"
	$char:	.asciz "%c"
	$vacio:	.asciz " "
	$indexoutofbounds:	.asciz "Error.-IndexOutOfBoundsException!"