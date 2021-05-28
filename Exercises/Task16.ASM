
; ==============================================================
;  			     TASK 16
; ==============================================================
	JMP	Start	; Skip past the data table.

	DB	90	; Data table begins.
	DB	90	; 
	DB	D0	; 
	DB	30	; 
	DB	50	; 
	DB	90	; 
	DB	90	; 
	DB	98	; 
	DB	84	; 
	DB	88	; Last entry is also used as end marker

Start:
	MOV	BL,02	; 02 is start address of data table

Rep:
	MOV	AL,[BL]	; Copy data from table to AL
	OUT	01	; Output from AL register to port 01
	CMP	AL,88	; Last item in data table ???
	JZ	Start	; If yes then jump to Start
	INC	BL	; If no then point BL to the next entry
	JMP	Rep	; Jump back to do next table entry

	END
; ==============================================================