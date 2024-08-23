/// @description 

//Movement after ball thrown
if(global.pass_thrown and not global.hit_ground){
	path_end()
	if(global.offense_caught){ // Have defensive players run to where runner is going instead of to current position
		x = x + ((global.offensive_player_caught.x - x) * player_speed / point_distance(x, y, global.offensive_player_caught.x, global.offensive_player_caught.y))
		y = y + ((global.offensive_player_caught.y - y) * player_speed / point_distance(x, y, global.offensive_player_caught.x, global.offensive_player_caught.y))
		//Tackling
		if(place_meeting(x, y, global.offensive_player_caught)){
			global.offensive_player_caught.tackled = true
		}
	}
	else{
		if(point_distance(x, y, global.pass_target_x, global.pass_target_y) > player_speed){
			x = x + ((global.pass_target_x - x) * player_speed / point_distance(x, y, global.pass_target_x, global.pass_target_y))
			y = y + ((global.pass_target_y - y) * player_speed / point_distance(x, y, global.pass_target_x, global.pass_target_y))
		}
	}
}