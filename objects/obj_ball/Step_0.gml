/// Step

if(global.pass_thrown){
	if(not global.pass_caught and not global.hit_ground){
		if(x >= global.pass_target_x){
			image_angle = radtodeg(arcsin((global.pass_target_y - y)/point_distance(x, y, global.pass_target_x, global.pass_target_y)))
		}
		else{
			image_angle = -radtodeg(arcsin((global.pass_target_y - y)/point_distance(x, y, global.pass_target_x, global.pass_target_y)))
		}
		x = x + ((global.pass_target_x - x) * global.throw_speed / point_distance(x, y, global.pass_target_x, global.pass_target_y))
		y = y + ((global.pass_target_y - y) * global.throw_speed / point_distance(x, y, global.pass_target_x, global.pass_target_y))
	}
	if(point_distance(x, y, global.pass_target_x, global.pass_target_y) < global.throw_speed){
		if(place_meeting(x, y, obj_player_offense) and place_meeting(x, y, obj_player_defense)){
			global.hit_ground = true
		}
		else{
			if(place_meeting(x, y, obj_player_offense)){
				global.offense_caught = true
				global.pass_caught = true
				global.offensive_player_caught = instance_place(x, y, obj_player_offense)
				global.offensive_player_caught.ball_caught = true
			}
			if(place_meeting(x, y, obj_player_defense)){
				global.defense_caught = true
				global.pass_caught = true
				global.defensive_player_caught = instance_place(x, y, obj_player_defense)
			}
			if(not place_meeting(x, y, obj_player_offense) and not place_meeting(x, y, obj_player_defense)){
				global.hit_ground = true
			}
		}
	}
}
else{
	x = obj_player_quarterback.x + x_offset
	y = obj_player_quarterback.y + y_offset
	image_angle = angle
}

if(global.offense_caught){
	if(not global.offensive_player_caught.tackled and not global.touchdown){
		x = global.offensive_player_caught.x + x_offset
		y = global.offensive_player_caught.y + y_offset
		image_angle = angle
	}
}

if(global.defense_caught){
	if(not global.defensive_player_caught.tackled){
		x = global.defensive_player_caught.x + x_offset
		y = global.defensive_player_caught.y + y_offset
		image_angle = angle
	}
}

if(y < endzone_pixels){
	global.touchdown = true
}