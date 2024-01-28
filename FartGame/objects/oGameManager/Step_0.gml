if(room == Room1) {
	if(global.CURRENT_STATE == GAME_STATE.WET_TO_DRY) {
		wet_to_dry_pos = (wet_to_dry_pos+global.CURRENT_MAP.wet_dry_speed)%360;
		wet_to_dry_accuracy = sin(degtorad(wet_to_dry_pos));
	} else if(global.CURRENT_STATE == GAME_STATE.POWER) {
		fart_power_pos = (fart_power_pos+global.CURRENT_MAP.fart_power_speed)%360;
		fart_power = 50 + 50*sin(degtorad(fart_power_pos));
	}

	if(status_text_char_pos < string_length(status_text)) {
		status_text_char_pos++;
		status_text_substr = string_copy(status_text, 0, status_text_char_pos);
	}
} else {
	if(display_start_text_counter > 0) {
		display_start_text_counter--;
	} else {
		display_start_text = !display_start_text;
		display_start_text_counter = 30;
	}
	
	if(keyboard_check_pressed(vk_space)) {
		audio_stop_all();
		 audio_play_sound(sndFart28, 0, false);
		wait_to_start_game = true;
	}
	
	if(wait_to_start_game && !audio_is_playing(sndFart28)) {
		room_goto(Room1);
	}
}

if(keyboard_check_pressed(vk_escape)) {
	game_end();
}