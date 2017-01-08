$fn = 90;

use <pi-doosje.scad>;

module top() {
    // vlak
    translate( [ 0, 0, 24 ] )
    linear_extrude( height = 1 ) {
	outside();
    }
    translate( [ 0, 0, 5 + BOARD_THICKNESS() ] )
    linear_extrude( height = 20 - BOARD_THICKNESS() ) {
	holes() difference() {
	    circle( d = 6 );
	    circle( d = 2 );
	}
    }
    translate( [ 0, 0, 1 ] )
    difference() {
	linear_extrude( height = 24 ) rand();
	power_hole();
	ether_hole();
    }

    // non-hole for power
    module power_hole() {
	linear_extrude( height = 5 + 5 ) {
	    intersection() {
		rand();
		translate( [ 10.6 - 4.5, -5 ] ) square( [ 9, 10 ] ); 
	    }
	}
    }
    // non-hole for ethernet
    module ether_hole() {
	linear_extrude( height = 5 + 15 ) {
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

rotate( [ 180, 0, 0 ] ) translate( [ 0, 0, -25 ] ) top();



%translate( [ 0, 0, 5 ] ) linear_extrude( height = BOARD_THICKNESS() ) {
    difference() {
	pi();
	holes() circle( d = 2.5 );
    }
}
