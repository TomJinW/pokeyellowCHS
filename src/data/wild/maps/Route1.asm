Route1WildMons:
	def_grass_wildmons 25 ; encounter rate
; IF DEF(_DEBUG)
; 	db  3, NO_MON
; 	db  4, $1F
; 	db  2, FOSSIL_KABUTOPS
; 	db  3, FOSSIL_AERODACTYL
; 	db  2, MON_GHOST
; 	db  3, $A0
; 	db  5, NO_MON
; 	db  4, RATTATA
; 	db  6, PIDGEY
; 	db  7, PIDGEY
; ELSE
	db  3, PIDGEY
	db  4, PIDGEY
	db  2, RATTATA
	db  3, RATTATA
	db  2, PIDGEY
	db  3, PIDGEY
	db  5, PIDGEY
	db  4, RATTATA
	db  6, PIDGEY
	db  7, PIDGEY
; ENDC
	end_grass_wildmons

	def_water_wildmons 0 ; encounter rate
	end_water_wildmons
