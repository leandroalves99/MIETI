#include<89C51Rx2.Inc>

CSEG AT 00h

JMP MAIN
CSEG AT 30h

MAIN:
	CALL CONFIG_SERIE
	MOV R2,#13
	MOV DPTR,#TABELA
	MOV P1,#51

ENVIAR:	
	CLR A
	MOVC A,@A+DPTR
	INC DPTR
	CLR TI
	MOV SBUF,A
	JNB TI,$
	DJNZ R2,ENVIAR

TABELA:
	DB	"MICRO TESTE 1"

CONFIG_SERIE:
	MOV SCON ,#50h
	MOV T2CON,#34H
	MOV RCAP2H,#0FFH
	MOV RCAP2L,#0D9H
	RET
END	