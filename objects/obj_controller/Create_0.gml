/// @description 

global.arcade_score = 0

gui_point_text_x = 150
gui_point_text_y = 48
gui_score_text_x = 20
gui_score_text_y = 0
points_ready_to_adjust = false

line_of_scrimmage = 20
first_down_yardline = 30
pixels_per_yard = 9
goal_line_y = 985
draw_throw_indicator = false
alarm[0] = -1
throw_indicator_duration = 30
initial_pass_thrown = false

defender_yards_off_scrimmage_1 = 20
defender_yards_off_scrimmage_2 = 60
qb_yards_off_scrimmage = 10
reciever_yards_off_scrimmage_1 = 10

defender_x_1 = 100
defender_x_2 = 250
defender_x_3 = 400

qb_x = 250
offense_x_1 = 100
offense_x_2 = 400

possible_routes = [pth_curl, pth_dig_left, pth_fade_right, pth_in_right, pth_slant_right]

playbook = [
["OG", 100, pth_slant_right, 400, pth_dig_left],
["Twin Ins", 100, pth_in_right, 400, pth_dig_left],
["Quickie", 100, pth_curl, 400, pth_dig_left],
["Twin Curls", 100, pth_curl, 400, pth_curl],
["Quick or Comeback", 100, pth_slant_right, 400, pth_curl],
["Classic Comeback", 100, pth_in_right, 400, pth_curl],
["Cleared Comeback", 100, pth_fade_right, 400, pth_curl],
["Faded", 100, pth_in_right, 400, pth_fade_right],
["Hook'n'Fade", 100, pth_curl, 400, pth_fade_right],
["Over Under", 100, pth_slant_right, 400, pth_fade_right],
["Hail Mary", 100, pth_fade_left, 400, pth_fade_right],
["Hail Mary Right", 100, pth_fade_right, 400, pth_fade_right],
["Hail Mary Left", 100, pth_fade_left, 400, pth_fade_left],
]
current_play = playbook[irandom(array_length(playbook) - 1)]

// Create Defenders
defender1 = instance_create_depth(defender_x_1, goal_line_y-defender_yards_off_scrimmage_1-(line_of_scrimmage*pixels_per_yard), 1, obj_player_defense)
defender2 = instance_create_depth(defender_x_2, goal_line_y-defender_yards_off_scrimmage_2-(line_of_scrimmage*pixels_per_yard), 1, obj_player_defense)
defender3 = instance_create_depth(defender_x_3, goal_line_y-defender_yards_off_scrimmage_1-(line_of_scrimmage*pixels_per_yard), 1, obj_player_defense)
defender1.coverage = "man"
defender2.coverage = "zone-single-high-safety"
defender3.coverage = "man"

//Create QB
instance_create_depth(qb_x, goal_line_y+qb_yards_off_scrimmage-(line_of_scrimmage*pixels_per_yard), 1, obj_player_quarterback)

//Create Recievers
reciever1 = instance_create_depth(current_play[1], goal_line_y+reciever_yards_off_scrimmage_1-(line_of_scrimmage*pixels_per_yard), 1, obj_player_offense)
reciever1.player_path = current_play[2]
reciever2 = instance_create_depth(current_play[3], goal_line_y+reciever_yards_off_scrimmage_1-(line_of_scrimmage*pixels_per_yard), 1, obj_player_offense)
reciever2.player_path = current_play[4]

//Create Ball
instance_create_depth(qb_x, goal_line_y+qb_yards_off_scrimmage-(line_of_scrimmage*pixels_per_yard), -1, obj_ball)

//Create line of scrimmage
instance_create_depth(0, goal_line_y-(line_of_scrimmage*pixels_per_yard), 10, obj_scrimmage)
instance_create_depth(0, goal_line_y-(first_down_yardline*pixels_per_yard), 10, obj_first_down)
