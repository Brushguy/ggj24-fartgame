enum TTYPE {
	GRASS,
	SAND,
	FOREST,
	LAKE,
	TOILET
}

enum GAME_STATE {
	AIMING,
	WET_TO_DRY,
	POWER,
	WAITING_TO_LAND,
	BEAT_LEVEL,
	DIED
}

global.LEVEL_POINTER = 1;
global.CURRENT_MAP = noone;
global.CURRENT_STATE = GAME_STATE.AIMING;
global.CURRENT_PAR = 0;

random_set_seed(1337);


//fartPartSystem
_ps = part_system_create();
part_system_draw_order(_ps, true);

//sFartEmitter
_ptype1 = part_type_create();
part_type_sprite(_ptype1, sFartCloud, false, true, false)
part_type_size(_ptype1, 0.5, 1.0, 0, 0.5);
part_type_scale(_ptype1, 0.5, 0.75);
part_type_speed(_ptype1, 3, 3, 0, 0);
part_type_direction(_ptype1, 265, 275, 0, 0);
part_type_gravity(_ptype1, 0, 272);
part_type_orientation(_ptype1, 4, 344, 0, 0, false);
part_type_colour3(_ptype1, $FFFFFF, $FFFFFF, $FFFFFF);
part_type_alpha3(_ptype1, 1, 0.502, 0);
part_type_blend(_ptype1, false);
part_type_life(_ptype1, 30, 60);