vanishing_point_y = 40;
trees = [];
clouds = [];
reverse_grass = true;
current_ground_texture = s3DGrass;

man_x = 125;
fart_fly_y = 110;
fart_fly_scale = 1.0;

quake_y = 0;

function calcRandomClouds(amount) {
	clouds = [];
	with(oCloud) {
		instance_destroy();
	}
	
	var wind_as_x = global.CURRENT_MAP.wind_strength / 10;
	if(global.CURRENT_MAP.wind_direction > 90 && global.CURRENT_MAP.wind_strength < 270) {
		wind_as_x *= -1;
	}
	
	for(var i = 0; i < amount; i++) {
		var rand_y = y + 5 - irandom(10);
		var rand_scale = 0.1 + 0.2*(rand_y/30);
		var cloud = instance_create_layer(10+irandom(240), rand_y, "Instances", oCloud, {
			x_speed : wind_as_x * rand_scale,
			image_xscale : rand_scale,
			image_yscale : rand_scale
		});
		array_insert(clouds, 0, cloud);
	}
	array_sort(clouds, function(elem1, elem2) {
		return elem1.y - elem2.y;
	});
}

function calcRandomTrees(amount, center, left, right, max_y) {
	trees = [];
	for(var i = 0; i < amount; i++) {
		var rand_x = irandom(240);
		if(left && !center && !right) {
			rand_x = irandom(80);
		} else if(left && center && !right) {
			rand_x = irandom(160);
		} else if(!left && center && !right) {
			rand_x = 80 + irandom(80);
		} else if(!left && !center && right) {
			rand_x = 160 + irandom(80);
		} else if(left && !center && right) {
			var left_side_possibility = random(1);
			if(left_side_possibility) {
				rand_x = irandom(80);
			} else {
				rand_x = 160 + irandom(80);
			}
		}
		
		var rand_y = irandom(max_y);
		var rand_scale = 0.2 + 1.75*(rand_y/60);
		array_insert(trees, 0, [rand_x, rand_y, rand_scale]);
	}
	array_sort(trees, function(elem1, elem2) {
		return elem1[1] - elem2[1];
	});
}

function drawRandomClouds() {
	for(var i = 0; i < array_length(clouds); i++) {
		var cloud = clouds[i];
		draw_sprite_ext(sCloud, 0, cloud.x, cloud.y+quake_y, cloud.image_xscale, cloud.image_yscale, 0, c_white, 1.0);
	}
}

function drawRandomTrees(foreground) {
	for(var i = 0; i < array_length(trees); i++) {
		var rand_x = trees[i][0];
		var rand_y = trees[i][1];
		var rand_scale = trees[i][2];
		if((rand_y < 30 && !foreground) || (rand_y >= 30 && foreground)) {
			draw_sprite_ext(s3DTree, 0, x+rand_x, y+vanishing_point_y+rand_y+quake_y, rand_scale, rand_scale, 0, c_white, 1.0);
		}
	}
}