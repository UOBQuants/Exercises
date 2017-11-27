% Exercise 2.2.6 - main
% *Author: Giuseppe Mascolo*
% Copula vs correlation

% close all; 
% clc; clear;

% input parameters
Mu=[1  -1]';   % exp values   
r=-0.0;        % rho - part of the off diagonal elemtents (r*s1*s2) look at 2.168 as example
sigmas=[1 1]'; % st. deviations 
nu=1;          % degree of freedom

%if we want a specific Sigma we just have to change sigmas and r
Sigma=diag(sigmas)*[1 r;r 1]*diag(sigmas);

%% compute and display results

%creates grid
GridSide1=[.05:.05:.95];
GridSide2=GridSide1;
NumGrid=length(GridSide1);

f_U=zeros(NumGrid); %in order to plot

%loop inside the grid
for j=1:NumGrid
    for k=1:NumGrid
        u=[GridSide1(j)
            GridSide2(k)];
        f_U(j,k)=TCopulaPDF(u,nu,Mu,Sigma); %function returns copula pdf
    end
end
    
figure
[G1,G2]=meshgrid(GridSide1,GridSide2); %creates 2D grid
surf(G1,G2,f_U)  %3D surface plot
xlabel('U_1')
ylabel('U_2')
zlabel('Copula pdf')

%increasing nu we can see how the copula pdf becames less flat.
%modifying r (rho) we can see how the copula pdf change.

%When we set r as 0 the offdiagonal elements of Sigma are null and from
%2.191 this means that the marginals are uncorrelated (when correlation
%defined, nu>2 ), but this does not imply independence, as we can see from 
%the copula pdf, which is not flat.
%When nu<2 correlation is not defined and the copula pdf is not flat, so we
%have no independence again.
