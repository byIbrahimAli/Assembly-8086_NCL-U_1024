;;==================================================
;;==================== CLOCK 5 =====================
;;==================================================
	JMP Start		; Jump to Start
	DB 03			; Hardware Timer Interrupt Vector

; ~~~~~~~~~~~~ HARDWARE TIMER INTERRUPT VECTOR ~~~~~~~~~~~~

	ORG 03			; At [03] intstructions
	CLI			; Clear interrupt flag so interrupt isn't triggered
	CMP CL, 3A		; Compare CL to RHS NINE, this identifies whether the LHS display must be increased and RHS to be reset
	JZ LHS			; If CL == RHS NINE jump to LHS to increase LHS and reset RHS

RHS:	; ....................... Increases RHS (right-hand side)

	MOV AL, [CL]		; Copy [CL] into AL
	INC AL			; INC AL to display the digit on the RHS
	INC CL			; Point CL to the next digit
	IRET			; Return from interrupt

LHS:	; ....................... Increases LHS (left-hand side)

	MOV CL, 30		; Point CL to ZERO, this resets RHS to ZERO
	MOV AL, [BL]		; Copy [BL] to AL
	INC BL			; Point BL to the next digit
	CMP BL, 3B		; [1] Check whether BL is pointing to the memory address after RHS NINE - Meaning counter is at '99'
	JZ Restart		; If so, then jump to Restart, otherwise continue counting
	IRET			; Return from interrupt

Restart:; ....................... Restarts the counter once it displays '99'
	MOV AL, FA		; AL = ZERO ------------
	OUT 02			; 			| This resets the display to '00'
	MOV AL, FB		; AL = RHS ZERO		|
	OUT 02			; ----------------------
	MOV CL, 31		; Move CL to ONE - CL used for RHS -----| This points BL and CL to ONE, so when AL is next equal to either
	MOV BL, 31		; Move BL to ONE - BL used for LHS -----| register it will next diplay ONE and continue increasing...
	IRET			; Return from interrupt
	
; ~~~~~~~~~~~~ CHARACTER ARRAY ~~~~~~~~~~~~
	DB FA			; ZERO
	DB 0A			; ONE
	DB B6			; TWO
	DB 9E			; THREE
	DB 4E			; FOUR
	DB DC			; FIVE
	DB FC			; SIX
	DB 8A			; SEVEN
	DB FE			; EIGHT
	DB DE			; NINE
	DB DF			; RHS NINE

; ~~~~~~~~~~~~ IDLE LOOP ~~~~~~~~~~~~
Start:
	STI			; Set I flag
	MOV AL, FA		; AL = ZERO ------------
	OUT 02			;			| This sets the initial display to '00'
	MOV AL, FB		; AL = RHS ZERO		|
	OUT 02			; ----------------------
	MOV CL, 31		; Move CL to ONE - CL used for RHS -----| This points BL and CL to ONE, so when AL is next equal to either
	MOV BL, 31		; Move BL to ONE - BL used for LHS -----| register it will next diplay ONE and continue increasing...
Idle:
	STI			; Set interrupt flag
	OUT 02			; Outputs AL until AL is changed from interrupt
	JMP Idle		; Loop

; ~~~~~~~~~~~~ END OF PROGRAM ~~~~~~~~~~~~

	END

;; Explanation:
;; - Register BL is used to store the digit to be displayed on the LHS (left-hand side)
;; - Register CL is used to store the digit to be displayed on the RHS (right-hand side)
;; [1] - At this stage, when LHS is displaying NINE, BL would've incremented to RHS NINE (due to the layout of the DB's and how I increment)
;; 	 therefore, I needed to check whether BL was pointing to the memory address after that to initialise the restart, otherwise if I 
;;	 compared to RHS NINE in RAM it wouldn't display the NINE, instead it will stop at '89' and jump to restart.
