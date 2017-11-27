% Exercise 2.2.3 - main
% *Author: Giuseppe Mascolo*
% Logonrmal copula pdf

close all; 
clc; clear;

% input parameters
Mu=[1  -1]';   % exp values   
r=0.7;              % correlation
sigmas=[1 1]';   % st. deviations 
nu=1;               % degree of freedom

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
        f_U(j,k)=LognormalCopulaPDF(u,Mu,Sigma); %function returns copula pdf
    end
end
    

[G1,G2]=meshgrid(GridSide1,GridSide2); %creates 2D grid
surf(G1,G2,f_U)  %3D surface plot
xlabel('U_1')
ylabel('U_2')
zlabel('Copula pdf')
