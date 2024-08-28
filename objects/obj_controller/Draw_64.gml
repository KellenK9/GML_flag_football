/// @description 

draw_set_colour(c_black)
draw_set_alpha(0.8)
draw_set_font(fnt_2)

draw_text(gui_score_text_x, gui_score_text_y, $"SCORE: {global.arcade_score}")

draw_set_colour(c_yellow)
draw_set_font(fnt_1)

if(global.hit_ground){
	draw_set_font(fnt_3)
	draw_text(gui_point_text_x, gui_point_text_y, "-10")
	draw_set_font(fnt_1)
	draw_text(750, 800, "Dropped Pass")
}

if(global.offense_caught){
	if(global.touchdown){
		draw_set_font(fnt_3)
		draw_text(gui_point_text_x, gui_point_text_y, "+2000")
		draw_set_font(fnt_1)
		draw_text(780, 800, "Touchdown")
	}
	else{
		if(global.contested_catch){
			draw_set_font(fnt_1)
			draw_text(680, 800, "Contested Catch")
		}
		else{
			draw_set_font(fnt_1)
			draw_text(780, 800, "Reception")
		}
		if(global.offensive_player_caught.tackled){
			if(global.contested_catch){
				draw_set_font(fnt_3)
				draw_text(gui_point_text_x, gui_point_text_y, "+150")
			}
			else{
				draw_set_font(fnt_3)
				draw_text(gui_point_text_x, gui_point_text_y, "+100")
			}
		}
	}
}

if(global.defense_caught){
	if(global.touchdown_defense){
		draw_set_font(fnt_3)
		draw_text(gui_point_text_x, gui_point_text_y, "-1000")
		draw_set_font(fnt_1)
		draw_text(780, 800, "Pick Six")
	}
	else{
		if(global.contested_catch){
			draw_set_font(fnt_1)
			draw_text(620, 800, "Contested Interception")
		}
		else{
			draw_set_font(fnt_1)
			draw_text(750, 800, "Interception")
		}
		if(global.defensive_player_caught.tackled){
			if(global.contested_catch){
				draw_set_font(fnt_3)
				draw_text(gui_point_text_x, gui_point_text_y, "-250")
			}
			else{
				draw_set_font(fnt_3)
				draw_text(gui_point_text_x, gui_point_text_y, "-500")
			}
		}
	}
}