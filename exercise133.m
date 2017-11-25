%% Exercise 1.3.3 Elliptical variables: radial-uniform representation
% author: Giuseppe Mascolo
% Generate 10,000 simulation from a 30-dimensional elliptical random
% varible X = mu + R*A*U

N=30; %matrix dimension
Nsimul = 10000; %number of simulations

%% We need A in order to generate a simulation
A = rand(N);    % NxN random matrix
sigma = A' * A; % creates a symmetric positive matrix sigma
mu = rand(N,1); % N-dim vetor mu

%% We need U in order to generate a simulation
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

%% We now need R 
%from exercise R is lognormal with given nu and tau square 
nu = 0.1;
tau2 = 0.04;
tau = sqrt(tau2);
R_New = lognrnd(nu,tau,Nsimul,1); %generates lognormal simulations

%% We can now generate N-variate elliptical distribution simulations
X = ones(Nsimul,1)*mu' + (R_New*ones(1,N)).*(U*A');   % (as defined)

%% plots

% visualize projection on m-n coordinates
m=1;
n=3;
figure
plot(X(:,m),X(:,n),'.')
axis equal
grid on
xlabel(sprintf('X_%d',m))
ylabel(sprintf('X_%d',n))

% visualize n-th marginal
n=4;
NumBins=round(10*log(NumSimul));
figure
hist(X(:,n),NumBins);
grid on
xlabel(sprintf('X_%d',n))




