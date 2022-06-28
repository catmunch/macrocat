// Parameters
pcb_offset = 1.333;	// 1.333mm on pcb
plate_width = 4*u;
plate_height = 4*u;
extra_pcb_height = 20;

// Calculations
total_plate_height = plate_height + extra_pcb_height;
total_plate_width = plate_width;

module center_plate() {
	difference() {
		// Plate shape
		translate([0, (extra_pcb_height-pcb_offset)/2])
		 square([total_plate_width+2*pcb_offset, total_plate_height+pcb_offset], center=true);

		// Cutout for plate
		difference() {
			square([plate_width, plate_height], center=true);

			import("./plate/4x4 plate.svg", center=true);
		}

		// Cutout for pcb components
		translate([0, (plate_height+extra_pcb_height)/2])	// right ontop of plate
			square([plate_width, extra_pcb_height], center=true);
	}
}
