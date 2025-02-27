// Gmsh project created on Wed Mar 13 15:17:41 2024
h=0.1;
h2=0.002;

L=16.5;
H=13.1;
l=6.2;


x0=L/2;
y0=H/2;
r=0.04445;
D=0.45;
z0=l/2;
Rsurr=1.5;
R=Rsurr*r;
e=0.01;

theta=0.2617993877991494;


Point(5) = {x0, y0, z0-D/2, h};
Point(6) = {x0-r, y0, z0-D/2, h2};
Point(7) = {x0, y0+-r, z0-D/2, h2};

Point(12) = {x0, y0, z0+D/2, h};
Point(13) = {x0-r, y0, z0+D/2, h2};
Point(14) = {x0, y0-r, z0+D/2, h2};

Point(16) = {x0-R, y0, z0+D/2, h2};
Point(17) = {x0, y0-R, z0+D/2, h2};

Point(18) = {x0, y0, z0+D/2+r*e, h};
Point(19) = {x0-R, y0, z0+D/2+r*e, h2};
Point(20) = {x0, y0-R, z0+D/2+r*e, h2};

Point(22) = {x0-R, y0, z0-D/2, h2};
Point(23) = {x0, y0-R, z0-D/2, h2};

Point(24) = {x0, y0, z0-D/2-r*e, h};
Point(25) = {x0-R, y0, z0-D/2-r*e, h2};
Point(26) = {x0, y0-R, z0-D/2-r*e, h2};
Point(27) = {x0, y0+r, z0-D/2, h2};
Point(28) = {x0+r, y0, z0-D/2, h2};
Point(29) = {x0, y0+r, z0+D/2, h2};
Point(30) = {x0+r, y0, z0+D/2, h2};
Point(31) = {x0, y0+R, z0+D/2, h2};
Point(32) = {x0+R, y0, z0+D/2, h2};
Point(33) = {x0, y0+R, z0+D/2+r*e, h2};
Point(34) = {x0+R, y0, z0+D/2+r*e, h2};
Point(35) = {x0, y0+R, z0-D/2, h2};
Point(36) = {x0+R, y0, z0-D/2, h2};
Point(37) = {x0, y0+R, z0-D/2-r*e, h2};
Point(38) = {x0+R, y0, z0-D/2-r*e, h2};

Point(39) = {L/2, H/2, l/2, h};

// Cylindre interne pour déraffiner le maillage
Point(40) = {x0 + (r-e), y0, z0 - D/2, h};
Point(41) = {x0, y0 + (r-e), z0 - D/2, h};
Point(42) = {x0 - (r-e), y0, z0 - D/2, h};
Point(43) = {x0, y0 - (r-e), z0 - D/2, h};
Point(44) = {x0 + (r-e), y0, z0 + D/2, h};
Point(45) = {x0, y0 + (r-e), z0 + D/2, h};
Point(46) = {x0 - (r-e), y0, z0 + D/2, h};
Point(47) = {x0, y0 - (r-e), z0 + D/2, h};


Rotate {{1, 0, 0}, {x0, y0, z0}, Pi/2} {
    Point{5, 6, 7, 12, 13, 14, 16, 17, 18, 19, 20, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 40, 41, 42, 43, 44, 45, 46, 47};
}

Rotate {{0, 0, 1}, {x0, y0, z0}, theta} {
    Point{5, 6, 7, 12, 13, 14, 16, 17, 18, 19, 20, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 40, 41, 42, 43, 44, 45, 46, 47};
}

Circle(5) = {6, 5, 7};
Circle(6) = {7, 5, 6};

Circle(11) = {13, 12, 14};
Circle(12) = {14, 12, 13};

Line(17) = {6, 13};
Line(18) = {28, 30};

Circle(21) = {19, 18, 20};
Circle(22) = {20, 18, 19};

Line(23) = {16, 19};

Circle(27) = {25, 24, 26};
Circle(28) = {26, 24, 25};

Line(29) = {22, 25};

//+
Circle(31) = {37, 24, 38};
Circle(32) = {35, 5, 36};
Circle(33) = {38, 24, 26};
Circle(34) = {36, 5, 23};
Circle(35) = {25, 24, 37};
Circle(36) = {22, 5, 35};
Circle(37) = {7, 5, 28};
Circle(38) = {28, 5, 27};
Circle(39) = {6, 5, 27};
Circle(40) = {13, 12, 29};
Circle(41) = {29, 12, 30};
Circle(42) = {14, 12, 30};
Circle(43) = {33, 18, 34};
Circle(44) = {31, 12, 32};
Circle(45) = {33, 18, 19};
Circle(46) = {31, 12, 16};
Circle(47) = {20, 18, 34};
Circle(48) = {16, 12, 17};
Circle(49) = {32, 12, 17};
Circle(50) = {22, 5, 23};

Line(51) = {34, 32};
Line(52) = {36, 38};
Line(53) = {7, 14};
Line(54) = {27, 29};

Line(55) = {17, 20};
Line(56) = {31, 33};
Line(57) = {37, 35};
Line(58) = {26, 23};

Circle(59) = {40, 5, 41};
Circle(60) = {41, 5, 42};
Circle(61) = {42, 5, 43};
Circle(62) = {43, 5, 40};

Circle(63) = {44, 12, 45};
Circle(64) = {45, 12, 46};
Circle(65) = {46, 12, 47};
Circle(66) = {47, 12, 44};

Line(67) = {40, 44};
Line(68) = {41, 45};
Line(69) = {42, 46};
Line(70) = {43, 47};



Curve Loop(7) = {47, -43, 45, 21};
//+
Plane Surface(7) = {7};
//+
Curve Loop(8) = {11, 42, -41, -40};
//+
Curve Loop(9) = {49, -48, -46, 44};
//+
Plane Surface(8) = {8, 9};
//+
Curve Loop(10) = {5, 37, 38, -39};
//+
Curve Loop(11) = {50, -34, -32, -36};
//+
Plane Surface(9) = {10, 11};
//+
Curve Loop(12) = {27, -33, -31, -35};
//+
Plane Surface(10) = {12};

//+
Curve Loop(14) = {54, -40, -17, 39};
//+
Surface(11) = {14};
//+
Curve Loop(15) = {41, -18, 38, 54};
//+
Surface(12) = {15};
//+
Curve Loop(16) = {37, 18, -42, -53};
//+
Surface(13) = {16};
//+
Curve Loop(17) = {5, 53, -11, -17};
//+
Surface(14) = {17};
//+
//+
//+
Curve Loop(18) = {35, 57, -36, 29};
//+
Surface(15) = {18};
//+
Curve Loop(19) = {31, -52, -32, -57};
//+
Surface(16) = {19};
//+
Curve Loop(20) = {33, 58, -34, 52};
//+
Surface(17) = {20};
//+
Curve Loop(21) = {27, 58, -50, 29};
//+
Surface(18) = {21};
//+
Curve Loop(22) = {44, -51, -43, -56};
//+
Surface(19) = {22};
//+
Curve Loop(23) = {56, 45, -23, -46};
//+
Surface(20) = {23};
//+
Curve Loop(24) = {48, 55, -21, -23};
//+
Surface(21) = {24};
//+
Curve Loop(25) = {49, 55, 47, 51};
//+
Surface(22) = {25};

// Cylindre intérieur
Curve Loop(26) = {59, 60, 61, 62};
Plane Surface(26) = {26};

Curve Loop(27) = {63, 64, 65, 66};
Plane Surface(27) = {27};

Curve Loop(28) = {61, 70, -65, -69};
Surface(28) = {28};

Curve Loop(29) = {70, 66, -67, -62};
Surface(29) = {29};

Curve Loop(30) = {59, 68, -63, -67};
Surface(30) = {30};

Curve Loop(31) = {60, 69, -64, -68};
Surface(31) = {31};

Surface Loop(1) = {13, 9, 14, 8, 12, 11, 19, 22, 21, 7, 20, 15, 10, 18, 17, 16};
Surface Loop(2) = {26, 27, 28, 29, 30, 31};

Volume(3) = {1, 2};
