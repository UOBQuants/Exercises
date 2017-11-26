%% Info
% Date: 20 Nov 2017
% Auther : Ashley robertson
% Exercise 2.1.2 of Meucci

%% Clearing Data
clc; clear; close all
%% Input Variables
mu1 = 0;
mu2 = 0;

sig1 = 1;
sig2 = 1;

%% Creating LogNormal Dists and saving correlations and conditional ratios

Correlation = [];
Rho = [];
CR = []; % Create empty arrays

Mu = [mu1 ; mu2];

for rho = -.99 : 0.01 : 0.99
    Sigma = [ sig1^2 , rho*sig1*sig2 ; rho*sig1*sig2 , sig2^2];
    % Constructing Sigma based on rho
    [E,Cova,sd,cor] = LogNormalParam2Statistics(Mu,Sigma);
    % Obtaining the statistics of the Lognormal Distribution
    
    Correlation = [Correlation , cor(1,2)]; 
    Rho = [Rho , rho];
    
    Lambda = eig(cor);
    CR = [CR , min(Lambda)/max(Lambda)]; %Calculating conditional ratio
end

%% Ploting the Conditional Ratio and correlation graphs
figure
plot(Rho, Correlation)
ylim([-1 1])
grid on
xlabel('\rho')
ylabel('correlation')

figure
plot(Rho, CR)
ylim([0 1])
grid on
xlabel('\rho')
ylabel('Condition Ratio')


