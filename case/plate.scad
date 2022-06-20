//
// Plate:
//

// Draw plate
module draw_plate() {
	difference() {
		union() {
			translate([side_thickness, side_thickness])
				square([plate_width + side_clearance*2, plate_width+side_clearance*2]);

			side_draw_plate();
		}

		difference() {
			translate([side_thickness + side_clearance, side_thickness + side_clearance])
				square([plate_width, plate_width]);

			translate([side_thickness + side_clearance, side_thickness + side_clearance, 0]) // Center plate to case
			import("../plate/4x4 plate.svg");
		}
        
        plate_screws();
		plate_cutout();
	}
}

// Extrude Plate
module plate() {
	translate([0, 0, side_height + bottom_thickness])
	linear_extrude(plate_thickness)
		draw_plate();
}
