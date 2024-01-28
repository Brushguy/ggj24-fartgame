draw_sprite_ext(s3DDisplay, 0, 5, 20+quake_y, 1.0, 1.0, 0, c_white, 1.0);
drawRandomClouds();
draw_sprite_ext(current_ground_texture, 0, reverse_grass ? 245 : 5, 20+quake_y, reverse_grass ? -1.0 : 1.0, 1.0, 0, c_white, 1.0);
drawRandomTrees(false);
if(global.CURRENT_STATE == GAME_STATE.BEAT_LEVEL) {
	draw_sprite_ext(sToilet, 0, 125, 100, 1.0, 1.0, 0, c_white, 1.0);
} else if(global.CURRENT_STATE != GAME_STATE.DIED) {
	draw_sprite_ext(sMan, 0, man_x, fart_fly_y, fart_fly_scale, fart_fly_scale, 0, c_white, 1.0);
}
drawRandomTrees(true);