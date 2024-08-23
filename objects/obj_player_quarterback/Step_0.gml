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