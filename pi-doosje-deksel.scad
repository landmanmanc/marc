$fn = 90;

use <pi-doosje.scad>;

module top() {
    // vlak
    translate( [ 0, 0, 25 - 1.5 ] )
        linear_extrude( height = 1.5 ) {
            outside();
        }
    
    translate( [ 0, 0, 5 + BOARD_THICKNESS() ] ) {
        linear_extrude( height = 25 - 5 - BOARD_THICKNESS() ) {
            holes() difference() {
                circle( d = 6 );
                circle( d = 2 );
            }
        }
    }
    
    translate( [ 0, 0, 25 - 5 ] ) {
        linear_extrude( height = 5 ) {
            translate( [ -5, 3.5 - 1 ] ) square( [ 58 + 8, 2 ] );
            translate( [ -5, 3.5 + 49 - 1 ] ) square( [ 58 + 8 , 2 ] );
            translate( [ -5, ( 3.5 - 1 + 3.5 + 49 - 1 ) / 2 ] ) square( [ 58 + 8, 2 ] );

            translate( [ 3.5 - 1, -2 ] ) square( [ 2, 56 + 4 ] );
            translate( [ 3.5 + 58 - 1, -5 ] ) square( [ 2, 56 + 6 ] );
        }
    }

    
    translate( [ 0, 0, 1.5 ] )
    difference() {
        linear_extrude( height = 25 - 1.5 ) 
            rand();
    #    power_hole();
    #    ether_hole();
    }

    // non-hole for power
    module power_hole() {
	linear_extrude( height = 5 + 5 - 1.5 ) {
	    intersection() {
		rand();
		translate( [ 10.6 - 4.5, -5 ] ) square( [ 9, 10 ] ); 
	    }
	}
    }
    // non-hole for ethernet
    module ether_hole() {
	linear_extrude( height = 5 + 14 - 1.5 ) {
	    intersection() {
		rand();
		translate( [ 80, 10.25 - 8.5 ] ) square( [ 10, 17 ] ); 
	    }
	}
    }
}

/*
// hole for sd card 
linear_extrude( height = 3 ) {
    intersection() {
	rand();
	translate( [ -5, 21 ] ) square( [ 10, 14 ] );
    }
}
*/

rotate( [ 180, 0, 0 ] ) translate( [ 0, 0, -25 ] ) 
top();



*%translate( [ 0, 0, 5 ] ) linear_extrude( height = BOARD_THICKNESS() ) {
    difference() {
	pi();
	holes() circle( d = 2.5 );
    }
}
