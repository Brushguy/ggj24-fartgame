for(var i = 0; i < array_length(tiles); i++) {
	for(var j = 0; j < array_length(tiles[i]); j++) {
		var tile = tiles[i][j];
		var sprite_to_draw = sGrassTile;
		if(tile == TTYPE.FOREST) sprite_to_draw = sForestTile;
		if(tile == TTYPE.LAKE) sprite_to_draw = sWaterTile;
		if(tile == TTYPE.SAND) sprite_to_draw = sSandTile;
		if(tile == TTYPE.TOILET) sprite_to_draw = sToiletTile;
		
		draw_sprite(sprite_to_draw, 0, x+16*j, y+16*i);
	}
}