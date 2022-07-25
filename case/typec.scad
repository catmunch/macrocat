port_width = 15; 
port_height = 10;

module bottomCaseCutout() {
		translate([0, plate_height/2+extra_pcb_height+side_width/2+margins+1, 0])
        cube([port_width, side_width+2, port_height], center=true);
}

module plateCutout() {
		translate([0, plate_height/2+extra_pcb_height+side_width/2+margins+1, 0])
        square([port_width, side_width+2], center=true);
}
