$fn = 90;

use <pi-doosje.scad>;

module bottom() {
    linear_extrude( height = 1 ) {
	outside();
    }
    linear_extrude( height = 1.5 ) {
	difference() {
	    inside();
	    offset( r = -1 ) inside();
	}
    }

    linear_extrude( height = 5 ) {
	holes()
	    circle( d = 6 );
    }

    // non-hole for power
    linear_extrude( height = 5 + BOARD_THICKNESS() - 0.5 ) {
	intersection() {
	    rand();
	    translate( [ 10.6 - 4.5, -5 ] ) square( [ 9, 10 ] ); 
	}
    }
    // non-hole for ethernet
    linear_extrude( height = 5 + BOARD_THICKNESS() ) {
	intersection() {
	    rand();
	    translate( [ 80, 10.25 - 8.5 ] ) square( [ 10, 17 ] ); 
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

difference() {
    bottom();
    union(){    
	holes() cylinder( d = 2, h = 10 );
	holes() cylinder( d1 = 5, d2 = 0, h = 2.5 );
    }
}


%translate( [ 0, 0, 5 ] ) linear_extrude( height = BOARD_THICKNESS() ) {
    difference() {
	pi();
	holes() circle( d = 2.5 );
    }
}
