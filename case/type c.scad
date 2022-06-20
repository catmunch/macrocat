// 
// Type C port cut out
//

module bottom_case_cutout() {
	translate([(total_width-port_width)/2, total_length-side_thickness-1, bottom_thickness + side_height - (port_height)/2])
	cube([port_width, side_thickness+2, port_height]);
}

module plate_cutout() {
	translate([(total_width-port_width)/2, total_length-side_thickness-1])
	square([port_width, side_thickness+2]);
}
