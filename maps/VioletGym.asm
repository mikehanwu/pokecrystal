VioletGym_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

FalknerScript_0x683c2:
	faceplayer
	loadfont
	checkevent EVENT_BEAT_FALKNER
	iftrue .FightDone
	writetext UnknownText_0x68473
	closetext
	loadmovesprites
	winlosstext UnknownText_0x6854a, 0
	loadtrainer FALKNER, 1
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_FALKNER
	loadfont
	writetext UnknownText_0x685af
	playsound SFX_GET_BADGE
	waitbutton
	setflag ENGINE_ZEPHYRBADGE
	checkcode VAR_BADGES
	scall VioletGymTriggerRockets
.FightDone
	checkevent EVENT_GOT_TM31_MUD_SLAP
	iftrue .SpeechAfterTM
	setevent EVENT_BEAT_BIRD_KEEPER_ROD
	setevent EVENT_BEAT_BIRD_KEEPER_ABE
	domaptrigger ELMS_LAB, $2
	specialphonecall SPECIALCALL_ASSISTANT
	writetext UnknownText_0x685c8
	keeptextopen
	verbosegiveitem TM_MUD_SLAP, 1
	iffalse .NoRoomForMudSlap
	setevent EVENT_GOT_TM31_MUD_SLAP
	writetext UnknownText_0x68648
	closetext
	loadmovesprites
	end

.SpeechAfterTM:
	writetext UnknownText_0x68735
	closetext
.NoRoomForMudSlap:
	loadmovesprites
	end

VioletGymTriggerRockets:
	if_equal 7, .RadioTowerRockets
	if_equal 6, .GoldenrodRockets
	end

.GoldenrodRockets
	jumpstd goldenrodrockets

.RadioTowerRockets
	jumpstd radiotowerrockets

TrainerBird_keeperRod:
	trainer EVENT_BEAT_BIRD_KEEPER_ROD, BIRD_KEEPER, ROD, Bird_keeperRodSeenText, Bird_keeperRodBeatenText, 0, Bird_keeperRodScript

Bird_keeperRodScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x68837
	closetext
	loadmovesprites
	end

TrainerBird_keeperAbe:
	trainer EVENT_BEAT_BIRD_KEEPER_ABE, BIRD_KEEPER, ABE, Bird_keeperAbeSeenText, Bird_keeperAbeBeatenText, 0, Bird_keeperAbeScript

Bird_keeperAbeScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x688c7
	closetext
	loadmovesprites
	end

VioletGymGuyScript:
	faceplayer
	loadfont
	checkevent EVENT_BEAT_FALKNER
	iftrue .VioletGymGuyWinScript
	writetext VioletGymGuyText
	closetext
	loadmovesprites
	end

.VioletGymGuyWinScript
	writetext VioletGymGuyWinText
	closetext
	loadmovesprites
	end

VioletGymStatue:
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .Beaten
	jumpstd gymstatue1
.Beaten
	trainertotext FALKNER, 1, $1
	jumpstd gymstatue2

UnknownText_0x68473:
	text "I'm FALKNER, the"
	line "VIOLET #MON GYM"
	cont "leader!"

	para "I'm the weakest"
	line "gym leader."

	para "You can pretty"
	line "much beat me"
	cont "with any #MON."

	para "I don't know how"
	line "I even became a"
	cont "gym leader."

	para "If you lose, then"
	line "you must suck!"

	para "Here I go!"
	line "I'm scared."
	done

UnknownText_0x6854a:
	text "Well, that was"
	line "expected. You"
	cont "won."

	para "Here take my"
	line "money."

	para "And this ugly"
	line "ZEPHYRBADGE"
	done

UnknownText_0x685af:
	text "<PLAYER> received"
	line "ZEPHYRBADGE."
	done

UnknownText_0x685c8:
	text "ZEPHYRBADGE"
	line "raises the attack"
	cont "power of #MON."

	para "It also enables"
	line "#MON to use"

	para "FLASH, which "
	line "lights up tunnels,"

	para "but is useless"
	line "in battles."
	done

UnknownText_0x68648:
	text "When you use a TM"
	line "on a #MON, you"

	para "force it to learn"
	line "a new move."

	para "Do what you want"
	line "with it, you sick"
	cont "jerk."

	para "Also you can only"
	line "use it once."

	para "TM31 is MUD-SLAP."
	line "It'll decrease"

	para "accuracy and do"
	line "some damage."

	para "Test it out!"
	line "Geez, I don't"
	cont "know everything!"
	done

UnknownText_0x68735:
	text "Go away now."
	line "I gotta stand"
	cont "completely still"

	para "for the rest"
	line "of the game"
	cont "doing nothing."
	done

Bird_keeperRodSeenText:
	text "My name is Rod."
	line "Birdkeeper Rod."

	para "Hey, how come"
	line "you don't talk?"

	para "Are you deaf"
	line "or dumb?"

	para "Hahaha."
	done

Bird_keeperRodBeatenText:
	text "Just dumb."
	done

UnknownText_0x68837:
	text "Yo. Pho real."
	done.

	para "Pho is real."
	line "It's Vietnamese"
	cont "noodles!"
	done

Bird_keeperAbeSeenText:
	text "I'll show you!"
	line "Walking in front"
	cont "of me!"
	done

Bird_keeperAbeBeatenText:
	text "Don't walk in"
	line "front of me!"
	cont "I'm Abe!"
	done

UnknownText_0x688c7:
	text "Fool."
	done

VioletGymGuyText:
	text "Yawn. Gonna nap"
	line "with my eyes"
	cont "open."

	done

VioletGymGuyWinText:
	text "Nice battle! For"
	line "a shrimp!"

	para "Good luck beating"
	line "the CHAMP."
	cont "You'll need it."
	done

VioletGym_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $f, $4, 2, VIOLET_CITY
	warp_def $f, $5, 2, VIOLET_CITY

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 13, 3, SIGNPOST_READ, VioletGymStatue
	signpost 13, 6, SIGNPOST_READ, VioletGymStatue

.PersonEvents:
	db 4
	person_event SPRITE_FALKNER, 1, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, 0, 0, FalknerScript_0x683c2, -1
	person_event SPRITE_YOUNGSTER, 6, 7, SPRITEMOVEDATA_STANDING_LEFT, 0, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, 2, 3, TrainerBird_keeperRod, -1
	person_event SPRITE_YOUNGSTER, 10, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 2, -1, -1, (1 << 3) | PAL_OW_BLUE, 2, 3, TrainerBird_keeperAbe, -1
	person_event SPRITE_GYM_GUY, 13, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, 0, 0, VioletGymGuyScript, -1
