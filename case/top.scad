//
// Top Case:
//

// draws top case
module top_draw_case() {
	difference() {
		// Create bottom shape
		bottom_draw_plate();

		// Cut out space for keycaps
		translate([side_thickness + side_clearance - keycap_clearance, side_thickness + side_clearance - keycap_clearance, 0])
			square([plate_width + keycap_clearance*2, plate_length + keycap_clearance*2]);
	}
}

// top case
module top_case() {
	difference() {
		translate([0, 0, side_height + plate_thickness + bottom_thickness])
		linear_extrude(top_thickness)
			top_draw_case();

		top_case_screws();
	}
}

