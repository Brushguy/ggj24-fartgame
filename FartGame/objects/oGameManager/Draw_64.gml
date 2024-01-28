draw_set_color(c_black);
draw_rectangle(0, 0, 320, 19, false);
draw_rectangle(0, 0, 5, 180, false);
draw_rectangle(0, 120, 240, 180, false);
draw_rectangle(240, 0, 260, 180, false);

draw_set_font(fArcadeFont);
draw_set_color(c_white);
if(room == Room1) {
	draw_set_halign(fa_left);
	draw_text(5, 5, "FART GAME");

	if(global.CURRENT_MAP != noone) {
		draw_text(5, 125, status_text_substr);
	}
	if(global.CURRENT_PAR > -13337) {
		draw_text(5, 135, "PAR(P):" + string(global.CURRENT_PAR));
	}
	draw_text(100, 135, "WIND:" + global.CURRENT_WIND);

	draw_set_halign(fa_center);
	if(global.CURRENT_STATE == GAME_STATE.AIMING) {
		draw_text(160, 160, "ARROW KEYS = AIM");
	} else if(global.CURRENT_STATE == GAME_STATE.WET_TO_DRY) {
		draw_sprite(sWetDryMeter, 0, 160, 155);
		draw_sprite(sWetDryPointer, 0, 160 + 50*wet_to_dry_accuracy, 155);
		draw_text(90, 152, "WET");
		draw_text(230, 152, "DRY");
	} else if(global.CURRENT_STATE == GAME_STATE.POWER) {
		draw_text(70, 152, "POWER");
		draw_set_color(fart_power >= 100 ? c_white : c_green);
		draw_rectangle(100, 147, 99+(1.5*fart_power), 160, false);
		draw_sprite(sPowerOutline, 0, 100, 147);
		draw_set_color(c_white);
	}
	draw_text(160, 170, "SPACE = CHOOSE");
} else {
	draw_sprite(sTitleScreen, 0, 160, 60);
	draw_set_halign(fa_center);
	draw_text(160, 165, "1984 (C) Megalithic Mainframe");
	if(display_start_text) {
		draw_text(160, 140, "Press Space");
	}
}