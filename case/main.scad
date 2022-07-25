// Rendering mode (preview, plate, bottom, top)
mode = "preview";	// Leave on preview for rendering

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
include <screw.scad>
include <typec.scad>
include <weight.scad>

// Rendering
if (mode == "preview") {
	% plate();
	top();
	bottom();
} else if (mode == "plate") {
	drawPlate();
} else if (mode == "bottom") {
	bottom();
} else if (mode == "top") {
	top();
} else {
	echo("Syntax error!");
}

