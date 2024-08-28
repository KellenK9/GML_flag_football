/// @description 

if(global.hit_ground or global.touchdown or global.touchdown_defense){
	if(keyboard_check_pressed(vk_space)){
		room_restart()
	}
}
if(global.offense_caught){
	if(global.offensive_player_caught.tackled){
		if(keyboard_check_pressed(vk_space)){
			room_restart()
		}
	}
}
if(global.defense_caught){
	if(global.defensive_player_caught.tackled){
		if(keyboard_check_pressed(vk_space)){
			room_restart()
		}
	}
}

if(global.pass_thrown){
	if(initial_pass_thrown = false){
		draw_throw_indicator = true
	}
	initial_pass_thrown = true
	if(draw_throw_indicator){
		if(alarm[0] < 0){
			alarm[0] = throw_indicator_duration
		}
	}
}

//Adjust points when events happen
if(global.play_start and not global.pass_thrown){
	points_ready_to_adjust = true
}
if(points_ready_to_adjust){
	if(global.hit_ground){
		global.arcade_score = global.arcade_score - 10
		points_ready_to_adjust = false
	}
	if(global.offense_caught){
		if(global.touchdown){
			global.arcade_score = global.arcade_score + 2000
			points_ready_to_adjust = false
		}
		else{
			if(global.offensive_player_caught.tackled){
				if(global.contested_catch){
					global.arcade_score = global.arcade_score + 150
					points_ready_to_adjust = false
				}
				else{
					global.arcade_score = global.arcade_score + 100
					points_ready_to_adjust = false
				}
			}
		}
	}
	if(global.defense_caught){
		if(global.touchdown_defense){
			global.arcade_score = global.arcade_score - 1000
			points_ready_to_adjust = false
		}
		else{
			if(global.defensive_player_caught.tackled){
				if(global.contested_catch){
					global.arcade_score = global.arcade_score - 250
					points_ready_to_adjust = false
				}
				else{
					global.arcade_score = global.arcade_score - 500
					points_ready_to_adjust = false
				}
			}
		}
	}
}