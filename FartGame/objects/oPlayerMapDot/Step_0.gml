var game_manager = instance_find(oGameManager, 0);
var map = instance_find(oMap, 0);

if(global.CURRENT_STATE == GAME_STATE.AIMING) {
	if(keyboard_check(vk_left) && aim_angle < max_angle) {
		aim_angle++;
	} else if(keyboard_check(vk_right) && aim_angle > min_angle) {
		aim_angle--;
	}
	end_x = x + cos(degtorad(aim_angle))*aim_preview_length;
	end_y = y - sin(degtorad(aim_angle))*aim_preview_length;
	
	if(keyboard_check_pressed(vk_space)) {
		game_manager.wet_to_dry_pos = 0;;
		audio_play_sound(sndMenuSelect, 0, false);
		global.CURRENT_STATE = GAME_STATE.WET_TO_DRY;
	}
} else if(global.CURRENT_STATE == GAME_STATE.WET_TO_DRY) {
	if(keyboard_check_pressed(vk_space)) {
		game_manager.fart_power = 0;
		audio_play_sound(sndMenuSelect2, 0, false);
		global.CURRENT_STATE = GAME_STATE.POWER;
	}
} else if(global.CURRENT_STATE == GAME_STATE.POWER) {
	if(keyboard_check_pressed(vk_space)) {
		with(game_manager) {
			startFarticleEmitter();
		}
		var fart_sound = playRandomFart();
		if(fart_sound == sndFart43) {
			turn_time_max = 360;
			turn_time = turn_time_max;
		}
		if(game_manager.fart_power >= 99) {
			final_power = game_manager.fart_power;
		} else {
			final_power = max(0, max(30, game_manager.fart_power) - handicap);
		}
		final_angle = aim_angle + 45*random(game_manager.wet_to_dry_accuracy);
		global.CURRENT_STATE = GAME_STATE.WAITING_TO_LAND;
	}
} else if(global.CURRENT_STATE == GAME_STATE.WAITING_TO_LAND) {
	if(final_power > 0 || turn_time > 0) {
		turn_time--;
		final_power = max(0, final_power-1);
		x = x + (final_power*map_scale*cos(degtorad(final_angle))) + (global.CURRENT_MAP.wind_strength*wind_scale*cos(degtorad(global.CURRENT_MAP.wind_direction)));
		y = y - (final_power*map_scale*sin(degtorad(final_angle))) - (global.CURRENT_MAP.wind_strength*wind_scale*sin(degtorad(global.CURRENT_MAP.wind_direction)));
		
		var map_bounds_x = map.x;
		var map_bounds_y = map.y;
		var map_height = array_length(map.tiles)*16;
		if(x < map_bounds_x) {
			x = map_bounds_x;
		} else if(x > map_bounds_x+48) {
			x = map_bounds_x+48;
		}
		if(y < map_bounds_y) {
			y = map_bounds_y;
		} else if(y > map_bounds_y+map_height) {
			y = map_bounds_y+map_height;
		}
	} else {
		turn_time_max = 60;
		turn_time = turn_time_max;
		global.CURRENT_PAR--;
		evaluatePosition();
		with(game_manager) {
			stopFarticleEmitter();
		}
		with(o3DDisplay) {
			reverse_grass = !reverse_grass;
		}
	}
} else if(global.CURRENT_STATE == GAME_STATE.BEAT_LEVEL || global.CURRENT_STATE == GAME_STATE.DIED) {
	if(keyboard_check_pressed(vk_space)) {
		audio_stop_all();
		loadLevel();
		global.CURRENT_STATE = GAME_STATE.AIMING;
	}
} 