
%Technique of expressing central Moment in term of raw moment

% why ==> It turns out that when we are dealing with moments it is so much
% easier to operate in term of raw moments than it is of term of central
% moment

% the formula is : see (25) in Meucci exercice 1.7 (In the formula we use
% the binomial expension define as nchoosek(n,k)
% nchoosek(n,k) : returns the binomial coefficient, defined as n!/((n–k)! k!).

%Note that the O Moment =1 & the first moment = 0

%function mu=Raw2Central(mu_)


mu_=[10,20,1,2]; % [vector] (length N corresponding to order N) corresponding raw moments
N=length(mu_);
mu=mu_; % [vector] (length N corresponding to order N) central moments


for n=2:N  
    mu(n) = ((-1)^n) * (mu_(1))^(n);
    for k=1:n-1
        mu(n) =  mu(n) + nchoosek(n,k) * ((-1)^(n-k)) * mu_(k) * (mu_(1))^(n-k);
    end
    mu(n) = mu(n)+ mu_(n);
    
end

%additional comments :
% the third moment provides a measure of symmetry of the distribution :
% skeyness
%- The fourth moment provides a measure of the relative weight of tails call the kurtosis
% large kurtosis implies that the distribution dispay fat tails
