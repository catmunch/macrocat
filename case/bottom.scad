//
// Bottom Case:
//

// draws the bottom plate
module bottom_draw_plate() {
	translate([side_thickness, side_thickness, 0])
	hull() {
		translate([0, 0, 0])
			circle(side_thickness);

		translate([plate_width + side_clearance*2, 0, 0])
			circle(side_thickness);

		translate([0, plate_length + side_clearance*2, 0])
			circle(side_thickness);

		translate([plate_width + side_clearance*2, plate_length + side_clearance*2, 0])
			circle(side_thickness);
	}
}

// draws the side of the case
module side_draw_plate() {
	difference() {
		// Create bottom shape
		bottom_draw_plate();

		// Cut out space for plate
		translate([side_thickness, side_thickness, 0])
			square([plate_width + side_clearance*2, plate_length + side_clearance*2]);
	}
}

// bottom casing
module bottom_case() {
	difference() {
		union() {
			// extruded bottom plate
			linear_extrude(bottom_thickness) {
				bottom_draw_plate();
			}

			// extruded side plate
			translate([0, 0, bottom_thickness])
			linear_extrude(side_height)
				side_draw_plate();
		}

		bottom_screws();
		bottom_case_cutout();
	}
}
