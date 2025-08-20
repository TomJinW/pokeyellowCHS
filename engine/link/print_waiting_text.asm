PrintWaitingText::
	hlcoord 2, 8
	lb bc, 2, 13
	ld a, [wIsInBattle]
	and a
	jr z, .trade
; battle
	call TextBoxBorder
	jr .border_done
.trade
	call CableClub_TextBoxBorder
.border_done
	hlcoord 4, 10
	ld de, WaitingText
	call PlaceString
	ld c, 50
	jp DelayFrames

WaitingText:
	db "Waiting...!@"
