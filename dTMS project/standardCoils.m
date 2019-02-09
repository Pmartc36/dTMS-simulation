sk = stlread("F:/Neuro/MIDA_v1.0/MIDA_v1_surfaces/Epidermis_Dermis.stl");
sk = sk.vertices;

[x2,y2,z2] = spiral_gen(250,-30,0,1000-1,0,150,50,"y");
[x1,y1,z1] = spiral_gen(375,-30,0,1000-1,0,50,50,"y");

S1 = [x1,y1,z1];
S1 = reshape(S1,999,3);
S2 = [x2,y2,z2];
S2 = reshape(S1,999,3);

a = linspace(-200,150,50);
b = linspace(-75,125,50);
[X,Z] = meshgrid(a,b);
Y = 265.*ones(50,50);
F = [X(:),Y(:),Z(:)];


B1 = calc_B_field(S1,F,100);
B2 = calc_B_field(S2,F,100);
B = B1+B2;
B_m = zeros(size(B,1),1);
for n= 1:size(B,1)
    B_m(n) = norm(B(n,:));
end

figure(1)
hold on
plot3(sk(:,1),sk(:,2),sk(:,3),'.');
plot3(x2,y2,z2,'.-black');
plot3(x1,y1,z1,'.-black');
hold off


a = linspace(-200,150,50);
b = linspace(-75,125,50);
[X,Z] = meshgrid(a,b);
Y = 265.*ones(50,50);
F = [X(:),Y(:),Z(:)];

figure(2)
hold on
markerSize = 100;
scatter3(F(:,1),F(:,2),F(:,3),markerSize,B_m,'filled');
caxis([0,10])
hold off