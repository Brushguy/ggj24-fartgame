function loadLevel() {
	with(oMap) {
		instance_destroy();
	}
	with(oPlayerMapDot) {
		instance_destroy();
	}
	var this_level = noone;
	if(global.LEVEL_POINTER == 1)       this_level = loadLevel1();
	else if(global.LEVEL_POINTER == 2)  this_level = loadLevel2();
	else if(global.LEVEL_POINTER == 3)  this_level = loadLevel3();
	else if(global.LEVEL_POINTER == 4)  this_level = loadLevel4();
	else if(global.LEVEL_POINTER == 5)  this_level = loadLevel5();
	else if(global.LEVEL_POINTER == 6)  this_level = loadLevel6();
	else if(global.LEVEL_POINTER == 7)  this_level = loadLevel7();
	else if(global.LEVEL_POINTER == 8)  this_level = loadLevel8();
	else if(global.LEVEL_POINTER == 9)  this_level = loadLevel9();
	else if(global.LEVEL_POINTER == 10) this_level = loadLevel10();
	else                                this_level = loadRandomLevel(global.LEVEL_POINTER);
	
	global.CURRENT_MAP = this_level;
	global.CURRENT_PAR = global.CURRENT_MAP.level_par;
	global.CURRENT_WIND = string(global.CURRENT_MAP.wind_strength) + "MPH " + windDirectionToString(global.CURRENT_MAP.wind_strength, global.CURRENT_MAP.wind_direction);

	evaluatePosition();
	with(oGameManager) {
		status_text = "LVL" + string(global.CURRENT_MAP.level_number) + ": " + global.CURRENT_MAP.level_name;
	}
	with(o3DDisplay) {
		reverse_grass = !reverse_grass;
	}
}

function loadLevel1() {
	var l1_tiles = [
		[ TTYPE.GRASS, TTYPE.TOILET, TTYPE.GRASS ],
		[ TTYPE.FOREST, TTYPE.GRASS, TTYPE.FOREST ],
		[ TTYPE.FOREST, TTYPE.GRASS, TTYPE.FOREST ],
		[ TTYPE.GRASS, TTYPE.GRASS, TTYPE.FOREST ],
		[ TTYPE.GRASS, TTYPE.GRASS, TTYPE.GRASS ],
		[ TTYPE.GRASS, TTYPE.GRASS, TTYPE.GRASS ],
	];
	var new_map = instance_create_layer(260, 20, "Map", oMap, {
		tiles : l1_tiles,
		player_start_pos_x : 1,
		player_start_pos_y : 5,
		level_name : "The One-Man Band",
		level_number : 1,
		level_par : 3
	})
	return new_map;
}

function loadLevel2() {
	var l1_tiles = [
		[ TTYPE.GRASS, TTYPE.TOILET, TTYPE.GRASS ],
		[ TTYPE.FOREST, TTYPE.GRASS, TTYPE.FOREST ],
		[ TTYPE.FOREST, TTYPE.GRASS, TTYPE.FOREST ],
		[ TTYPE.GRASS, TTYPE.FOREST, TTYPE.FOREST ],
		[ TTYPE.SAND, TTYPE.GRASS, TTYPE.SAND ],
		[ TTYPE.SAND, TTYPE.GRASS, TTYPE.GRASS ],
	];
	var new_map = instance_create_layer(260, 20, "Map", oMap, {
		tiles : l1_tiles,
		player_start_pos_x : 1,
		player_start_pos_y : 5,
		level_name : "Cuttin' the Cheese",
		level_number : 2,
		level_par : 5
	})
	return new_map;
}

function loadLevel3() {
	var l1_tiles = [
		[ TTYPE.GRASS, TTYPE.FOREST, TTYPE.GRASS ],
		[ TTYPE.FOREST, TTYPE.TOILET, TTYPE.FOREST ],
		[ TTYPE.FOREST, TTYPE.GRASS, TTYPE.FOREST ],
		[ TTYPE.GRASS, TTYPE.FOREST, TTYPE.FOREST ],
		[ TTYPE.SAND, TTYPE.GRASS, TTYPE.SAND ],
		[ TTYPE.FOREST, TTYPE.GRASS, TTYPE.SAND ],
		[ TTYPE.SAND, TTYPE.GRASS, TTYPE.SAND ],
	];
	var new_map = instance_create_layer(260, 20, "Map", oMap, {
		tiles : l1_tiles,
		player_start_pos_x : 1,
		player_start_pos_y : 6,
		level_name : "Breaking Wind",
		level_number : 3,
		level_par : 5,
		wind_strength : 4,
		wind_direction : 0
	})
	return new_map;
}

function loadLevel4() {
	var l1_tiles = [
		[ TTYPE.GRASS, TTYPE.GRASS, TTYPE.TOILET ],
		[ TTYPE.FOREST, TTYPE.GRASS, TTYPE.FOREST ],
		[ TTYPE.FOREST, TTYPE.GRASS, TTYPE.FOREST ],
		[ TTYPE.FOREST, TTYPE.FOREST, TTYPE.FOREST ],
		[ TTYPE.SAND, TTYPE.GRASS, TTYPE.SAND ],
		[ TTYPE.LAKE, TTYPE.GRASS, TTYPE.LAKE ],
		[ TTYPE.SAND, TTYPE.GRASS, TTYPE.SAND ],
	];
	var new_map = instance_create_layer(260, 20, "Map", oMap, {
		tiles : l1_tiles,
		player_start_pos_x : 1,
		player_start_pos_y : 6,
		level_name : "Raspberry Tart",
		level_number : 4,
		level_par : 4,
		wind_strength : 0,
		wind_direction : 0
	})
	return new_map;
}

function loadLevel5() {
	var l1_tiles = [
		[ TTYPE.TOILET, TTYPE.FOREST, TTYPE.FOREST ],
		[ TTYPE.FOREST, TTYPE.FOREST, TTYPE.FOREST ],
		[ TTYPE.GRASS, TTYPE.LAKE, TTYPE.GRASS ],
		[ TTYPE.GRASS, TTYPE.GRASS, TTYPE.GRASS ],
		[ TTYPE.SAND, TTYPE.GRASS, TTYPE.SAND ],
		[ TTYPE.SAND, TTYPE.GRASS, TTYPE.SAND ],
		[ TTYPE.LAKE, TTYPE.GRASS, TTYPE.LAKE ],
		[ TTYPE.LAKE, TTYPE.GRASS, TTYPE.LAKE ],
	];
	var new_map = instance_create_layer(260, 20, "Map", oMap, {
		tiles : l1_tiles,
		player_start_pos_x : 1,
		player_start_pos_y : 7,
		level_name : "Let 'Er Rip",
		level_number : 5,
		level_par : 6,
		wind_strength : 8,
		wind_direction : 180
	})
	return new_map;
}

function loadLevel6() {
	var l1_tiles = [
		[ TTYPE.GRASS, TTYPE.TOILET, TTYPE.LAKE ],
		[ TTYPE.GRASS, TTYPE.LAKE, TTYPE.FOREST ],
		[ TTYPE.FOREST, TTYPE.SAND, TTYPE.FOREST ],
		[ TTYPE.GRASS, TTYPE.SAND, TTYPE.SAND ],
		[ TTYPE.GRASS, TTYPE.FOREST, TTYPE.SAND ],
		[ TTYPE.FOREST, TTYPE.GRASS, TTYPE.FOREST ],
		[ TTYPE.GRASS, TTYPE.GRASS, TTYPE.SAND ],
	];
	var new_map = instance_create_layer(260, 20, "Map", oMap, {
		tiles : l1_tiles,
		player_start_pos_x : 1,
		player_start_pos_y : 6,
		level_name : "Lean Bean Machine",
		level_number : 6,
		level_par : 5,
		wind_strength : 4,
		wind_direction : 45
	})
	return new_map;
}

function loadLevel7() {
	var l1_tiles = [
		[ TTYPE.TOILET, TTYPE.SAND, TTYPE.TOILET ],
		[ TTYPE.SAND, TTYPE.LAKE, TTYPE.SAND ],
		[ TTYPE.FOREST, TTYPE.GRASS, TTYPE.FOREST ],
		[ TTYPE.GRASS, TTYPE.FOREST, TTYPE.GRASS ],
		[ TTYPE.SAND, TTYPE.GRASS, TTYPE.FOREST ],
		[ TTYPE.GRASS, TTYPE.GRASS, TTYPE.GRASS ],
		[ TTYPE.LAKE, TTYPE.GRASS, TTYPE.SAND ],
		[ TTYPE.SAND, TTYPE.GRASS, TTYPE.FOREST ],
	];
	var new_map = instance_create_layer(260, 20, "Map", oMap, {
		tiles : l1_tiles,
		player_start_pos_x : 1,
		player_start_pos_y : 6,
		level_name : "Gas Blaster",
		level_number : 7,
		level_par : 5,
		wind_strength : 0,
		wind_direction : 0
	})
	return new_map;
}

function loadLevel8() {
	var l1_tiles = [
		[ TTYPE.FOREST, TTYPE.FOREST, TTYPE.TOILET ],
		[ TTYPE.FOREST, TTYPE.FOREST, TTYPE.FOREST ],
		[ TTYPE.LAKE, TTYPE.GRASS, TTYPE.FOREST ],
		[ TTYPE.LAKE, TTYPE.FOREST, TTYPE.GRASS ],
		[ TTYPE.SAND, TTYPE.GRASS, TTYPE.FOREST ],
		[ TTYPE.FOREST, TTYPE.GRASS, TTYPE.LAKE ],
		[ TTYPE.FOREST, TTYPE.GRASS, TTYPE.FOREST ],
		[ TTYPE.SAND, TTYPE.SAND, TTYPE.SAND ],
	];
	var new_map = instance_create_layer(260, 20, "Map", oMap, {
		tiles : l1_tiles,
		player_start_pos_x : 1,
		player_start_pos_y : 7,
		level_name : "The Fog Horn",
		level_number : 8,
		level_par : 9,
		wind_strength : 0,
		wind_direction : 0
	})
	return new_map;
}

function loadLevel9() {
	var l1_tiles = [
		[ TTYPE.LAKE, TTYPE.FOREST, TTYPE.LAKE ],
		[ TTYPE.LAKE, TTYPE.TOILET, TTYPE.LAKE ],
		[ TTYPE.FOREST, TTYPE.GRASS, TTYPE.FOREST ],
		[ TTYPE.FOREST, TTYPE.GRASS, TTYPE.FOREST ],
		[ TTYPE.FOREST, TTYPE.FOREST, TTYPE.FOREST ],
		[ TTYPE.FOREST, TTYPE.GRASS, TTYPE.FOREST ],
		[ TTYPE.SAND, TTYPE.SAND, TTYPE.SAND ],
		[ TTYPE.SAND, TTYPE.SAND, TTYPE.SAND ],
		[ TTYPE.SAND, TTYPE.GRASS, TTYPE.SAND ],
	];
	var new_map = instance_create_layer(260, 20, "Map", oMap, {
		tiles : l1_tiles,
		player_start_pos_x : 1,
		player_start_pos_y : 8,
		level_name : "Backdoor Breeze",
		level_number : 9,
		level_par : 8,
		wind_strength : 8,
		wind_direction : 235
	})
	return new_map;
}

function loadLevel10() {
	var l1_tiles = [
		[ TTYPE.LAKE, TTYPE.LAKE, TTYPE.LAKE ],
		[ TTYPE.LAKE, TTYPE.TOILET, TTYPE.LAKE ],
		[ TTYPE.LAKE, TTYPE.LAKE, TTYPE.GRASS ],
		[ TTYPE.GRASS, TTYPE.LAKE, TTYPE.LAKE ],
		[ TTYPE.LAKE, TTYPE.GRASS, TTYPE.LAKE ],
		[ TTYPE.LAKE, TTYPE.LAKE, TTYPE.LAKE ],
		[ TTYPE.LAKE, TTYPE.GRASS, TTYPE.LAKE ],
		[ TTYPE.LAKE, TTYPE.LAKE, TTYPE.LAKE ],
		[ TTYPE.GRASS, TTYPE.LAKE, TTYPE.LAKE ],
		[ TTYPE.LAKE, TTYPE.GRASS, TTYPE.LAKE ],
	];
	var new_map = instance_create_layer(260, 20, "Map", oMap, {
		tiles : l1_tiles,
		player_start_pos_x : 1,
		player_start_pos_y : 9,
		level_name : "Insane in the Methane",
		level_number : 10,
		level_par : 10,
		wind_strength : 15,
		wind_direction : 135
	})
	return new_map;
}

function loadRandomLevel(level_num) {
	var l1_tiles = [
		[ getRandomLevelTile(), TTYPE.TOILET, getRandomLevelTile() ],
		[ getRandomLevelTile(), getRandomLevelTile(), getRandomLevelTile() ],
		[ getRandomLevelTile(), getRandomLevelTile(), getRandomLevelTile() ],
		[ getRandomLevelTile(), getRandomLevelTile(), getRandomLevelTile() ],
		[ getRandomLevelTile(), getRandomLevelTile(), getRandomLevelTile() ],
		[ getRandomLevelTile(), getRandomLevelTile(), getRandomLevelTile() ],
		[ getRandomLevelTile(), getRandomLevelTile(), getRandomLevelTile() ],
		[ getRandomLevelTile(), getRandomLevelTile(), getRandomLevelTile() ],
		[ getRandomLevelTile(), getRandomLevelTile(), getRandomLevelTile() ],
		[ getRandomLevelTile(), TTYPE.GRASS, getRandomLevelTile() ],
	];
	var random_title = getRandomLevelTitle();
	var new_map = instance_create_layer(260, 20, "Map", oMap, {
		tiles : l1_tiles,
		player_start_pos_x : 1,
		player_start_pos_y : 9,
		level_name : random_title,
		level_number : level_num,
		level_par : -13337,
		wind_strength : irandom(15),
		wind_direction : irandom(360)
	})
	return new_map;
}

function getRandomLevelTitle() {
	var random_level_tile = irandom(327);
	if(random_level_tile == 0) return "Air bagel";
	if(random_level_tile == 1) return "Air biscuit";
	if(random_level_tile == 2) return "Air tulip";
	if(random_level_tile == 3) return "Airbrush the boxers";
	if(random_level_tile == 4) return "Answering the call of the wild burrito";
	if(random_level_tile == 5) return "Butt-coustics";
	if(random_level_tile == 6) return "Butt flapper";
	if(random_level_tile == 7) return "Back blast";
	if(random_level_tile == 8) return "Back draft";
	if(random_level_tile == 9) return "Back-end blowout";
	if(random_level_tile == 11) return "Backdoor sneeze";
	if(random_level_tile == 12) return "Backfire";
	if(random_level_tile == 13) return "Bafoon";
	if(random_level_tile == 14) return "Bake an air biscuit";
	if(random_level_tile == 15) return "Baking brownies";
	if(random_level_tile == 16) return "Bark";
	if(random_level_tile == 17) return "Barking spider";
	if(random_level_tile == 18) return "Barn burner";
	if(random_level_tile == 19) return "Bean blower";
	if(random_level_tile == 20) return "Beef";
	if(random_level_tile == 21) return "Beefer";
	if(random_level_tile == 22) return "Beep your horn";
	if(random_level_tile == 23) return "Belch from behind";
	if(random_level_tile == 24) return "Belching clown";
	if(random_level_tile == 25) return "Benchwarmer";
	if(random_level_tile == 26) return "Better open a window";
	if(random_level_tile == 27) return "Blast";
	if(random_level_tile == 28) return "Blast the chair";
	if(random_level_tile == 29) return "Blat";
	if(random_level_tile == 30) return "Blow mud";
	if(random_level_tile == 31) return "Blow the big brown horn";
	if(random_level_tile == 32) return "Blue dart";
	if(random_level_tile == 33) return "Blurp";
	if(random_level_tile == 34) return "Blurt";
	if(random_level_tile == 35) return "Bomber";
	if(random_level_tile == 36) return "Boom-boom";
	if(random_level_tile == 37) return "Booty belch";
	if(random_level_tile == 38) return "Booty bomb";
	if(random_level_tile == 39) return "Booty cough";
	if(random_level_tile == 40) return "Bottom blast";
	if(random_level_tile == 41) return "Bottom burp";
	if(random_level_tile == 42) return "Bottom Burp";
	if(random_level_tile == 43) return "Break the sound barrier";
	if(random_level_tile == 45) return "Breath of fresh air";
	if(random_level_tile == 46) return "Breezer";
	if(random_level_tile == 47) return "Bronx Cheer";
	if(random_level_tile == 48) return "Brown cloud";
	if(random_level_tile == 49) return "Brown dart";
	if(random_level_tile == 50) return "Brown haze";
	if(random_level_tile == 51) return "Brown horn brass band";
	if(random_level_tile == 52) return "Brown thunder";
	if(random_level_tile == 53) return "Bubbler";
	if(random_level_tile == 54) return "Bull snort";
	if(random_level_tile == 55) return "Bum Crack";
	if(random_level_tile == 56) return "Bumsen burner";
	if(random_level_tile == 57) return "Bun shaker";
	if(random_level_tile == 58) return "Bung blast";
	if(random_level_tile == 59) return "Burner";
	if(random_level_tile == 60) return "Burner";
	if(random_level_tile == 61) return "Burning rubber";
	if(random_level_tile == 62) return "Burp out the wrong end";
	if(random_level_tile == 63) return "Buster brown";
	if(random_level_tile == 64) return "Butt bazooka";
	if(random_level_tile == 65) return "Butt bleat";
	if(random_level_tile == 66) return "Butt bongos";
	if(random_level_tile == 67) return "Butt burp";
	if(random_level_tile == 68) return "Butt cheek screech";
	if(random_level_tile == 69) return "Butt dumpling";
	if(random_level_tile == 70) return "Butt percussion";
	if(random_level_tile == 71) return "Butt sneeze";
	if(random_level_tile == 72) return "Butt trauma";
	if(random_level_tile == 73) return "Butt trumpet";
	if(random_level_tile == 74) return "Butt tuba";
	if(random_level_tile == 75) return "Butt wind";
	if(random_level_tile == 76) return "Butt yodeling";
	if(random_level_tile == 77) return "Buttock bassoon";
	if(random_level_tile == 78) return "Chair air";
	if(random_level_tile == 79) return "Cheek flapper";
	if(random_level_tile == 80) return "Cheek squeak";
	if(random_level_tile == 81) return "Cheeser";
	if(random_level_tile == 82) return "Cheesin’";
	if(random_level_tile == 83) return "Colon bowlin'";
	if(random_level_tile == 84) return "Colonic Calliope";
	if(random_level_tile == 85) return "Cornhole clap";
	if(random_level_tile == 86) return "Cornhole tremor";
	if(random_level_tile == 87) return "Crack a rat";
	if(random_level_tile == 88) return "Crack concert";
	if(random_level_tile == 89) return "Crack one off";
	if(random_level_tile == 90) return "Crack splitters";
	if(random_level_tile == 91) return "Crap call";
	if(random_level_tile == 92) return "Crop dusting";
	if(random_level_tile == 93) return "Crowd killer";
	if(random_level_tile == 94) return "Cut a stinker";
	if(random_level_tile == 95) return "Cut one";
	if(random_level_tile == 97) return "Death breath";
	if(random_level_tile == 98) return "Deflating";
	if(random_level_tile == 99) return "Doing the one cheek sneak";
	if(random_level_tile == 100) return "Doing the two cheek sneak";
	if(random_level_tile == 101) return "Drifter";
	if(random_level_tile == 102) return "Drifter";
	if(random_level_tile == 103) return "Drop a bomb";
	if(random_level_tile == 104) return "Dropped One’s Lunchbox";
	if(random_level_tile == 105) return "Droppin' stink bombs";
	if(random_level_tile == 106) return "Duck call";
	if(random_level_tile == 107) return "Duck call";
	if(random_level_tile == 108) return "D’Oyley Carte";
	if(random_level_tile == 109) return "Eggy";
	if(random_level_tile == 110) return "Better Than a Bad Tenant";
	if(random_level_tile == 111) return "Emptying the tank";
	if(random_level_tile == 112) return "Exercise the meat nozzle";
	if(random_level_tile == 113) return "Exhume the dinner corpse";
	if(random_level_tile == 114) return "Exploding bottom";
	if(random_level_tile == 115) return "Exterminator";
	if(random_level_tile == 116) return "False pooper";
	if(random_level_tile == 117) return "Fanny beep";
	if(random_level_tile == 118) return "Fanny frog";
	if(random_level_tile == 119) return "Fartick";
	if(random_level_tile == 120) return "Fartkin";
	if(random_level_tile == 121) return "Fecal fume";
	if(random_level_tile == 122) return "Fire a Stink torpedo";
	if(random_level_tile == 123) return "Fire in the hole";
	if(random_level_tile == 124) return "Firing the retro rocket";
	if(random_level_tile == 125) return "Fizzle";
	if(random_level_tile == 126) return "Fizzler";
	if(random_level_tile == 127) return "Flame thrower";
	if(random_level_tile == 128) return "Flamer";
	if(random_level_tile == 129) return "Flapper";
	if(random_level_tile == 130) return "Flatulate";
	if(random_level_tile == 131) return "Flatulence";
	if(random_level_tile == 132) return "Flatus";
	if(random_level_tile == 133) return "Flipper";
	if(random_level_tile == 134) return "Float an air biscuit";
	if(random_level_tile == 135) return "Floater";
	if(random_level_tile == 136) return "Floof";
	if(random_level_tile == 137) return "Fluffer";
	if(random_level_tile == 138) return "Fluffy";
	if(random_level_tile == 140) return "Fog slicer";
	if(random_level_tile == 141) return "Fogger";
	if(random_level_tile == 142) return "Foist";
	if(random_level_tile == 143) return "Fowl howl";
	if(random_level_tile == 144) return "Fragrant foof";
	if(random_level_tile == 145) return "Free jacuzzi";
	if(random_level_tile == 146) return "Free speech";
	if(random_level_tile == 147) return "Freep";
	if(random_level_tile == 148) return "Frump";
	if(random_level_tile == 149) return "Fumigating";
	if(random_level_tile == 150) return "Funky roller";
	if(random_level_tile == 151) return "Gas";
	if(random_level_tile == 152) return "Gas attack";
	if(random_level_tile == 154) return "Gas master";
	if(random_level_tile == 155) return "Get out and walk Donald";
	if(random_level_tile == 156) return "Ghost turd";
	if(random_level_tile == 157) return "Gluteal maximus gas a mess";
	if(random_level_tile == 158) return "Gluteal tuba";
	if(random_level_tile == 159) return "Great brown cloud";
	if(random_level_tile == 160) return "Grundle rumble";
	if(random_level_tile == 161) return "Grunt";
	if(random_level_tile == 162) return "Gurgler";
	if(random_level_tile == 163) return "Hart and Dart";
	if(random_level_tile == 164) return "Heinie hiccup";
	if(random_level_tile == 165) return "Heinous Anus";
	if(random_level_tile == 166) return "Hisser";
	if(random_level_tile == 167) return "Hole flapper";
	if(random_level_tile == 168) return "Honk";
	if(random_level_tile == 169) return "Honker";
	if(random_level_tile == 170) return "Horse and Cart";
	if(random_level_tile == 171) return "Horton hears a poo";
	if(random_level_tile == 172) return "Hot wind";
	if(random_level_tile == 173) return "Hot wind";
	if(random_level_tile == 174) return "Hottie";
	if(random_level_tile == 175) return "Human hydrogen Bomb";
	if(random_level_tile == 176) return "Humrrhoids";
	if(random_level_tile == 177) return "Ignition";
	if(random_level_tile == 178) return "Inverted burb";
	if(random_level_tile == 179) return "Jet power";
	if(random_level_tile == 180) return "Jet propulsion";
	if(random_level_tile == 181) return "Jockey burner";
	if(random_level_tile == 182) return "Just calling your name";
	if(random_level_tile == 183) return "Just keeping warm";
	if(random_level_tile == 184) return "Kaboomer";
	if(random_level_tile == 185) return "Killing the canary";
	if(random_level_tile == 186) return "Lay an egg";
	if(random_level_tile == 188) return "Let each bean be heard";
	if(random_level_tile == 189) return "Let one fly";
	if(random_level_tile == 190) return "Let one go";
	if(random_level_tile == 191) return "Let one rip";
	if(random_level_tile == 192) return "Let Polly out of jail";
	if(random_level_tile == 193) return "Let the beans out";
	if(random_level_tile == 194) return "Lethal cloud";
	if(random_level_tile == 195) return "Make a stink";
	if(random_level_tile == 196) return "Mating call";
	if(random_level_tile == 197) return "Methane bomb";
	if(random_level_tile == 198) return "Methane dart";
	if(random_level_tile == 199) return "Methane mating call";
	if(random_level_tile == 200) return "Methane pain";
	if(random_level_tile == 201) return "Mexican jet propulsion";
	if(random_level_tile == 202) return "Moon gas";
	if(random_level_tile == 203) return "Mouse on a motorcycle";
	if(random_level_tile == 204) return "Mud duck";
	if(random_level_tile == 205) return "Nasty cough";
	if(random_level_tile == 206) return "Nose death";
	if(random_level_tile == 207) return "O-ring oboe";
	if(random_level_tile == 208) return "Odor bubble";
	if(random_level_tile == 209) return "Odorama";
	if(random_level_tile == 210) return "One-Cheek Squeak";
	if(random_level_tile == 211) return "One-gun salute";
	if(random_level_tile == 212) return "One-man salute";
	if(random_level_tile == 213) return "Opened One’s Lunchbox";
	if(random_level_tile == 214) return "Orange Banana";
	if(random_level_tile == 215) return "Orchestra practice";
	if(random_level_tile == 216) return "Paint peeler";
	if(random_level_tile == 217) return "Paint stainer";
	if(random_level_tile == 218) return "Painting the elevator";
	if(random_level_tile == 219) return "Panty burp";
	if(random_level_tile == 220) return "Parp";
	if(random_level_tile == 221) return "Parper";
	if(random_level_tile == 222) return "Party in your pants";
	if(random_level_tile == 223) return "Pass gas";
	if(random_level_tile == 224) return "Pass wind";
	if(random_level_tile == 225) return "Peter";
	if(random_level_tile == 226) return "Pewie";
	if(random_level_tile == 227) return "Pip";
	if(random_level_tile == 228) return "Playing the trouser tuba";
	if(random_level_tile == 229) return "Playing the tuba";
	if(random_level_tile == 230) return "Poof";
	if(random_level_tile == 231) return "Poof-poof";
	if(random_level_tile == 232) return "Poop gas";
	if(random_level_tile == 233) return "Poop gopher";
	if(random_level_tile == 234) return "Poot";
	if(random_level_tile == 235) return "Pootza";
	if(random_level_tile == 236) return "Pop";
	if(random_level_tile == 237) return "Pop a fluffy";
	if(random_level_tile == 238) return "Pop tart";
	if(random_level_tile == 239) return "Power puff";
	if(random_level_tile == 240) return "Prat Whids";
	if(random_level_tile == 241) return "Puff the Magic Dragon";
	if(random_level_tile == 242) return "Puffer";
	if(random_level_tile == 243) return "Putt-putt";
	if(random_level_tile == 244) return "Quack";
	if(random_level_tile == 245) return "Quaker";
	if(random_level_tile == 246) return "Roar from the rear";
	if(random_level_tile == 247) return "Raspberry";
	if(random_level_tile == 249) return "Rattler";
	if(random_level_tile == 250) return "Rebuilding the ozone layer";
	if(random_level_tile == 251) return "Rectal honk";
	if(random_level_tile == 252) return "Rectal shout";
	if(random_level_tile == 253) return "Rectal tremor";
	if(random_level_tile == 254) return "Rectal turbulence";
	if(random_level_tile == 255) return "Release a squeaker";
	if(random_level_tile == 256) return "Release the hounds";
	if(random_level_tile == 257) return "Rim Slide";
	if(random_level_tile == 258) return "Ringbark";
	if(random_level_tile == 259) return "Rip one";
	if(random_level_tile == 261) return "Ripped the cheese";
	if(random_level_tile == 262) return "Ripper";
	if(random_level_tile == 263) return "Ripple";
	if(random_level_tile == 264) return "Roar from the rear";
	if(random_level_tile == 265) return "Roast the jockeys";
	if(random_level_tile == 266) return "Room clearer";
	if(random_level_tile == 267) return "Rouser";
	if(random_level_tile == 268) return "Rump ripper";
	if(random_level_tile == 269) return "Rump roar";
	if(random_level_tile == 270) return "Saluting my shorts";
	if(random_level_tile == 271) return "Scud missle";
	if(random_level_tile == 272) return "Shoot a Bunny";
	if(random_level_tile == 273) return "Shoot the cannon";
	if(random_level_tile == 274) return "Silent and scentless";
	if(random_level_tile == 275) return "Silent but deadly";
	if(random_level_tile == 276) return "Silly cyanide";
	if(random_level_tile == 277) return "Silly cyanide";
	if(random_level_tile == 278) return "Singe the pants/chair/etc";
	if(random_level_tile == 279) return "Skunk bait";
	if(random_level_tile == 280) return "Slider";
	if(random_level_tile == 281) return "Sphincter siren";
	if(random_level_tile == 282) return "Sphincter song";
	if(random_level_tile == 283) return "Sphincter whistle";
	if(random_level_tile == 284) return "Spitter";
	if(random_level_tile == 285) return "Split the seam";
	if(random_level_tile == 286) return "Squeak one out";
	if(random_level_tile == 287) return "Squeaker";
	if(random_level_tile == 288) return "Squeeze Cheese";
	if(random_level_tile == 289) return "Stale wind";
	if(random_level_tile == 290) return "Steam-press your pants";
	if(random_level_tile == 291) return "Steamer";
	if(random_level_tile == 292) return "Step on a duck";
	if(random_level_tile == 293) return "Step on a frog";
	if(random_level_tile == 294) return "Stink bomb";
	if(random_level_tile == 295) return "Stink burger";
	if(random_level_tile == 296) return "Stink it up";
	if(random_level_tile == 297) return "Stinker";
	if(random_level_tile == 298) return "Stinkmeaner";
	if(random_level_tile == 299) return "Stinky";
	if(random_level_tile == 300) return "Tail Scutter";
	if(random_level_tile == 301) return "Tail wind";
	if(random_level_tile == 302) return "The Levi wind tunnel";
	if(random_level_tile == 303) return "Thunder from down under";
	if(random_level_tile == 304) return "Thurp";
	if(random_level_tile == 305) return "Toilet tune";
	if(random_level_tile == 306) return "Toot";
	if(random_level_tile == 307) return "Toot your own horn";
	if(random_level_tile == 308) return "Tootsie";
	if(random_level_tile == 309) return "Trouser cough";
	if(random_level_tile == 310) return "Trouser trumpet";
	if(random_level_tile == 311) return "Trump";
	if(random_level_tile == 312) return "Trunk bunk";
	if(random_level_tile == 313) return "Turd tremors";
	if(random_level_tile == 314) return "Turtle burp";
	if(random_level_tile == 315) return "Tushy tickler";
	if(random_level_tile == 316) return "Uncorked one";
	if(random_level_tile == 317) return "Uncorking";
	if(random_level_tile == 318) return "Under burp";
	if(random_level_tile == 319) return "Under thunder";
	if(random_level_tile == 320) return "Vent one";
	if(random_level_tile == 321) return "Venting";
	if(random_level_tile == 322) return "Wallop";
	if(random_level_tile == 323) return "Whiff";
	if(random_level_tile == 324) return "Whoopee";
	if(random_level_tile == 325) return "Whopper";
	if(random_level_tile == 326) return "Wind the Horn";
	if(random_level_tile == 327) return "Zinger";
	return "It's about farting";
}

function getRandomLevelTile() {
	var random_tile = random(1);
	if(random_tile < 0.1) return TTYPE.LAKE;
	else if(random_tile < 0.2) return TTYPE.SAND;
	else if(random_tile < 0.6) return TTYPE.FOREST;
	else return TTYPE.GRASS;
}
