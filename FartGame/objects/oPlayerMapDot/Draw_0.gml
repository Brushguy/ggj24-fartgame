draw_self();
draw_set_color(c_black);
if(global.CURRENT_STATE == GAME_STATE.AIMING) {
	draw_line(x,y,end_x,end_y);
}