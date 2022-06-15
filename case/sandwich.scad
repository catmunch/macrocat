// Display Mode:
// preview, plate, bottom, top
mode = "preview";

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

// draw_plate();

// Variables (units in mm):
edge_thickness = 3;
bottom_thickness = 2;
side_height = 10;
u = 19.05;
$fn = 200; // for smooth circle
plate_width = 4 * 19.05;
plate_height = 5;
top_thickness = 3;

//
// Plate:
//

// Draw plate
module draw_plate() {
	union() {
		translate([edge_thickness, edge_thickness, 0]) // Center plate to case
		import("../plate/4x4 plate.svg");
		side_draw_plate();
	}
}

// Extrude Plate
module plate() {
	translate([0, 0, side_height])
	linear_extrude(plate_height)
		draw_plate();
}

//
// Bottom Case:
//

// draws the bottom plate
module bottom_draw_plate() {
	minkowski() {
		// center plate location
		translate([edge_thickness, edge_thickness, 0])
			square(plate_width);

		// rounded edge
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
			square(plate_width);
	}
}

// bottom casing
module bottom_case() {
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
}

//
// Top Case:
//

// draws top case
module top_draw_case() {
	side_draw_plate();
}

// top case
module top_case() {
	translate([0, 0, side_height + plate_height])
	linear_extrude(top_thickness)
		top_draw_case();
}
