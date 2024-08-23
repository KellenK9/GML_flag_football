/// @description Horizontal Sway

if(x_offset == x_original_offset){
	if(increasing_h){
		x_offset = x_offset + horizontal_sway
	}
	else{
		x_offset = x_offset - horizontal_sway
	}
}
else{
	if(x_offset > x_original_offset){
		x_offset = x_original_offset
		increasing_h = false
	}
	if(x_offset < x_original_offset){
		x_offset = x_original_offset
		increasing_h = true
	}
}
alarm[0] = horizontal_sway_frames