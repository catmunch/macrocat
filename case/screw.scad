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
