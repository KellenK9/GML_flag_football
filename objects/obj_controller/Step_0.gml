/// @description 

if(global.hit_ground or global.defense_caught or global.touchdown){
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