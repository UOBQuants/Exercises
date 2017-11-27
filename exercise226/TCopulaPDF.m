function F_U = TCopulaPDF(u,nu,Mu,Sigma)
% this function computes the pdf of the copula of the t distribution
% at the generic point u in the unit hypercube
% see formula 2.30
% we need the joint distribution of X as numerator
% and product of marginal distributions as denominator

N=length(u);         % dimension of the hypercube
s=sqrt(diag(Sigma)); % st. deviations 

x=Mu+s.*tinv(u,nu);  %from uniform we generate a t sample with the 
                     %inverse of t cdf, tinv considers mu=0 and s=1
                     %so we need to rescale

%numerator is the joint distribution of a t multivariate variable from 2.188
z2=(x-Mu)'*inv(Sigma)*(x-Mu);
K=(nu*pi)^(-N/2) * gamma((nu+N)/2)/gamma(nu/2) * (  (det(Sigma))^(-.5) );
Numerator = K*(1+z2/nu)^(-(nu+N)/2);

%denominator is the product of marginal distributions
fs=tpdf((x-Mu)./s,nu)./s;  %returns values of the tStudent pdf at x 
                           %tpdf consider a tStudent with mu=0 and s=1
                           %so we need to rescale
Denominator = prod(fs);

F_U = Numerator/Denominator; %copula pdf as in 2.30


