
; ----- TASK 6 ------- USING ASCII CODES --------------------------

	CLO		; Close unwanted windows.
; ======== IMMEDIATE ADDRESSING & DIRECT ADDRESSING ========

	MOV AL,48 ; Copy ASCII value H (48 Hex) to AL register
	MOV [C0],AL ; Copy value in AL to RAM location [C0]
	
	MOV AL,45 ; Copy ASCII value E (45 Hex) to AL register
	MOV [C1],AL ; Copy value in AL to RAM location [C1]

	MOV AL,4C ; Copy ASCII value L (4C Hex) to AL register
	MOV [C2],AL ; Copy value in AL to RAM location [C2]

	MOV AL,4C ; Copy ASCII value L (4C Hex) to AL register
	MOV [C3],AL ; Copy value in AL to RAM location [C3]

	MOV AL,4F ; Copy ASCII value O (4F Hex) to AL register
	MOV [C4],AL ; Copy value in AL to RAM location [C4]

	END
; - Immediate addressing used to copy ASCII value to register (AL)
; - Direct addressing used to copy content of AL to selected RAM
;   location
; ------------------------------------------------------------------