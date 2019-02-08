[x1,y1,z1] = spiral_gen(60,250,0,500-1,0,50,100,"x");
[x2,y2,z2] = spiral_gen(60,250,0,500-1,0,75,100,"x");

[x3,y3,z3] = spiral_gen(-170,250,0,500-1,0,50,100,"x");
[x4,y4,z4] = spiral_gen(-170,250,0,500-1,0,75,100,"x");

[x5,y5,z5] = spiral_gen(375,-30,0,500-1,0,50,100,"y");
[x6,y6,z6] = spiral_gen(375,-30,0,500-1,0,75,100,"y");

phi = 35*pi/180;
xRot = [[1,0,0],[0,cos(phi),sin(phi)],[0,-1*sin(phi),cos(phi)]];
xRot = reshape(xRot,3,3);
for i = 1: 500
    v = [x5(i),y5(i),z5(i)];
    w = [x6(i),y6(i),z6(i)];
    nv = v * xRot;
    nw = w * xRot;
    x5(i) = nv(1);
    y5(i) = nv(2)+50;
    z5(i) = nv(3)+150;
    x6(i) = nw(1);
    y6(i) = nw(2)+50;
    z6(i) = nw(3)+150;
end

Dx = [x3];
Dx = reshape(Dx,size(Dx,2),1);
Dy = [y3];
Dy = reshape(Dy,size(Dy,2),1);
Dz = [z3];
Dz = reshape(Dz,size(Dz,2),1);

Cx = [x4];
Cx = reshape(Cx,size(Cx,2),1);
Cy = [y4];
Cy = reshape(Cy,size(Cy,2),1);
Cz = [z4];
Cz = reshape(Cz,size(Cz,2),1);

S1 = [Cx;Cy;Cz];
S1 = reshape(S1,size(Cx,1),3);
S2 = [Dx;Dy;Dz];
S2 = reshape(S2,size(Dx,1),3);

a = linspace(-200,150,50);
b = linspace(-75,125,50);
[X,Z] = meshgrid(a,b);
Y = 265.*ones(50,50);

dL1 = diff(S1,1);
dL2 = diff(S2,1);

x = sym('x');
y = sym('y');
z = sym('z');
D1 = sym(dL1);
R1 = repmat(i,size(D1,1),1) - D1;


