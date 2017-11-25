close all;
clc; clear;

Mu=[0  0]';       % exp values
r=-.99999;            % correlation
sigmas=[1 1]';     % st. deviations

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Sigma=diag(sigmas)*[1 r;r 1]*diag(sigmas); % Covariance

GridSide1=[.05:.05:.95]; % evaluate copula at each value of the grid
GridSide2=GridSide1;
NumGrid=length(GridSide1); %lenght of the grid or number of values

F_U=zeros(NumGrid); %initalize the cdf(Matrice null 19*19 ) 

for j=1:NumGrid
    for k=1:NumGrid;

        u=[GridSide1(j)
            GridSide2(k)];
        
        % compute the quantile of our random variables X (follow a normal
        % distribution) ==> needed tocompute the cdf of the copula

        x=norminv(u,Mu,sigmas); % computes the inverse of the standard normal cdf (= Quantile)
                                %using the corresponding mean mu and standard deviation sigmas at 
                                %the corresponding probabilities in u
        
        %Formula to represente the copula of the random variable X in term of cdf (see 2.31)   
        
        F_U(j,k) = mvncdf(x,Mu,Sigma); %returns the cumulative probability of the multivariate normal
                                       %distribution with mean mu and covariance SIGMA, evaluated at 
                                       %each row of X
                                       

    end
end

% Graph the cdf copula

[G1,G2]=meshgrid(GridSide1,GridSide2);
surf(G1,G2,F_U')
xlabel('U_1')
ylabel('U_2')
zlabel('Copula cdf')

