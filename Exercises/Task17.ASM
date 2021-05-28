; ==============================================================
;			Example 9 | Text I/O
; ==============================================================
; A program to read in a string of text and store it in RAM.
; The end of text will be labelled with ASCII code zero/null.
; ==============================================================

; THE MAIN PROGRAM
; ^^^^^^^^^^^^^^^^
	MOV	BL,70	; [70] is the address where the text will
			; be stored. The procedure uses this.

	CALL	10	; The procedure at [10] reads in text and
			; places it starting from the address
			; in BL.

			; BL should still contain [70] here.

	CALL	40	; This procedure converts uppercase chars
			; in stored text to lower case

	CALL	90	; This procedure displays the text via the
			; VDU

	HALT		; DON'T USE "END" HERE BY MISTAKE OR THE CODE
    			; FOR THE PROCEDURES WILL NOT BE GENERATED
                
; ==============================================================

; A PROCEDURE TO READ IN THE TEXT
; ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	ORG	10	; Code starts from address [10]

	PUSH	AL	; Save AL onto the stack
	PUSH	BL	; Save BL onto the stack
	PUSHF		; Save the CPU flags onto the stack

Rep:
	IN	00	; Input from port 00 (keyboard)
	CMP	AL,0D	; Was key press the Enter key?
	JZ	Stop	; If yes then jump to Stop
	MOV	[BL],AL	; Copy keypress to RAM at position [BL]
	INC	BL	; BL points to the next location.
	JMP	Rep	; Jump back to get the next character

Stop:
	MOV	AL,0	; This is the NULL end marker
	MOV	[BL],AL	; Copy NULL character to this position.

	POPF		; Restore flags from the stack
	POP	BL	; Restore BL from the stack
	POP	AL	; Restore AL from the stack

	RET		; Return from the procedure.
; ==============================================================

; A PROCEDURE TO DISPLAY TEXT ON THE SIMULATED SCREEN
; ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	ORG	40	; Code starts from address [40]
	
	PUSH	AL	; Save AL onto the stack
	PUSH	BL	; Save BL onto the stack
	PUSH	CL	; Save CL onto the stack
	PUSH	DL	; Save DL onto the stack
	PUSHF		; Save flags onto the stack

Null:	MOV	CL,00	; Copy 00 into register CL
	MOV	AL,[BL]	; Copy [BL] to AL
	CMP	AL,CL	; Check address AL against null
	JZ	End	; ^ If null Jump End if null
			; as there is nothing to display
	MOV	DL,41	; ^ Else move first capital 'A' to register
			; DL

Cap:	CMP	DL,5B	; Check if DL points to character
			; after 'Z'
	JZ	StopTwo	; If so jump to StopTwo
	CMP	AL,DL	; Check if address is capital
	JZ	Conv	; ^ If capital jump to conv
	INC	DL	; ^ Else point DL to next capital
	JMP	CAP	; Keep iterating through all capitals

Conv:	MOV	DL,20	; Copy 20 to register DL
	ADD	AL,DL	; Add 20 to AL
			; This points to lower case
			; character
	MOV	[BL],AL	; Copy AL to [BL]
	INC	BL	; Points BL to next address
	JMP	Null	; Jump to null for next character

StopTwo:
	POPF		; Restore flags from stack
	POP	AL	;
	POP	BL	; Restore BL from stack
	POP	CL	; Restore CL from stack
	POP 	DL	; Restore DL from stack
	RET		; Return from the procedure.
; ==============================================================

; A PROCEDURE TO DISPLAY TEXT ON THE SIMULATED SCREEN
; ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	ORG	90	; Code starts from address [50]
	
	PUSH	AL	; Save AL onto the stack
	PUSH	BL	; Save BL onto the stack
	PUSH	CL	; Save CL onto the stack
	PUSH	DL	; Save DL onto the stack
	PUSHF		; Save flags onto the stack
	
	MOV	DL,C0	; VDU connected to DL

Disp:	MOV	AL,[BL]	; Copy data in [BL] to AL
	MOV	[DL],AL	; Display AL through VDU
	INC	BL	; Points BL to next address
	INC	DL	; Points DL to next address on VDU
	CMP	AL,00	; Check if AL is null
	JNZ	End	; ^ If so jump to End
	JMP	Disp	; ^ Else keep printing

End:
	POP	AL	;
	POP	BL	;
	POP	CL	;
	POP	DL	;
	POPF		;

; ==============================================================
	END		; It is correct to use END at the end.
; ==============================================================