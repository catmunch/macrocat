side_width = 10;

module drawSideProfile() {
	hull() {
		// Top Left
		translate([-(total_plate_width)/2-keycap_margins, (total_plate_height+extra_pcb_height)/2])
			circle(side_width);

		// Top Right
		translate([(total_plate_width)/2+keycap_margins, (total_plate_height+extra_pcb_height)/2])
			circle(side_width);

		// Bottom Left
		translate([(-total_plate_width)/2-keycap_margins, -(total_plate_height-extra_pcb_height)/2-keycap_margins])
			circle(side_width);

		// Bottom Right
		translate([(total_plate_width)/2+keycap_margins, -(total_plate_height-extra_pcb_height)/2-keycap_margins])
			circle(side_width);
	}

}
