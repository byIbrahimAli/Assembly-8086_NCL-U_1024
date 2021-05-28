; === TASK 12 === CHARACTER INPUT OUTPUT =======================

; ==============================================================
;  Input key presses from the keyboard until Enter is pressed.
; ==============================================================


	CLO		; Close unwanted windows
	MOV	BL,C0	; BL points to VDU @ C0

Rep:
	IN	00	; Wait for key press - Stored in AL
	CMP	AL,0D	; Was it the Enter key? (ASCII 0D)
	JZ	End	; Jump to End if ^ pressed
	MOV	[BL],AL ; Move AL to address BL | Display through VDU
	INC	BL	; Increment BL
	JMP	Rep	; Jump to Rep
End:
	END
; ==============================================================