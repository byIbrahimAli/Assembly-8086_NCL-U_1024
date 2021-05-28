
; ==============================================================
;  			     TASK 15
; ==============================================================
	CLO			; Close unwanted windows.
	MOV	AL,5	; Initial value set
	CALL	30	; Procedure

; ------------------------- DOUBLE VALUE -----------------------

	ORG	30	; Code starts at address [30]
	PUSH	BL	; Save register on the stack
	MOV	BL,2	; Copy 2 into BL
	MUL	AL,BL	; Double AL, store value in AL
	POP	BL	; Restore original register
	RET

	END
; ==============================================================