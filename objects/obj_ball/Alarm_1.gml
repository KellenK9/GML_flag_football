/// @description Vertical Sway

if(y_offset == y_original_offset){
	if(increasing_v){
		y_offset = y_offset + vertical_sway
	}
	else{
		y_offset = y_offset - vertical_sway
	}
}
else{
	if(y_offset > y_original_offset){
		y_offset = y_original_offset
		increasing_v = false
	}
	if(y_offset < y_original_offset){
		y_offset = y_original_offset
		increasing_v = true
	}
}
alarm[1] = vertical_sway_frames