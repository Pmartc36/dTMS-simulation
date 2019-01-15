function [x,y,z] = spiral_gen(x0,y0,z0,points,u,r0,h)
%points is number of points
%u is a constant that determines the distance between wraps
%r0 is a constant that determines the smallest part of the spiral
%n is number loops
%h is height
%omega is a constant that determines how many windings the spiral will have
%phi0 is a constant that deterimines which angle the spiral starts
t = 0:points;
omega = h/(points*2);
r = r0 + u * t;
phi = -omega*t;

z = r .* cos(phi)+z0;
y = r .* sin(phi)+y0;
x = omega*t+x0;
end

