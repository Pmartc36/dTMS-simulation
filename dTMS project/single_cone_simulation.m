% Initialize
clear all

[Xs,Ys,Zs] = spiral_gen(0,250,0,1000,5e-2,50,100);
S(:,1) = Xs;
S(:,2) = Ys;
S(:,3) = Zs;


nucleus_accumbens = stlread("F:/Neuro/MIDA_v1.0/MIDA_v1_surfaces/Nucleus Accumbens.stl");
%skin = stlread("F:/Neuro/MIDA_v1.0/MIDA_v1_surfaces/EpiDermis_Dermis.stl");
%grey_matter = stlread("F:/Neuro/MIDA_v1.0/MIDA_v1_surfaces/Brain Gray Matter.stl");
%F = [nucleus_accumbens.vertices; skin.vertices; grey_matter.vertices];
F = nucleus_accumbens.vertices;

figure(1)
hold on
plot3(Xs,Ys,Zs,'.-black');
plot3(F(:,1),F(:,2),F(:,3),'.');
hold off




% % Current going through the coil:
% I = 10;
% period = 10;
% conductivity = .2;
% 
% % Biot-Savart Integration
% B = calc_B_field(S,F,I);
% % Find induced current
% J = calc_J_field(B,period,conductivity);
% B_u = B;
% J_u = J;
% for n= 1:size(B,1)
%    B_u(n,:) =   B_u(n,:)/norm( B_u(n,:));
%    J_u(n,:) =   J_u(n,:)/norm( J_u(n,:));
% end
% 
% figure(2);
% hold on
% q = quiver3(F(:,1),F(:,2),F(:,3),B_u(:,1),B_u(:,2),B_u(:,3));
% plot3(Xs,Ys,Zs,'.-black');
% hold off
% 
% figure(3);
% hold on
% q = quiver3(F(:,1),F(:,2),F(:,3),J_u(:,1),J_u(:,2),J_u(:,3));
% plot3(Xs,Ys,Zs,'.-black');
% hold off
