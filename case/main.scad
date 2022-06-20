// preview, plate, bottom, top, null
mode = "preview";

include <plate.scad>
include <top.scad>
include <bottom.scad>
include <screw.scad>
include <type c.scad>

// Variables (units in mm):
side_thickness   = 10; // 8mm hole for m3 screw head
bottom_thickness = 5;
side_height      = 6; // 2mm for pcb, 2mm for hotswap
top_thickness    = 6.6; // 6.6mm for height of top housing
plate_thickness  = 5;
$fn              = 200; // for smooth circle
plate_width      = 4 * 19.05;
plate_length     = plate_width + 20;
keycap_clearance = 2;
side_clearance   = 3;

// M2.5 Screw height:
screw_height      = 14; // 4mm (bottom) + 6mm (side) + 5mm plate + around 4mm (top) - 3mm screw head = 14mm
screw_clearance   = 3.6; // 3.4mm clearance
screw_head_height = 3; // 1mm screw head height
screw_head_width  = 8; // 6mm screw head width

inserts_width = 4.8; // 5mm diameter
inserts_height = 4; // 4mm high insert
inserts_hole_height = inserts_height*1.3; // 4mm high insert

// Type C Cutout
port_width = 15; 
port_height = 10;

// Calculations
total_width  = plate_width + 2*side_clearance + 2*side_thickness;
total_length = plate_length + 2*side_clearance + 2*side_thickness;

include <rendering.scad>
