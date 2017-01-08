$fn = 90;

function BOARD_THICKNESS() = 1.4;

module pi() {
    offset( r = 3 ) offset( r = -3 ) square( [ 85, 56 ] );
}
module holes() {
    translate( [ 3.5     , 3.5     , 0 ] ) children();
    translate( [ 3.5 + 58, 3.5     , 0 ] ) children();
    translate( [ 3.5     , 3.5 + 49, 0 ] ) children();
    translate( [ 3.5 + 58, 3.5 + 49, 0 ] ) children();
}

module inside() {
    offset( r = 0.5 ) {
	square( [ 85, 56 ] );
	// clearance for hdmi and audio
	translate( [ 23, -3 ] )
	    square( [ 85-23, 5 ] );
	// clearance for usb
	translate( [ 83, 21 ] )
	    square( [ 5, 35 ] );
	// clearance for sdcard
	translate( [ -3, 0 ] ) 
	    square( [ 5, 56 ] );
    }
}
module outside() {
    offset( r = 1 ) inside();
}
module rand() {
    difference() {
	outside();
	inside();
    }
}

