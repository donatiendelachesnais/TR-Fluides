// Gmsh project created on Wed Mar 13 15:17:41 2024
h=5;
h2=0.001;

H=100;
L=300;

x0=50;
y0=50;
r=0.5;


Point(1) = {0.0, 0.0, 0.0, h};
Point(2) = {0.0, H, 0.0, h};
Point(3) = {L, H, 0.0, h};
Point(4) = {L, 0.0, 0.0, h};

Point(5) = {x0, y0, 0.0, h2};
Point(6) = {x0-r, y0, 0.0, h2};
Point(7) = {x0+r, y0, 0.0, h2};

Line(1) = {2, 3};
Line(2) = {3, 4};
Line(3) = {4, 1};
Line(4) = {1, 2};

Circle(5) = {6, 5, 7};
Circle(6) = {7, 5, 6};

Curve Loop(1) = {1, 2, 3, 4};
Curve Loop(2) = {6, 5};

Plane Surface(1) = {1, 2};
