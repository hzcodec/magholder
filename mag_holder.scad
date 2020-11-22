$fn=60;

module holder() {
    magnet_diameter = 10;
    
    difference() {
        cube([50, 20, 60]);
        translate([25, 10, 20])
        cylinder(d=magnet_diameter, h=40);
     }  
}
//

module pin_hole_holder() {
    pin_diameter = 4.8;
    translate([10, 10, 45])
    cylinder(d=pin_diameter, h=15);
    translate([40, 10, 45])
    cylinder(d=pin_diameter, h=15);     
}
//

module block_holder() {
    hold_diameter = 3.8;
    translate([10, 10, 0])
    cylinder(d=hold_diameter, h=15);
    translate([40, 10, 0])
    cylinder(d=hold_diameter, h=15);
}

module pin_hole_servo() {
    servo_pin_diameter = 3.8;
    translate([0, 10, 40])
    rotate([0,90,0])
    cylinder(d=servo_pin_diameter, h=6);

}

module version_text() {
	color([.6, .7, .6])
        rotate([90,0,0])
	translate([35, 5, 0]) {
		linear_extrude(height=1) {
			text(content, font=font, size=5);
		}
	}
}


//
// main
//
difference() {
    holder();
    pin_hole_holder();
    block_holder();
    pin_hole_servo();
}

translate([-25, 0, 0]) cube([25, 20, 5]);
translate([50, 0, 0]) cube([25, 20, 5]);

content = "RA";
font = "Liberation Sans";
version_text();
