// Gmsh project created on Wed Mar 13 15:17:41 2024
h=0.01;
h2=0.001;

Point(1) = {0.0, 0.0, 0.0, h};
Point(2) = {0.0, 0.41, 0.0, h};
Point(3) = {2.2, 0.41, 0.0, h};
Point(4) = {2.2, 0.0, 0.0, h};

Point(5) = {0.2, 0.2, 0.0, h2};
Point(6) = {0.15, 0.2, 0.0, h2};
Point(7) = {0.25, 0.2, 0.0, h2};

Line(1) = {2, 3};
Line(2) = {3, 4};
Line(3) = {4, 1};
Line(4) = {1, 2};

Circle(5) = {6, 5, 7};
Circle(6) = {7, 5, 6};

Curve Loop(1) = {1, 2, 3, 4};
Curve Loop(2) = {6, 5};

Plane Surface(1) = {1, 2};
