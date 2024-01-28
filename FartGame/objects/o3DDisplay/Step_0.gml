var player = instance_find(oPlayerMapDot, 0);
var threeddisplay = instance_find(o3DDisplay, 0);
if(global.CURRENT_STATE == GAME_STATE.WAITING_TO_LAND) {
	var curve_pos_x = 1 - (player.turn_time/player.turn_time_max);
	var curve = animcurve_get(fartCurve1);
	var curve_channel = animcurve_get_channel(curve, "y");
	var curve_y = animcurve_channel_evaluate(curve_channel, curve_pos_x);
	
	fart_fly_y = 110 - 100*curve_y;
	fart_fly_scale = 1.0 - 1.0*curve_y;
	
	with(oGameManager) {
		part_emitter_stream(_ps, _pemit1, _ptype1, round(2.0 - 2.0*curve_y));
		part_system_position(_ps, threeddisplay.man_x, other.fart_fly_y);
	}
} else {
	fart_fly_y = 110;
	fart_fly_scale = 1.0;
	
	man_x = 125 - 100*sin(degtorad(player.aim_angle-90));
}

if(fart_fly_y < 110) {
	var quake_intensity = round(3) * (fart_fly_y/110);
	quake_y = (quake_intensity*-1) + irandom(quake_intensity*2);
}