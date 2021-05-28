 ;----- TASK 7 ------- COUNTING AND JUMP ----------
	CLO
	MOV	BL,40	; Initial value stored in BL

Rep:			; Jump back to this label
	DEC	BL	; Decrement ONE to BL
	JMP	Rep	; Jump back to Rep

	END		; Program Ends

; ===== Program Ends ===============================