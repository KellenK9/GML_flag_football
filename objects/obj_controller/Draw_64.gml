/// @description 

draw_set_colour(c_black)
draw_set_alpha(0.8)
draw_set_font(fnt_1)

if(global.hit_ground){
	draw_text(720, 800, "Dropped Pass")
}

if(global.offense_caught){
	if(global.touchdown){
		draw_text(780, 800, "Touchdown")
	}
	else{
		draw_text(780, 800, "Reception")
	}
}

if(global.defense_caught){
	if(global.touchdown_defense){
		draw_text(780, 800, "Touchdown")
	}
	else{
		draw_text(750, 800, "Interception")
	}
}