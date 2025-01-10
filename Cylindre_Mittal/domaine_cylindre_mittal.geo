// Gmsh project created on Thu Jan 09 10:16:03 2025

h=5;
h1=0.001;

Point(1) = {50.0, 50.0, 0.0, h};
Point(2) = {50.0, 150.0, 0.0, h};
Point(3) = {350.0, 50.0, 0.0, h};
Point(4) = {350.0, 150.0, 0.0, h};

Point(5) = {100.0, 100.0, 0.0, h1};
Point(6) = {100.5, 100.0, 0.0, h1};
Point(7) = {99.5, 100.0, 0.0, h1};

Line(1) = {2, 1};
Line(2) = {1, 3};
Line(3) = {3, 4};
Line(4) = {4, 2};

Circle(5) = {7, 5, 6};
Circle(6) = {6, 5, 7};

Curve Loop(1) = {4, 1, 2, 3};
Curve Loop(2) = {6, 5};

Plane Surface(1) = {1, 2};
