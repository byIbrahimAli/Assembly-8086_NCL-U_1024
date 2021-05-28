; ----- TASK 4 ------- DIVIDE BY ZERO ---------------------------------

; ===== WORK OUT 63 / 0==========================================
	CLO		; Close unwanted windows.
	MOV AL,63	; Copy a 4 into the AL register.
	DIV AL,00	; Divide AL by 0. Error should be produced.	
	END		; Program ends
; ===== Program Ends ============================================