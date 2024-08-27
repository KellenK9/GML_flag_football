/// @description 

//Movement after ball thrown
if(global.pass_thrown and not global.hit_ground){
	path_end()
	if(global.offense_caught){ // Have defensive players run to where runner is going instead of to current position
		if(not global.offensive_player_caught.tackled and not global.touchdown){
			x = x + ((global.offensive_player_caught.x - x) * player_speed / point_distance(x, y, global.offensive_player_caught.x, global.offensive_player_caught.y))
			y = y + ((global.offensive_player_caught.y - y) * player_speed / point_distance(x, y, global.offensive_player_caught.x, global.offensive_player_caught.y))
		}
		//Tackling
		if(place_meeting(x, y, global.offensive_player_caught)){
			global.offensive_player_caught.tackled = true
		}
	}
	else{
		if(global.defense_caught){
			if(not global.defensive_player_caught.tackled and not global.touchdown_defense){
				y = y + player_speed
			}
		}
		else{
			if(point_distance(x, y, global.pass_target_x, global.pass_target_y) > player_speed){
				x = x + ((global.pass_target_x - x) * player_speed / point_distance(x, y, global.pass_target_x, global.pass_target_y))
				y = y + ((global.pass_target_y - y) * player_speed / point_distance(x, y, global.pass_target_x, global.pass_target_y))
			}
		}
	}
}

//Movement before ball thrown
if(global.play_start and not global.pass_thrown){
	if(coverage == "man" and instance_exists(obj_player_offense)){
		closest_receiver = instance_nearest(x, y, obj_player_offense)
		if(player_speed > coverage_slowdown_coefficient/point_distance(x, y, closest_receiver.x, closest_receiver.y)){
			x = x + ((closest_receiver.x - x) * (player_speed - (coverage_slowdown_coefficient/point_distance(x, y, closest_receiver.x, closest_receiver.y))) / point_distance(x, y, closest_receiver.x, closest_receiver.y))
			y = y + ((closest_receiver.y - y) * (player_speed - (coverage_slowdown_coefficient/point_distance(x, y, closest_receiver.x, closest_receiver.y))) / point_distance(x, y, closest_receiver.x, closest_receiver.y))
		}
	}
}



