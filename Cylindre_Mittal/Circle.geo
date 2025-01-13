h=0.01;

x0=50;
y0=50;
r=0.5;

Point(1) = {x0, y0, 0.0, h};
Point(2) = {x0-r, y0, 0.0, h};
Point(3) = {x0+r, y0, 0.0, h};

Circle(1) = {2, 1, 3};
Circle(2) = {3, 1, 2};

Curve Loop(1) = {2, 1};

Plane Surface(1) = {1};
