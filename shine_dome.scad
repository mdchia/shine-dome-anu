// Shine Dome ANU
// 08/02/17
// by Ming-Dao Chia
    
    
circle_resolution = 30;
sphere_resolution = 30;

module cylinders_empty(num, size){
    function angle(i,num)=i*(360/num);
    for(i=[1:num]){
        rotate([0,50,angle(i,num)])
        cylinder(h=500, r=size, center=true, $fn=circle_resolution);
    }
}

module shell(){
    difference(){
        sphere(40,center=true, $fn=sphere_resolution);
        cylinders_empty(16,5.5);
        sphere(39,center=true, $fn=sphere_resolution);
    }
}

module combo(){
    union(){
    shell();
        cylinder(h=60,r=25,center=true, $fn=circle_resolution);
    }
}

module base(){
    difference(){
    cylinder(h=51,r=32,center=true, $fn=circle_resolution);
        translate([-50,-50,-78])
    cube([100,100,100]);
}
}

module ShineDome(){
    union(){
        base();
    difference(){
    combo();
    translate([-50,-50,-74.5])
    cube([100,100,100]);
        
}
}
}

translate([0,0,-22])
ShineDome();