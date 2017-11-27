function F_U = LognormalCopulaPDF(u,Mu,Sigma)
% this function computes the pdf of the copula of the lognormal distribution
% at the generic point u in the unit hypercube
% see formula 2.30
% we need the joint distribution of X as numerator
% and product of marginal distributions as denominator

N=length(u);         % dimension of the hypercube
s=sqrt(diag(Sigma)); % st. deviations 

x=logninv(u,Mu,s);   %from uniform we generate a lognormal sample with the 
                     % inverse of lognormal cdf

%numerator is the joint distribution of a lognormal multivariate variable as defined in 2.213 and 2.156                  
Numerator = (2*pi)^(-N/2) * (  (det(Sigma))^(-.5) ) /prod(x) * exp(-.5*(log(x)-Mu)'*inv(Sigma)*(log(x)-Mu));

%denominator is the product of marginal distributions
fs=lognpdf(x,Mu,s); %returns values of the lognormal pdf at x 
Denominator = prod(fs);

F_U = Numerator/Denominator; %copula pdf as in 2.30


