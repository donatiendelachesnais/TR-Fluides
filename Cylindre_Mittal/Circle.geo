h=0.001;

Point(1) = {0.2, 0.2, 0.0, h};
Point(2) = {0.15, 0.2, 0.0, h};
Point(3) = {0.25, 0.2, 0.0, h};

Circle(1) = {2, 1, 3};
Circle(2) = {3, 1, 2};

Curve Loop(1) = {2, 1};

Plane Surface(1) = {1};
