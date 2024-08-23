/// @description Draw Throw Indicator

if(draw_throw_indicator){
	draw_sprite(spr_throw_indicator, 0, global.pass_target_x, global.pass_target_y)
}
if(not global.pass_thrown){
	draw_sprite_ext(spr_throw_indicator, 0, mouse_x, mouse_y, 1, 1, 0, c_white, 0.2)
}