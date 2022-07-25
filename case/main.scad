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

% plate();

top();
 
bottom();
