mooncake_radius = 40;
height = 2;

module taiji() {
    r = mooncake_radius * 0.4;
    large_circle_radius = r;
    small_circle_radius = r / 2;
    
    // 外圆轮廓
    linear_extrude(height = height) {
        difference(){
            circle(r = large_circle_radius);
            circle(r = large_circle_radius-0.4);
        }
    }
    
    // 左半圆（绿色）
    color("green",0.5) 
    linear_extrude(height = height) {
        translate([0, -small_circle_radius])
        intersection() {
            circle(r = small_circle_radius);
            translate([-small_circle_radius, 0])
            square([small_circle_radius * 2, small_circle_radius * 2], center = true);
        }
        // 大圆的后半部分
       
    }
    
    // 右半圆（红色）
    color("red",0.5)
    linear_extrude(height = height+0.1) {
        translate([0, small_circle_radius])
        intersection() {
            circle(r = small_circle_radius);
            translate([small_circle_radius, 0])
            square([small_circle_radius * 2, small_circle_radius * 2], center = true);
        }
    }
    linear_extrude(height = height) {
         intersection() {
            circle(r = large_circle_radius);
            translate([large_circle_radius, 0])
            square([large_circle_radius * 2, large_circle_radius * 2], center = true);
        }
    }
}

taiji();