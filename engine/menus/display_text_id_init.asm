; function that performs initialization for DisplayTextID
DisplayTextIDInit::
	xor a
	ld [wListMenuID], a
	ld a, [wAutoTextBoxDrawingControl]
	bit 0, a
	jr nz, .skipDrawingTextBoxBorder
	ldh a, [hSpriteIndexOrTextID] ; text ID (or sprite ID)
	and a
	jr nz, .notStartMenu
; if text ID is 0 (i.e. the start menu)
; Note that the start menu text border is also drawn in the function directly
; below this, so this seems unnecessary.
; CHS_Fix 16 start menu fix
IF DEF(_DEBUG) 
	push af
	call DebugPressedOrHeldB
	jr z, .bIsNotPressed
	ld a,[wSimulatedJoypadStatesIndex] ; walk though walls
	xor a,$FF
	ld [wSimulatedJoypadStatesIndex],a
.bIsNotPressed
	pop af
ENDC
	ld a, 7 ;
	cp a, $6 ;
	jr c, .normalStartMenu ;
	CheckEvent EVENT_GOT_POKEDEX
; start menu with pokedex
	hlcoord 10, 0
	lb bc, 14, 8
	jr nz, .drawTextBoxBorder
; start menu without pokedex
	hlcoord 10, 0
	lb bc, 12, 8
	jr .drawTextBoxBorder
; if text ID is not 0 (i.e. not the start menu) then do a standard dialogue text box
.normalStartMenu ; CHS_Fix 16
; start menu with pokedex ; CHS_Fix 16
	CheckEvent EVENT_GOT_POKEDEX ; CHS_Fix 16
	hlcoord 12, 0 ; CHS_Fix 16
	lb bc, 14, 6 ; CHS_Fix 16
	jr nz, .drawTextBoxBorder ; CHS_Fix 16
; start menu without pokedex
	hlcoord 12, 0 ; CHS_Fix 16
	lb bc, 12, 6 ; CHS_Fix 16
	jr .drawTextBoxBorder ; CHS_Fix 16
.notStartMenu
	hlcoord 0, 12
	lb bc, 4, 18
.drawTextBoxBorder
	call TextBoxBorder
.skipDrawingTextBoxBorder
	ld hl, wFontLoaded
	set 0, [hl]
	ld hl, wFlags_0xcd60
	bit 4, [hl]
	res 4, [hl]
	jr nz, .skipMovingSprites
	call UpdateSprites
.skipMovingSprites
; loop to copy [x#SPRITESTATEDATA1_FACINGDIRECTION] to
; [x#SPRITESTATEDATA2_ORIGFACINGDIRECTION] for each non-player sprite
; this is done because when you talk to an NPC, they turn to look your way
; the original direction they were facing must be restored after the dialogue is over
	ld hl, wSprite01StateData1FacingDirection
	ld c, $0f
	ld de, $10
.spriteFacingDirectionCopyLoop
	ld a, [hl] ; x#SPRITESTATEDATA1_FACINGDIRECTION
	inc h
	ld [hl], a ; [x#SPRITESTATEDATA2_ORIGFACINGDIRECTION]
	dec h
	add hl, de
	dec c
	jr nz, .spriteFacingDirectionCopyLoop
; loop to force all the sprites in the middle of animation to stand still
; (so that they don't like they're frozen mid-step during the dialogue)
	ld hl, wSpritePlayerStateData1ImageIndex
	ld de, $10
	ld c, e
.spriteStandStillLoop
	ld a, [hl]
	cp $ff ; is the sprite visible?
	jr z, .nextSprite
; if it is visible
	and $fc
	ld [hl], a
.nextSprite
	add hl, de
	dec c
	jr nz, .spriteStandStillLoop
	ld b, $9c ; window background address
	call CopyScreenTileBufferToVRAM ; transfer background in WRAM to VRAM
	xor a
	ldh [hWY], a ; put the window on the screen
	call LoadFontTilePatterns
	ld a, $01
	ldh [hAutoBGTransferEnabled], a ; enable continuous WRAM to VRAM transfer each V-blank
	ret
