// Display Mode:
// preview, plate, bottom, top, null
mode = "preview";

// Variables (units in mm):
edge_thickness   = 8; // 6mm hole for m2.5 screw head
bottom_thickness = 5;
side_height      = 6; // 2mm for pcb, 2mm for hotswap
top_thickness    = 7; // 6.6mm for height of top housing
plate_thickness  = 5;
$fn              = 200; // for smooth circle
plate_width      = 4 * 19.05;
plate_length     = plate_width + 20;
keycap_clearance = 2;
side_clearance   = 5;

// M2.5 Screw height:
screw_height      = 12; // 4mm (bottom) + 6mm (side) + around 4mm (top) - 3mm screw head = 12mm
screw_clearance   = 3; // 2.9mm clearance
screw_head_height = 2;
screw_head_width  = 6; // 5mm screw width

// Calculations
total_width  = plate_width + 2*side_clearance + 2*edge_thickness;
total_length = plate_length + 2*side_clearance + 2*edge_thickness;

//
// Plate:
//

// Draw plate
module draw_plate() {
	difference() {
		union() {
			translate([edge_thickness, edge_thickness])
				square([plate_width + side_clearance*2, plate_width+side_clearance*2]);

			side_draw_plate();
		}

		difference() {
			translate([edge_thickness + side_clearance, edge_thickness + side_clearance])
				square([plate_width, plate_width]);

			translate([edge_thickness + side_clearance, edge_thickness + side_clearance, 0]) // Center plate to case
			import("../plate/4x4 plate.svg");
		}
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
	translate([edge_thickness, edge_thickness, 0])
	hull() {
		translate([0, 0, 0])
			circle(edge_thickness);

		translate([plate_width + side_clearance*2, 0, 0])
			circle(edge_thickness);

		translate([0, plate_length + side_clearance*2, 0])
			circle(edge_thickness);

		translate([plate_width + side_clearance*2, plate_length + side_clearance*2, 0])
			circle(edge_thickness);
	}
}

// draws the side of the case
module side_draw_plate() {
	difference() {
		// Create bottom shape
		bottom_draw_plate();

		// Cut out space for plate
		translate([edge_thickness, edge_thickness, 0])
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
		translate([edge_thickness + side_clearance - keycap_clearance, edge_thickness + side_clearance - keycap_clearance, 0])
			square([plate_width + keycap_clearance*2, plate_length + keycap_clearance*2]);
	}
}

// top case
module top_case() {
	translate([0, 0, side_height + plate_thickness + bottom_thickness])
	linear_extrude(top_thickness)
		top_draw_case();
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
		translate([2/3 * total_width, edge_thickness/2, 0])
			cylinder(screw_height, d=screw_clearance);

		translate([1/3 * total_width, edge_thickness/2, 0])
			cylinder(screw_height, d=screw_clearance);

		translate([2/3 * total_width, total_length - edge_thickness/2, 0])
			cylinder(screw_height, d=screw_clearance);

		translate([1/3 * total_width, total_length - edge_thickness/2, 0])
			cylinder(screw_height, d=screw_clearance);

		translate([2/3 * total_width, edge_thickness/2, -0.1])
			cylinder(screw_head_height, d=screw_head_width);

		translate([1/3 * total_width, edge_thickness/2, -0.1])
			cylinder(screw_head_height, d=screw_head_width);

		translate([2/3 * total_width, total_length - edge_thickness/2, -0.1])
			cylinder(screw_head_height, d=screw_head_width);

		translate([1/3 * total_width, total_length - edge_thickness/2, -0.1])
			cylinder(screw_head_height, d=screw_head_width);

		// side
		translate([edge_thickness/2, 1/3 * total_length, 0])
			cylinder(screw_height, d=screw_clearance);

		translate([edge_thickness/2, 2/3 * total_length, 0])
			cylinder(screw_height, d=screw_clearance);

		translate([total_width - edge_thickness/2, 1/3 * total_length, 0])
			cylinder(screw_height, d=screw_clearance);

		translate([total_width - edge_thickness/2, 2/3 * total_length, 0])
			cylinder(screw_height, d=screw_clearance);

		translate([edge_thickness/2, 1/3 * total_length, -0.1])
			cylinder(screw_head_height, d=screw_head_width);

		translate([edge_thickness/2, 2/3 * total_length, -0.1])
			cylinder(screw_head_height, d=screw_head_width);

		translate([total_width - edge_thickness/2, 1/3 * total_length, -0.1])
			cylinder(screw_head_height, d=screw_head_width);

		translate([total_width - edge_thickness/2, 2/3 * total_length, -0.1])
			cylinder(screw_head_height, d=screw_head_width);
	}
}
