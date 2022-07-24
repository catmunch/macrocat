bottom_thickness = 3;
fillet_width = 3;
pcb_height = 4;	// 2mm for pcb, 2mm for hotswap/pins
side_height = pcb_height+2*margins;

module bottomCurve() {
	translate([0, 0, -side_height])
	difference(){
		// Rounding
		minkowski() {
			// Offset and -fillet_width to account for extra minkowski size
			translate([0, 0, -(bottom_thickness-fillet_width)])
				linear_extrude(bottom_thickness)
				offset(-fillet_width)
				drawSideProfile();

			// Sphere to run fillet with 
			sphere(fillet_width);
		}

		// Cut away 
		linear_extrude(2*(fillet_width+bottom_thickness))
			offset(1)	// openscad cutting glitch
			drawSideProfile();
	}
}

module sideWall() {
	translate([0, 0, -side_height])
		linear_extrude(side_height)
		difference() {
			drawSideProfile();

			translate([0, extra_pcb_height/2])
				offset(pcb_offset+margins)
				square([plate_width, plate_height+extra_pcb_height], center=true);
		}
}

module bottom() {
	difference() { 
		union() {
			sideWall();
			bottomCurve();
		}

		screws();
	}
}
