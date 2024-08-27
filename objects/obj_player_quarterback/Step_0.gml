/// @description Step

if(keyboard_check_pressed(vk_space)){
	global.play_start = true
}
if(global.play_start and not global.pass_thrown){
	if(device_mouse_check_button_pressed(0, mb_left)){
		global.pass_thrown = true
		global.pass_target_x = mouse_x
		global.pass_target_y = mouse_y
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