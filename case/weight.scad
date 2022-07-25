weight_height = 1;
thickness_offset = 0.3;
total_scale_factor = 1.2;

module cat() {
	scale([total_scale_factor, total_scale_factor])
	mirror([1,0,0])
	translate([0, -5, -(side_height+bottom_thickness)])
	linear_extrude(weight_height) {
		translate([-35, -15])
		offset(thickness_offset)
		scale([0.05, 0.05])
		import("./weight/cat3.svg");

		
		translate([-15, -5])
		text("MacroCat", 5);
	}
}
