Trade_PrintPlayerMonInfoText:
	hlcoord 4, 0
	ld de, Trade_MonInfoText
	call PlaceString
	ld a, [wTradedPlayerMonSpecies]
	ld [wd11e], a
	predef IndexToPokedex
	hlcoord 10, 0
	ld de, wd11e
	lb bc, LEADING_ZEROES | 1, 3
	call PrintNumber
	hlcoord 4, 2
	ld de, wStringBuffer
	call PlaceString
	hlcoord 10, 4
	ld de, wTradedPlayerMonOT
	call PlaceString
	hlcoord 7, 6
	ld de, wTradedPlayerMonOTID
	lb bc, LEADING_ZEROES | 2, 5
	jp PrintNumber

Trade_PrintEnemyMonInfoText:
	hlcoord 4, 10
	ld de, Trade_MonInfoText
	call PlaceString
	ld a, [wTradedEnemyMonSpecies]
	ld [wd11e], a
	predef IndexToPokedex
	hlcoord 10, 10
	ld de, wd11e
	lb bc, LEADING_ZEROES | 1, 3
	call PrintNumber
	hlcoord 4, 12
	ld de, wcd6d
	call PlaceString
	hlcoord 10, 14
	ld de, wTradedEnemyMonOT
	call PlaceString
	hlcoord 7, 16
	ld de, wTradedEnemyMonOTID
	lb bc, LEADING_ZEROES | 2, 5
	jp PrintNumber

Trade_MonInfoText:
	db   "──№<DOT>"
	next ""
	next "OT/"
	next "<ID>№<DOT>@"
