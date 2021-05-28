; ==============================================================
; 		  TASK 14 | TIME DELAY PROCEDURES
; ==============================================================
;  		    CONTROL THE TRAFFIC LIGHTS 
; ==============================================================

	CLO		; Close unwanted windows.

Start:

				; Turn off all the traffic lights.
	MOV AL,90	; RED	; Copy 10010000 into the AL register.
	OUT 01			; Send AL to Port One (The traffic lights).
				; Turn on all the traffic lights.

	MOV DL,10	; Medium Delay
	CALL 60		; Call procedure @ addr [60]

	MOV AL,D0	; AMB	; Copy 11010000 into the AL register.
	OUT 01			; Send AL to Port One (The traffic lights).

	MOV DL,10	; Medium Delay
	CALL 60		; Call procedure @ addr [60]

	MOV AL,30	; GRE	; Copy 00110000 into the AL register.
	OUT 01			; Send AL to Port One (The traffic lights).

	MOV DL,20	; Large Delay
	CALL 60		; Call procedure @ addr [60]

	MOV AL,50	; AMB	; Copy 01010000 into the AL register.
	OUT 01			; Send AL to Port One (The traffic lights).

	MOV DL,10	; Medium Delay
	CALL 60		; Call procedure @ addr [60]

	MOV AL,90	; RED	; Copy 10010000 into the AL register.
	OUT 01			; Send AL to Port One (The traffic lights).

	MOV DL,20	; Large Delay
	CALL 60		; Call procedure @ addr [60]

	MOV AL,98	; AMB	; Copy 10011000 into the AL register.
	OUT 01			; Send AL to Port One (The traffic lights).

	MOV DL,10	; Medium Delay
	CALL 60		; Call procedure @ addr [60]

	MOV AL,84	; GRE	; Copy 10000100 into the AL register.
	OUT 01			; Send AL to Port One (The traffic lights).

	MOV DL,20	; Large Delay
	CALL 60		; Call procedure @ addr [60]

	MOV AL,88	; AMB	; Copy 10001000 into the AL register.
	OUT 01			; Send AL to Port One (The traffic lights).

	MOV DL,10	; Medium Delay
	CALL 60		; Call procedure @ addr [60]

	MOV AL,90	; RED	; Copy 10010000 into the AL register.
	OUT 01			; Send AL to Port One (The traffic lights).

	MOV DL,10	; Medium Delay
	CALL 60		; Call procedure @ addr [60]

	JMP Start	; Jump back to the start.

; ========================= TIME DELAY ========================= 

	ORG 60		; Generate machine code from address [60]
	
	PUSH DL		; Push DL on stack
	PUSHF		; Save the CPU flags to stack

Rep: 	DEC DL		; Decrement DL
	JNZ REP		; Jump back to Rop if DL wasn't zero
	
	POPF		; Restore the CPU flags from stack
	POP DL		; Restore DL from stack

	RET		; Return from the procedure

; ======== END =================================================
	END		; Program ends.
; ==============================================================