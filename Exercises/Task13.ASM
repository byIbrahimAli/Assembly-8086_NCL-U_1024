; === TASK 13 === CHARACTER INPUT OUTPUT =======================

; ==============================================================
;  Input key presses from the keyboard until Enter is pressed.
; ==============================================================


	CLO		; Close unwanted windows
	MOV	BL,C0	; BL points to C0 of VDU
	MOV	CL,80	; Incrementer for text not printed
	
Input:	IN	00	; Wait for input - save to AL
	MOV	[CL],AL	; Move AL to address CL
	CMP	AL,0D	; Enter key pressed?
	JZ	Reset	; ^ If so move to Print
	INC	CL	; Increments CL for next char
	JMP	Input	; Jump to Input

Reset:	MOV	CL,80	; Reset incrementer
	JMP	Print	; Jump to Print

Print:	MOV	DL,[CL]
	MOV	[BL],DL	; Move CL to address BL | Display through VDU
	CMP	DL,00	; If DL is null
	JZ	End	; ^ Jump to End
	INC	BL	; Increment BL
	INC	CL	; Increment CL
	JMP	Print	; Jump to Print

End:
	END
; ==============================================================