// Spacing needed for 1 keyswitch
u = 19.05;

// Extra spacing between each component
margins = 1;

// Render prettier surfaces
$fn = 50;

include <plate.scad>
include <side profile.scad>
include <top.scad>
include <bottom.scad>

% linear_extrude(plate_thickness)
	drawPlate();

translate([0, 0, plate_thickness])
	topSides();

bottom();
