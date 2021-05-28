
; ----- TASK 10 ------- COUNTING AND JUMP ----------
	MOV	BL,0	; Initial value stored in BL
	MOV	AL,0	; Initial value stored in AL
	MOV	CL,1
	MOV	[A3],CL

Rep:			; Jump back to this label
	ADD	BL,AL	; Add AL to BL, store answer in BL
	MOV	AL,[A3]	; Copy A3 to AL
	MOV	[A3],BL	; Copy BL to RAM Loc A3
	JMP	Rep	; Jump back to Rep

	END		; Program Ends

; ===== Program Ends ===============================