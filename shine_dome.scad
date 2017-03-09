// Shine Dome ANU
// 08/02/17
// by Ming-Dao Chia
    
// Settings
// number of sides that each cylinder has
circle_resolution = 30; 
sphere_resolution = 30;
// angle that the arches are made at
hole_angle = 50;
// how high the base is
base_height = 2;

// Make a bunch of cylinders that are equally distributed in a circle
module arches(num, size){
    function angle(i,num)=i*(360/num);
    for(i=[1:num]){
        rotate([0,hole_angle,angle(i,num)])
        cylinder(h=500, r=size, center=true, $fn=circle_resolution);
    }
}

// Forms the dome itself, complete with arches
module Dome(){
    difference(){
        sphere(40,center=true, $fn=sphere_resolution);
        //arches are implemented as subtracted holes
        arches(16,5.5);
        //subtracted sphere allows for hollow dome shell
        sphere(39,center=true, $fn=sphere_resolution);
    }
}

// Combine dome with internal cylinder
module ShineDomeCore(){
    union(){
        Dome();
        cylinder(h=60,r=25,center=true, $fn=circle_resolution);
    }
}

// Base stand
module base(){
    difference(){
        cylinder(h=51,r=32,center=true, $fn=circle_resolution);
        translate([-50,-50,-(74.5+base_height)])
        cube([100,100,100]);
    }
}

// Combine components
module ShineDome(){
    union(){
        base();
        difference(){
            ShineDomeCore();
            translate([-50,-50,-74.5])
            cube([100,100,100]);
        
        }
    }
}

// Bring it down so that the bottom of the model
// is aligned with the origin
translate([0,0,-(25.5-base_height)])
ShineDome();