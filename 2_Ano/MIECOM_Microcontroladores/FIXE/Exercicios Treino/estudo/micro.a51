
#include <89C51RX2.INC>

CSEG at 0h
JMP MAIN

CSEG AT 13H
JMP ENVIAR
//JMP ISR_TIMER0
CSEG AT 30H

CONFIG_EX1:
	SETB EX1
	SETB P3.3
	SETB IT1
	RET

RS_232:
		MOV SCON,#50H
		MOV T2CON,#34H
		MOV RCAP2H,#0FFH
		MOV RCAP2L,#0D9H
		RET

MAIN:
	SETB EA
	CALL CONFIG_EX1
	CALL RS_232
	MOV A,#50H
	JMP $

ENVIAR:
	CLR TI
	MOV SBUF,A
	JNB TI,$
	RETI
	

	;MOV R0,#60H
	;MOV R3,#5

//	MOV DPTR,#LISTA
//	CLR A
//	MOVC A,@A+DPTR
//	;SETB TR1
//	JMP $
//
//ISR_TIMER0:
//	;SETB P3.3
//	MOV SBUF,A
//	CLR TI
//	JNB TI,$
//	INC DPTR
//	CLR A
//	//MOVC A,@A+DPTR
//	;INC A
//	MOV A,"P"
//	MOV P1,A
//	MOV TMOD ,#01H
//	MOV TH0,HIGH(-50000)
//	MOV TL0,LOW(-50000)
//	SETB TR0
//	CLR TF0
//	JNB TF0,$
//	MOV P1,#0FFH
//	DJNZ R3,LOOP
//	;CALL CONFIG_TIMER0
//	;MOV R4, #10H
//	;CJNE A,#'Z'+1,LOOP
//	;MOV A,#'A'
//	MOV DPTR,#LISTA
//	CLR A 
//	MOVC A,@A+DPTR
//	MOV R3,#35
//	JMP LOOP
//
//LOOP:
//	RETI
//
//LISTA:
//DB "P"
//
//CONFIG_TIMER0:
//MOV TMOD, #01H
//MOV TH0, HIGH(-50000)
//MOV TH1, LOW(-50000)
//SETB TR0
//JNB TF0, $
//CLR TF0
//DJNZ R4, CONFIG_TIMER0
//RET


  	 
	;DJNZ R3,LER
	;MOV R0,#60H	
	;MOV R3,#5
	;CALL LIGA

//ENVIAR:
//	MOV A,@R0
//	INC R0
//	CALL ECO
//	DJNZ R3,ENVIAR
//	CALL LIGA
//	JMP MAIN
//ECO:
//	MOV SBUF,A
//	CLR TI
//	JNB TI,$
//	RET
//LIGA:
//MOV P1,#0
//CALL ESPERA
//MOV P1,#0FFH
//RET
//		
//ESPERA:
//MOV R7,#030H
//MOV TMOD,#01H
//LOOP:
//MOV TH0,#HIGH(-50000)
//MOV TL0,#LOW(-50000)
//SETB TR0
//JNB TF0,$
//CLR TF0
//DJNZ R7,LOOP
//RET

END