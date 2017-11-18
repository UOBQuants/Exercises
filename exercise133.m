N=30; %matrix dimension
Nsimul = 10000; %number of simulations
A = rand(N);    % NxN random matrix
sigma = A' * A; % creates a symmetric positive matrix sigma
mu = rand(N,1); % N-dim vetor mu

%we generate Nsimul simulations of a normal distribution with:
%location mu vector of zeros, covariance matrix = identity
Y = mvnrnd(zeros(N,1),eye(N),Nsimul); 

%we know that the normal multivariate distribution is spherically
%symmetric so from (2.259) R=||Y|| and U= Y/||Y||
%{with sum(X,2) we sum the rows elements of X instead of the column ones}
R = sqrt(sum(Y.*Y,2));     % R=||Y|| appear to be a radial distribution 
                           % (that in our normal case is the square root 
                           % of chi-square with N degrees of freedom)
                           % [remember that a chi square is the sum of
                           % squared normal distributions]
                           
U = Y./(R*ones(1,N));      % U= Y/||Y|| uniform distribution on unit sphere
