screw_height      = 14;
screw_clearance   = 3.4;					// 3.4mm clearance
screw_head_height = 2;						// 1mm screw head height
screw_head_width  = 6;						// 6mm screw head width

inserts_width = 4.8;						// 5mm diameter
inserts_height = 4;							// 4mm high insert
inserts_hole_height = inserts_height*1.3;	// 4mm high insert

inwards = 1.5;								// Move inwards

total_bottom_height = bottom_thickness + side_height + plate_thickness;

module bottomScrew (x, y) {
	translate([x, y+extra_pcb_height/2, -total_bottom_height + plate_thickness]) {	// +extra_pcb_height/2 to center to case
		cylinder(total_bottom_height, d=screw_clearance);
		cylinder(screw_head_height,   d=screw_head_width+margins);
	}
}

module plateScrew (x, y) {
	translate([x, y+extra_pcb_height/2]) {
		circle(d=screw_clearance);
	}
}

module topInserts (x, y) {
	translate([x, y+extra_pcb_height/2, plate_thickness])	// +extra_pcb_height/2 to center to case
		cylinder(inserts_hole_height, d=inserts_width);
}

module screws() {
	// Left
	bottomScrew(-(total_plate_width+side_width)/2-(pcb_offset+margins-inwards), total_plate_height/3);
	bottomScrew(-(total_plate_width+side_width)/2-(pcb_offset+margins-inwards), -total_plate_height/3);

	// Right
	bottomScrew((total_plate_width+side_width)/2+(pcb_offset+margins-inwards), total_plate_height/3);
	bottomScrew((total_plate_width+side_width)/2+(pcb_offset+margins-inwards), -total_plate_height/3);

	// Top
	bottomScrew((total_plate_width+side_width)/4,  (total_plate_height+side_width)/2+margins-inwards);
	bottomScrew(-(total_plate_width+side_width)/4, (total_plate_height+side_width)/2+margins-inwards);

	// Bottom
	bottomScrew((total_plate_width+side_width)/4,  -(total_plate_height+side_width)/2-2*margins+inwards);
	bottomScrew(-(total_plate_width+side_width)/4, -(total_plate_height+side_width)/2-2*margins+inwards);
}

module inserts() {
	// Left
	topInserts(-(total_plate_width+side_width)/2-(pcb_offset+margins-inwards), total_plate_height/3);
	topInserts(-(total_plate_width+side_width)/2-(pcb_offset+margins-inwards), -total_plate_height/3);

	// Right
	topInserts((total_plate_width+side_width)/2+(pcb_offset+margins-inwards), total_plate_height/3);
	topInserts((total_plate_width+side_width)/2+(pcb_offset+margins-inwards), -total_plate_height/3);

	// Top
	topInserts((total_plate_width+side_width)/4,  (total_plate_height+side_width)/2+margins-inwards);
	topInserts(-(total_plate_width+side_width)/4, (total_plate_height+side_width)/2+margins-inwards);

	// Bottom
	topInserts((total_plate_width+side_width)/4,  -(total_plate_height+side_width)/2-2*margins+inwards);
	topInserts(-(total_plate_width+side_width)/4, -(total_plate_height+side_width)/2-2*margins+inwards);
}

module plateScrewHoles() {
	// Left
	plateScrew(-(total_plate_width+side_width)/2-(pcb_offset+margins-inwards), total_plate_height/3);
	plateScrew(-(total_plate_width+side_width)/2-(pcb_offset+margins-inwards), -total_plate_height/3);

	// Right
	plateScrew((total_plate_width+side_width)/2+(pcb_offset+margins-inwards), total_plate_height/3);
	plateScrew((total_plate_width+side_width)/2+(pcb_offset+margins-inwards), -total_plate_height/3);

	// Top
	plateScrew((total_plate_width+side_width)/4,  (total_plate_height+side_width)/2+margins-inwards);
	plateScrew(-(total_plate_width+side_width)/4, (total_plate_height+side_width)/2+margins-inwards);

	// Bottom
	plateScrew((total_plate_width+side_width)/4,  -(total_plate_height+side_width)/2-2*margins+inwards);
	plateScrew(-(total_plate_width+side_width)/4, -(total_plate_height+side_width)/2-2*margins+inwards);
}
