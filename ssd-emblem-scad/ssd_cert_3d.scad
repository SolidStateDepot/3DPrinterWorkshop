include <Write.scad>

radius = 30;
size = 2 * radius * cos(45) - 3;
thickness = 2;
font_size = 17;
o = 0.01;

SSD_Emblem();

module SSD_Emblem() {
	union() {
		EmblemBase();
		translate([0, 4, thickness * 2 - o]) SSD();
		translate([0, -15, thickness * 1 - o]) certified();
	}
}

module EmblemBase() {
	translate([0, 0, 0]) cylinder(r = radius, h = thickness);
	minkowski() {
		translate([-size / 2, -size / 2 + 10 + 5, thickness - o]) cube([size - 1, size - 10 - 10, thickness]);
		rotate([0, 0, 90]) cylinder(r = 5, h = 0.01, center = true);
	}
}

module SSD() {
	write("SSD", t = 4, h = font_size, center = true);
}

module certified() {
	write("CERTIFIED", t = 2, h = font_size / 2.5, center = true);
}