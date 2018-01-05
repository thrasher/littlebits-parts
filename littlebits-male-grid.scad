// dimensions in inches
$fs = 0.1; // per facet in cylinder
$fa = 5; // degrees per facet in cylinder
$fn = 100;

knob_dia = 0.236;
knob_ht = 0.1;
knob_spacing = 0.52/2;

module knob() {
    difference() {
        cylinder(d = knob_dia, h = knob_ht);
        translate([0,0,-knob_ht])
        cylinder(d = knob_dia * .7, h = knob_ht * 3);
        translate([0,0,-knob_ht/2])
        cube([knob_ht, 10, knob_ht*4], center = true);
    }
}

module grid(x,y) {
    translate([-knob_spacing * (x-1), 0, 0]){
    for (i = [0:x-1]) {
        for (j = [0:y-1]) {
            translate([i*knob_spacing*2, j * knob_spacing, 0]) rotate(0) knob();
        }
    }

    translate([0,0,-knob_ht/2])
    minkowski()
    {
    cube([knob_spacing * x, knob_spacing * (y-1), knob_ht/4], center = false);
    cylinder(d = .277, h = knob_ht/4);
    }
    }
}
grid(2,5);


