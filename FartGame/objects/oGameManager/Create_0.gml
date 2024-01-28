wet_to_dry_pos = 0;
wet_to_dry_accuracy = 0;
fart_power_pos = 0;
fart_power = 0;
status_text = "";
status_text_substr = "";
status_text_char_pos = 0;

display_start_text_counter = 30;
display_start_text = true;
wait_to_start_game = false;

function startFarticleEmitter() {
	var threeddisplay = instance_find(o3DDisplay, 0);
	_pemit1 = part_emitter_create(_ps);
	part_emitter_region(_ps, _pemit1, -16, 16, -16, 16, ps_shape_rectangle, ps_distr_linear);
	part_emitter_stream(_ps, _pemit1, _ptype1, 1);
	part_system_position(_ps, threeddisplay.man_x, room_height/2);
}

function stopFarticleEmitter() {
	part_emitter_destroy(_ps, _pemit1);
}