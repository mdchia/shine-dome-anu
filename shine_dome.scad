// Shine Dome ANU
// 08/02/17
// by Ming-Dao Chia
    
    
circle_resolution = 20;
module cylinders_empty(num, size){
    function angle(i,num)=i*(360/num);
    for(i=[1:num]){
        rotate([0,50,angle(i,num)])
        cylinder(h=500, r=size, center=true, $fn=circle_resolution);
    }
}

module shell(){
    difference(){
        sphere(40,center=true);
        cylinders_empty(16,5.5);
        sphere(39,center=true);
    }
}

module combo(){
    union(){
    shell();
        cylinder(h=60,r=25,center=true, $fn=circle_resolution);
    }
}

difference(){
    combo();
    translate([-50,-50,-74.5])
    cube([100,100,100]);
}

