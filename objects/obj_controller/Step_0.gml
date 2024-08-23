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