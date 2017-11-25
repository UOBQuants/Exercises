clc; clear; close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% input parameters

% X1 & X2 follow a normal distribution ==> Mu = 0 & Variance =1
Mu=[0 0]';
s=[1 1];
rhos=[-.99 : .01 : .99]; % Coefficient of correlation 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for n=1:length(rhos) % Return the size of the dimension rhos (here 199)
    rho=rhos(n);
    Sigma=[s(1)^2     rho*s(1)*s(2)
        rho*s(1)*s(2)    s(2)^2];

    Covariance=Sigma;
    Standard_Deviation=sqrt(diag(Covariance));
    
    %diag(1./Standard_Deviation)*Covariance*diag(1./Standard_Deviation); % definition correlation 2.133
    %Cs(n)=Correlation(1,2); % If you use the definition 2.133
    
    Correlation=rho; % definition correlation 2.169
    Cs(n)=Correlation(1,1);
    
    % Condition Number
    Lambda=eig(Covariance);
    CRs(n)=min(Lambda)/max(Lambda); % Formulae 4.115
end

figure

subplot(2,1,1)
plot(rhos,Cs)
ylim([-1 1])
grid on
xlabel('\rho')
ylabel('correlation')

% Exactly –1. A perfect downhill (negative) linear relationship
% –0.70. A strong downhill (negative) linear relationship
%  –0.50. A moderate downhill (negative) relationship
%  –0.30. A weak downhill (negative) linear relationship
%  0. No linear relationship
% +0.30. A weak uphill (positive) linear relationship
% +0.50. A moderate uphill (positive) relationship
% +0.70. A strong uphill (positive) linear relationship
%  Exactly +1. A perfect uphill (positive) linear relationship


subplot(2,1,2)
plot(rhos,CRs)
ylim([0 1])
grid on
xlabel('\rho')
ylabel('condition ratio')

% The condition number enable you to study how a change will impact
% our variables
% The condition number range is [0,1]. When the number is close to one the
% invariants X are well conditioned, on the other hand if the condition
% number is close to 0, it is ill conditionned ( this case happen in highly
% correlated market)