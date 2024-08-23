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
		global.hit_ground = true
	}
}
else{
	x = obj_player_quarterback.x + x_offset
	y = obj_player_quarterback.y + y_offset
	image_angle = angle
}