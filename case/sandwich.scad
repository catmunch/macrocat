// Display Mode:
// preview, plate, bottom, top, null
mode = "preview";

// Variables (units in mm):
side_thickness   = 8; // 6mm hole for m2.5 screw head
bottom_thickness = 5;
side_height      = 6; // 2mm for pcb, 2mm for hotswap
top_thickness    = 7; // 6.6mm for height of top housing
plate_thickness  = 5;
$fn              = 200; // for smooth circle
plate_width      = 4 * 19.05;
plate_length     = plate_width + 20;
keycap_clearance = 2;
side_clearance   = 3;

// M2.5 Screw height:
screw_height      = 14; // 4mm (bottom) + 6mm (side) + 5mm plate + around 4mm (top) - 3mm screw head = 14mm
screw_clearance   = 3; // 2.9mm clearance
screw_head_height = 3;
screw_head_width  = 6; // 5mm screw width

inserts_width = 4; // 4.2mm diameter
inserts_height = 4; // 4mm high insert
inserts_hole_height = inserts_height*1.3; // 4mm high insert

// Type C Cutout
port_width = 15; 
port_height = 10;

// Calculations
total_width  = plate_width + 2*side_clearance + 2*side_thickness;
total_length = plate_length + 2*side_clearance + 2*side_thickness;

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

// Rendering
if (mode == "preview") {
	bottom_case();
	% plate();
	top_case();
} else if (mode == "plate") {
	draw_plate();
} else if (mode == "bottom") {
	bottom_case();
} else if (mode == "top") {
	top_case();
} else {
	echo("Syntax error!");
}

// 
// Screws:
// 

// Screw Holes
module bottom_screws() {
	union() {
		// top
		translate([2/3 * total_width, side_thickness/2, 0])
			cylinder(screw_height, d=screw_clearance);

		translate([1/3 * total_width, side_thickness/2, 0])
			cylinder(screw_height, d=screw_clearance);

		translate([2/3 * total_width, total_length - side_thickness/2, 0])
			cylinder(screw_height, d=screw_clearance);

		translate([1/3 * total_width, total_length - side_thickness/2, 0])
			cylinder(screw_height, d=screw_clearance);

		translate([2/3 * total_width, side_thickness/2, -0.1])
			cylinder(screw_head_height, d=screw_head_width);

		translate([1/3 * total_width, side_thickness/2, -0.1])
			cylinder(screw_head_height, d=screw_head_width);

		translate([2/3 * total_width, total_length - side_thickness/2, -0.1])
			cylinder(screw_head_height, d=screw_head_width);

		translate([1/3 * total_width, total_length - side_thickness/2, -0.1])
			cylinder(screw_head_height, d=screw_head_width);

		// side
		translate([side_thickness/2, 1/3 * total_length, 0])
			cylinder(screw_height, d=screw_clearance);

		translate([side_thickness/2, 2/3 * total_length, 0])
			cylinder(screw_height, d=screw_clearance);

		translate([total_width - side_thickness/2, 1/3 * total_length, 0])
			cylinder(screw_height, d=screw_clearance);

		translate([total_width - side_thickness/2, 2/3 * total_length, 0])
			cylinder(screw_height, d=screw_clearance);

		translate([side_thickness/2, 1/3 * total_length, -0.1])
			cylinder(screw_head_height, d=screw_head_width);

		translate([side_thickness/2, 2/3 * total_length, -0.1])
			cylinder(screw_head_height, d=screw_head_width);

		translate([total_width - side_thickness/2, 1/3 * total_length, -0.1])
			cylinder(screw_head_height, d=screw_head_width);

		translate([total_width - side_thickness/2, 2/3 * total_length, -0.1])
			cylinder(screw_head_height, d=screw_head_width);
	}
}

module plate_screws() {
    translate([2/3 * total_width, side_thickness/2])
        circle(screw_clearance / 2);

    translate([1/3 * total_width, side_thickness/2])
        circle(screw_clearance / 2);

    translate([2/3 * total_width, total_length - side_thickness/2])
        circle(screw_clearance / 2);

    translate([1/3 * total_width, total_length - side_thickness/2])
        circle(screw_clearance / 2);
    
    translate([side_thickness/2, 1/3 * total_length])
        circle(screw_clearance / 2);

    translate([side_thickness/2, 2/3 * total_length])
        circle(screw_clearance / 2);

    translate([total_width - side_thickness/2, 1/3 * total_length])
        circle(screw_clearance / 2);

    translate([total_width - side_thickness/2, 2/3 * total_length])
        circle(screw_clearance / 2);
}

module top_case_screws() {
	translate([2/3 * total_width, side_thickness/2, bottom_thickness + side_height + plate_thickness-0.1])
		cylinder(inserts_hole_height, d=inserts_width);

	translate([1/3 * total_width, side_thickness/2, bottom_thickness + side_height + plate_thickness-0.1])
		cylinder(inserts_hole_height, d=inserts_width);

	translate([2/3 * total_width, total_length - side_thickness/2, bottom_thickness + side_height + plate_thickness-0.1])
		cylinder(inserts_hole_height, d=inserts_width);

	translate([1/3 * total_width, total_length - side_thickness/2, bottom_thickness + side_height + plate_thickness-0.1])
		cylinder(inserts_hole_height, d=inserts_width);

	translate([side_thickness/2, 1/3 * total_length, bottom_thickness + side_height + plate_thickness-0.1])
		cylinder(inserts_hole_height, d=inserts_width);

	translate([side_thickness/2, 2/3 * total_length, bottom_thickness + side_height + plate_thickness-0.1])
		cylinder(inserts_hole_height, d=inserts_width);

	translate([total_width - side_thickness/2, 1/3 * total_length, bottom_thickness + side_height + plate_thickness-0.1])
		cylinder(inserts_hole_height, d=inserts_width);

	translate([total_width - side_thickness/2, 2/3 * total_length, bottom_thickness + side_height + plate_thickness-0.1])
		cylinder(inserts_hole_height, d=inserts_width);
}

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
