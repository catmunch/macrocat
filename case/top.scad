top_notch = 2;
side_notch = 2;

top_height = 8;

keycap_margins = 1.5*margins;

// Draws the side profile
module drawTopSideProfile() {
	polygon([[0,0], [0, top_height], [top_notch, top_height], [side_width, side_notch], [side_width, 0]]);
}

module topSideCurve() {
	rotate_extrude($fn=100, angle=90)
		polygon([[0,0], [0, top_height], [top_notch, top_height], [side_width, side_notch], [side_width, 0]]);
}

// Sides
module topSides() {
	// Right
	translate([(total_plate_width)/2+keycap_margins, (extra_pcb_height-keycap_margins)/2])
		rotate([90, 0, 0])
		linear_extrude(total_plate_height+keycap_margins, center=true)
		drawTopSideProfile();

	// Left
	translate([-((total_plate_width)/2+keycap_margins), (extra_pcb_height-keycap_margins)/2])
		rotate([90, 0, 180])
		linear_extrude(total_plate_height+keycap_margins, center=true)
		drawTopSideProfile();

	// Top
	translate([0, (total_plate_height+extra_pcb_height)/2])
		rotate([90, 0, 90])
		linear_extrude(total_plate_width+2*keycap_margins, center=true)
		drawTopSideProfile();

	// Bottom
	translate([0, -(total_plate_height-extra_pcb_height)/2-keycap_margins])
		rotate([90, 0, -90])
		linear_extrude(total_plate_width+2*keycap_margins, center=true)
		drawTopSideProfile();

	// Edges
	// Top Left
	translate([-(total_plate_width)/2-keycap_margins, (total_plate_height+extra_pcb_height)/2])
		rotate([0, 0, 90])
		topSideCurve();

	// Top Right
	translate([(total_plate_width)/2+keycap_margins, (total_plate_height+extra_pcb_height)/2])
		rotate([0, 0, 0])
		topSideCurve();

	// Bottom Left
	translate([(-total_plate_width)/2-keycap_margins, -(total_plate_height-extra_pcb_height)/2-keycap_margins])
		rotate([0, 0, 180])
		topSideCurve();

	// Bottom Right
	translate([(total_plate_width)/2+keycap_margins, -(total_plate_height-extra_pcb_height)/2-keycap_margins])
		rotate([0, 0, -90])
		topSideCurve();
}
