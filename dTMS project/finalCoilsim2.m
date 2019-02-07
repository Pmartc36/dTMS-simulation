% Initialize
clear all

[x1,y1,z1] = spiral_gen(60,250,0,500-1,0,75,100,"x");
[x2,y2,z2] = spiral_gen(60,250,0,500-1,0,100,100,"x");

[x3,y3,z3] = spiral_gen(-170,250,0,500-1,0,75,100,"x");
[x4,y4,z4] = spiral_gen(-170,250,0,500-1,0,100,100,"x");

[x5,y5,z5] = spiral_gen(375,-30,0,500-1,0,75,100,"y");
[x6,y6,z6] = spiral_gen(375,-30,0,500-1,0,100,100,"y");

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

Dx = [x1,x3];
Dx = reshape(Dx,size(Dx,2),1);
Dy = [y1,y3];
Dy = reshape(Dy,size(Dy,2),1);
Dz = [z1,z3];
Dz = reshape(Dz,size(Dz,2),1);

Cx = [x2,x4];
Cx = reshape(Cx,size(Cx,2),1);
Cy = [y2,y4];
Cy = reshape(Cy,size(Cy,2),1);
Cz = [z2,z4];
Cz = reshape(Cz,size(Cz,2),1);

S2 = [Cx;Cy;Cz];
S2 = reshape(S2,size(Cx,1),3);
S1 = [Dx;Dy;Dz];
S1 = reshape(S1,size(Dx,1),3);

a = linspace(-200,150,50);
b = linspace(-75,125,50);
[X,Z] = meshgrid(a,b);
Y = 265.*ones(50,50);



F = [X(:),Y(:),Z(:)];


i1 = 100;
i2 = -99;

% 
% % Biot-Savart Integration
B1 = calc_B_field(S1,F,i1);
B2 = calc_B_field(S2,F,i2);
B = B1+B2;
B_u = B;
B_m = zeros(size(B,1),1);
for n= 1:size(B,1)
    B_u(n,:) = B_u(n,:)/norm( B_u(n,:));
    B_m(n) = norm(B(n,:));
end


na = stlread("F:/Neuro/MIDA_v1.0/MIDA_v1_surfaces/Nucleus Accumbens.stl");
am = stlread("F:/Neuro/MIDA_v1.0/MIDA_v1_surfaces/Amygdala.stl");
ht = stlread("F:/Neuro/MIDA_v1.0/MIDA_v1_surfaces/Hypothalamus.stl");
sk = stlread("F:/Neuro/MIDA_v1.0/MIDA_v1_surfaces/Epidermis_Dermis.stl");

na = na.vertices;
am = am.vertices;
ht = ht.vertices;
sk = sk.vertices;

figure(1);
hold on
markerSize = 100;
scatter3(F(:,1),F(:,2),F(:,3),markerSize,B_m,'filled');
plot3(na(:,1),na(:,2),na(:,3),'.');
plot3(am(:,1),am(:,2),am(:,3),'.');
plot3(ht(:,1),ht(:,2),ht(:,3),'.');
%plot3(sk(:,1),sk(:,2),sk(:,3),'.');
colorbar
caxis([0 10])
%plot3(S1(:,1),S1(:,2),S1(:,3),'.black');
%plot3(S2(:,1),S2(:,2),S2(:,3),'.blue');
hold off
