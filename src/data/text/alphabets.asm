AlphaPointerTable:
	dw UpperCaseAlphabet
	dw UpperCaseAlphabet
	dw UpperCaseAlphabet
	dw UpperCaseAlphabet
	dw UpperCaseAlphabet

InputPointerTable:
	dw InputMethodPINYIN
	dw InputMethodPCHS
	dw InputMethodUPPER
	dw InputMethodLOWER
	dw InputMethodPUNC

UpperCaseAlphabet:
	db "ABCDEFGHI"
	db "JKLMNOPQR"
	db "STUVWXYZ<ED>"

; EmptyCaseAlphabet:
; 	db "         "
; 	db "         "
; 	db "        <ED>"

; LowerCaseAlphabet:
; 	db "abcdefghi"
; 	db "jklmnopqr"
; 	db "stuvwxyz<ED>"

	
; PunctuationAlphabet:
; 	db "×():;[]<PK><MN>"
; 	db "-?!♂♀/<DOT>, "
; 	db "        <ED>"



InputChangePage:
	db "UP  DON@"
	db "@"

	

InputMethodPINYIN:
	db "PIN@"
InputMethodPCHS:
	db "PCH@"
InputMethodUPPER:
	db "UPP@"
InputMethodLOWER:
	db "LOW@"
InputMethodPUNC:
	db "PEN@"
