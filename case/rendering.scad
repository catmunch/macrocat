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
