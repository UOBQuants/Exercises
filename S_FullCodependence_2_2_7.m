clc; clear; close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  FULL CODEPENDENCE 2.2.7  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
J=10000; % number of simulation
N=10; % number of rondom variable
sigmasq=1;

U=rand(J,1); % Generate a J-by-1 column vector of uniformly distributed numbers in the interval (0,1).
X=[]; % initialize  random variable X ==> Gamma distributed Ga(n,1)
for n=1:N
    a=n/2; % shape parametrers
    b=2*sigmasq; % scale parameters
    X = [X gaminv(U,a,b)];% computes the inverse of the gamma cdf  
                          % with probabily U
                          % the inverse of the gamma is used to model uncertain quantities.
end