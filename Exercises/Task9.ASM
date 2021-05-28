 ;----- TASK 9 ------- COUNTING AND JUMP ----------

	MOV	BL,1	; Initial value stored in BL

Rep:			; Jump back to this label
	MUL	BL,2	; Multiply BL by TWO
	JMP	Rep	; Jump back to Rep

			;- After 80 hex (+128 decimal) SR's Zero Flag is 1
			;  indicating a zero result
			;  	+ "set if the previous calculation result was zero"
			;  	+ Calculation exceeded 8-bits

	END		; Program Ends

; ===== Program Ends ===============================