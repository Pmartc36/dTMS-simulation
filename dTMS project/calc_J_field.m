function [J] = calc_J_field(B,I_f,sigma)
%---------------------------------------------------
%  NAME:      calc_J_field.m
%  WHAT:      Calculates Current from the Magnetic Field
%             using Faradays law of induction and Ohm's Law
%  INPUTS:
%    B          = Magnetic Field [T]  [M x 3]
%    I_f        = Pulse duration           [ms]
%    Sigma      = Conductivity of the Field points [1/Ohms]
%  OUTPUTS:
%    J1          = Current Density [I/m^2] 
%----------------------------------------------------



% E store the electromotive force at each of the field points
% dB/dt ~= delta B / delta t
E = -1*B/(I_f/1000);  %[V]

%J = sigma E
%note that since B is in Teslas its as if we multiplied through by m^2
% so this equation is actually I = sigma * R
J = sigma*E;








