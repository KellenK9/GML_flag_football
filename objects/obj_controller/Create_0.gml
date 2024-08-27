/// @description 

line_of_scrimmage = 20
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
reciever1 = instance_create_depth(offense_x_1, goal_line_y+reciever_yards_off_scrimmage_1-(line_of_scrimmage*pixels_per_yard), 1, obj_player_offense)
reciever2 = instance_create_depth(offense_x_2, goal_line_y+reciever_yards_off_scrimmage_1-(line_of_scrimmage*pixels_per_yard), 1, obj_player_offense)
reciever1.player_path = pth_slant_right
reciever2.player_path = pth_dig_left

//Create Ball
instance_create_depth(qb_x, goal_line_y+qb_yards_off_scrimmage-(line_of_scrimmage*pixels_per_yard), -1, obj_ball)

//Create line of scrimmage
instance_create_depth(0, goal_line_y-(line_of_scrimmage*pixels_per_yard), 10, obj_scrimmage_wide)