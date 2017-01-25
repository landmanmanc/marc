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

rounding = 3;

module inside() {
    offset( r = 0.5 ) {
        square( [ 85, 56 ] );
        // clearance for hdmi and audio
        offset( r = rounding ) offset( r = -rounding ) translate( [ 23, -3 ] )
            square( [ 85-23, 25 ] );
        translate( [ 23, -3 ] )
            square( [ 65-23, 25 ] );
        // clearance for usb
        offset( r = rounding ) offset( r = -rounding ) translate( [ 63, 21 ] )
            square( [ 25, 35 ] );
        translate( [ 63, 21 ] )
            square( [ 25, 30 ] );
        // clearance for sdcard
        offset( r = rounding ) offset( r = -rounding ) translate( [ -3, 0 ] ) 
            square( [ 25, 56 ] );
    }
}
module outside() {
    offset( r = 1.5 ) inside();
}
module rand() {
    difference() {
	outside();
	inside();
    }
}

rand();
holes() circle( d = 2.5 );