function evaluatePosition() {
	var map = instance_find(oMap, 0);
	var player = instance_find(oPlayerMapDot, 0);
	var threeddisplay = instance_find(o3DDisplay, 0);
	
	var forest_proximity = 0;
	var sand_proximity = 0;
	var lake_proximity = 0;
	var toilet_proximity = 0;
	
	for(var i = 0; i < array_length(map.tiles); i++) {
		for(var j = 0; j < array_length(map.tiles[i]); j++) {
			var tile = map.tiles[i][j];
			var coords = getTileCoords(map, i, j);
			var distance = sqrt(power(player.y-coords[1], 2) + power(player.x-coords[0], 2));
			if(distance != 0) distance = 1 / distance;
			
			if(tile == TTYPE.FOREST) {
				forest_proximity += distance;
			} else if(tile == TTYPE.LAKE) {
				lake_proximity += distance;
			} else if(tile == TTYPE.SAND) {
				sand_proximity += distance;
			} else if(tile == TTYPE.TOILET) {
				toilet_proximity += distance;
			}
		}
	}
	
	var on_tile_coords = playerOnTile(player, map);
	var on_tile = getTile(map, on_tile_coords[0], on_tile_coords[1]);
	
	var up_tile = getTile(map, on_tile_coords[0], on_tile_coords[1]-1);
	var left_tile = getTile(map, on_tile_coords[0]-1, on_tile_coords[1]);
	var right_tile = getTile(map, on_tile_coords[0]+1, on_tile_coords[1]);
	
	var new_text = "";
	if(on_tile == TTYPE.GRASS) {
		threeddisplay.current_ground_texture = s3DGrass;
		player.handicap = 0;
		new_text = randomGrassText();
		show_debug_message("forest_proximity " + string(forest_proximity));
		show_debug_message("lake_proximity " + string(lake_proximity));
		show_debug_message("sand_proximity " + string(sand_proximity));
		show_debug_message("toilet_proximity " + string(toilet_proximity));
		if(toilet_proximity > 0.05) new_text = randomNearToiletText();
		else if(forest_proximity > 0.2) new_text = randomNearTreeText();
	} else if(on_tile == TTYPE.SAND) {
		new_text = randomSandText();
		player.handicap = 25;
		threeddisplay.current_ground_texture = s3DSand;
	} else if(on_tile == TTYPE.LAKE) {
		new_text = randomWaterText();
		audio_play_sound(sndDie, 0, false);
		player.handicap = 0;
		threeddisplay.current_ground_texture = s3DWater;
	} else if(on_tile == TTYPE.FOREST) {
		new_text = randomTreeText();
		player.handicap = 50;
		threeddisplay.current_ground_texture = s3DGrass;
	} else if(on_tile == TTYPE.TOILET) {
		new_text = randomWinText();
		audio_play_sound(sndWin, 0, false);
		player.handicap = 0;
		threeddisplay.current_ground_texture = s3DGrass;
	}
	with(oGameManager) {
		status_text = new_text;
		status_text_char_pos = 0;
	}
	with(o3DDisplay) {
		var max_y = 0;
		var tree_amount = 0;
		var center_trees = up_tile == TTYPE.FOREST;
		var left_trees = left_tile == TTYPE.FOREST;
		var right_trees = right_tile == TTYPE.FOREST;
		if(on_tile == TTYPE.FOREST) {
			tree_amount = forest_proximity*100;
			max_y = min(60, 10+forest_proximity*100);
			center_trees = true;
			left_trees = true;
			right_trees = true;
		} else if(on_tile == TTYPE.GRASS) {
			tree_amount = forest_proximity*25;
			max_y = min(60, 10+forest_proximity*25);
		} else if(on_tile == TTYPE.SAND) {
			max_y = 10;
			center_trees = false;
			left_trees = false;
			right_trees = false;
		}
		
		calcRandomTrees(tree_amount, center_trees, left_trees, right_trees, max_y);
		calcRandomClouds(irandom(10));
	}
	
	threeddisplay.man_x = 125;
	
	if(on_tile == TTYPE.TOILET) {
		global.CURRENT_STATE = GAME_STATE.BEAT_LEVEL;
		global.LEVEL_POINTER ++;
	} else if(on_tile == TTYPE.LAKE) {
		global.CURRENT_STATE = GAME_STATE.DIED;
	} else {
		global.CURRENT_STATE = GAME_STATE.AIMING;
	}
}

function getTileCoords(map, i, j) {
	return [map.x + 8 + (j*16), map.y + 8 + (i*16)];
}

function playerOnTile(player, map) {
	for(var i = 0; i < array_length(map.tiles); i++) {
		for(var j = 0; j < array_length(map.tiles[i]); j++) {
			var tile = map.tiles[i][j];
			if(player.x >= map.x + j*16 && player.x < map.x + (j+1)*16 &&
			   player.y >= map.y + i*16 && player.y < map.y + (i+1)*16) {
				   return [j, i];
			   }
		}
	}
	return [0,0];
}

function getTile(map, coord_x, coord_y) {
	if(coord_x >= 0 && coord_x < 3 &&
	   coord_y >= 0 && coord_y < array_length(map.tiles)) {
		return map.tiles[coord_y][coord_x];
	}
	return TTYPE.GRASS;
}