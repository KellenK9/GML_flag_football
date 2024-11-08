/// @description 

if(global.play_start and player_not_started_path){
	path_start(player_path, player_path_speed_multiplier, path_action_stop, false)
	player_not_started_path = false
}
if(global.pass_thrown){
	path_end()
	if(not global.hit_ground and not global.pass_caught){
		if(point_distance(x, y, global.pass_target_x, global.pass_target_y) > player_speed){
			x = x + ((global.pass_target_x - x) * player_speed / point_distance(x, y, global.pass_target_x, global.pass_target_y))
			y = y + ((global.pass_target_y - y) * player_speed / point_distance(x, y, global.pass_target_x, global.pass_target_y))
		}
	}
}
if(global.offense_caught and not tackled and not global.touchdown){
	if(ball_caught){
		y = y - player_speed
	}
}
if(global.defense_caught){
	if(not global.defensive_player_caught.tackled and not global.touchdown_defense){
		x = x + ((obj_ball.x - x) * player_speed / point_distance(x, y, obj_ball.x, obj_ball.y))
		y = y + ((obj_ball.y - y) * player_speed / point_distance(x, y, obj_ball.x, obj_ball.y))
		if(place_meeting(x, y, global.defensive_player_caught)){
			global.defensive_player_caught.tackled = true
		}
	}
}

if(keyboard_check(vk_shift) and not global.pass_thrown){
	display_route = true
}
else{
	display_route = false
}