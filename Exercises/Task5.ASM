; ----- EXAMPLE 2 ------- HEXADECIMAL --------------------------

; ===== CONTROL THE TRAFFIC LIGHTS =============================

	CLO		; Close unwanted windows.
Start:
			; Turn off all the traffic lights.
	MOV AL,90	; Copy 10010000 into the AL register.
	OUT 01		; Send AL to Port One (The traffic lights).
			; Turn on all the traffic lights.
	MOV AL,D0	; Copy ######## into the AL register.
	OUT 01		; Send AL to Port One (The traffic lights).
	MOV AL,30	; Copy ######## into the AL register.
	OUT 01		; Send AL to Port One (The traffic lights).
	MOV AL,50	; Copy ######## into the AL register.
	OUT 01		; Send AL to Port One (The traffic lights).
	MOV AL,90	; Copy ######## into the AL register.
	OUT 01		; Send AL to Port One (The traffic lights).
	MOV AL,90	; Copy ######## into the AL register.
	OUT 01		; Send AL to Port One (The traffic lights).
	MOV AL,98	; Copy ######## into the AL register.
	OUT 01		; Send AL to Port One (The traffic lights).
	MOV AL,84	; Copy ######## into the AL register.
	OUT 01		; Send AL to Port One (The traffic lights).
	MOV AL,88	; Copy ######## into the AL register.
	OUT 01		; Send AL to Port One (The traffic lights).
	MOV AL,90	; Copy ######## into the AL register.
	OUT 01		; Send AL to Port One (The traffic lights).

	JMP Start	; Jump back to the start.
	END		; Program ends.
	
; ===== Program Ends ==========================================