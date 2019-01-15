function [B] = calc_B_field(S,F,I)
%---------------------------------------------------
%  NAME:      BSmag_get_B.m
%  WHAT:      Calculates B at field points
%  INPUTS:
%    S          = Coil points gpuArray(Matrix)  [N x 3]
%    F          = Field points gpuArray(Matrix) [M x 3]
%    I          = Current through the coil
%
%  OUTPUTS:
%    B          = Magnetic field strength [T] (same dimensions as F)
%----------------------------------------------------

%mu0 = 4*pi*1e-7; % vacuum permeability [N/A^2]
M = size(F,1);   % number of points in the field
N = size(S,1);   % number of points in the coil
disp('Number of field points:');
disp(M);

disp('Number of Source Points:');
disp(N);
%D = gpuArray(zeros(N,3));  % stores dB for each point in S for one point in F [N x 3]
%B = gpuArray(zeros(M,3));  % the magnetic field matrix [M x 3]

D = zeros(N,3); % stores dB for each current source
B = zeros(M,3);
%debug = zeros(3,3);
%debug2 = zeros(3,3);
for P = 1:M
    for n = 1:N-1
        %debug2(1,:) = S(n,:);
        %debug2(2,:) = S(n,:);
        %debug2(3,:) = S(n,:);
        r = F(P,:)-S(n,:); %vector pointing from source to field point
        r_hat = r/(norm(r));
        %debug(1,:) = dr;
        r_sqr = (norm(r))^2;  
        %aproximation of infitesimal vector on the path
        dl = S(n+1,:)-S(n,:);
        %debug(2,:) = dl;
        b_vec = cross(dl,r_hat,2)/r_sqr; %dl x dr/r^2
        %debug(3,:) = b_vec;
        D(n,:) = b_vec;
        %quiver3(debug2(:,1),debug2(:,2),debug2(:,3),debug(:,1),debug(:,2),debug(:,3));
    end
    %disp(100*P/M);
    B(P,:) = -1*I*sum(D,1)/1e-7; %Aproxamation of the integral 
end 
    
    
         