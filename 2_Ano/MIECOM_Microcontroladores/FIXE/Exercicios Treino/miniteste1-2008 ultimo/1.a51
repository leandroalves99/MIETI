CSEG AT 0H
JMP MAIN

CSEG AT 230H
STRING:
	DB	"2013 OLA MUNDO !!"

CSEG AT 30H

MAIN:
	MOV DPTR, #230H
	MOV R4, #30H
	MOV R5, #60H

LOOP:
	MOV 30H, #30H
	MOV R2,#0AH
	CLR A
	MOVC A, @A+DPTR
COMP:
	CJNE A,30H,SALTA
	//INC DPTR
	MOV R3, DPL
	MOV DPH, #00H
	MOV DPL, R4
	INC R4
	MOVX @DPTR,A
	INC R3
	MOV DPH, #02H
	MOV DPL, R3
	JMP LOOP
SALTA:
	INC 30H
	DJNZ R2,COMP
REPOR:
	
   	MOV R3, DPL
 	MOV DPH, #00H
	MOV DPL, R5
	INC R5
	MOVX @DPTR,A
	INC R3
	MOV DPH, #02H
	MOV DPL, R3
	JMP LOOP

END