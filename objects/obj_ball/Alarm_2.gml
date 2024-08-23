/// @description Angle Sway

if(angle == angle_original){
	if(increasing_angle){
		angle = angle + (angle_sway * rotations_per_angle_sway)
	}
	else{
		angle = angle - (angle_sway * rotations_per_angle_sway)
	}
}
else{
	if(angle > angle_original){
		angle = angle_original
		increasing_angle = false
	}
	if(angle < angle_original){
		angle = angle_original
		increasing_angle = true
	}
}
alarm[2] = angle_sway_frames