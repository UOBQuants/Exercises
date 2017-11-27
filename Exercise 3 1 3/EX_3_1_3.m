%% Info
% *Author: Ashley Robertson*
% *Excerise: 3.1.3 Meucci*

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clean up workspace
clear; close all;  clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% define input parameters

mu=.05;
a=.45;
b=.5;
s=.03;
T=10^3;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z=randn(T,1);
s2=s^2;
for t=1:T-1
    s2(t+1)=s^2+a*s2(t)+b*(z(t)^2);
    eps(t+1)=mu+sqrt(s2(t+1))*z(t+1);
end

figure
plot(eps);
title('GARCH(1,1) process vs. time')
%The invariants are the shocks in the volatility, which also directly drive
%the randomness of the process. 
%%
% *Notice that these invariants are not directly
% %measurable.*
