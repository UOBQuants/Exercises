%% Info
% *Author: Ashley Robertson*
% *Excerise: 1.1.4 Meucci*

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clean up workspace
clear; close all;  clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% define input parameters
n = 10000;
meu_t=0;
sigma2_t=.1;
df_t=8;  % NOTE: see how the final results change if you increase nu (=4 is enough)

meu_L=.1;
sigma2_L=.2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% generate Student sample with above parameters

z = -1: 0.01 : 3; 
pdfX = pdf('tLocationScale', z, meu_t, sqrt(sigma2_t), df_t);
pdfY = pdf('Lognormal', z, meu_L, sqrt(sigma2_L)); 
pdfZ = pdfX + pdfY; 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% generate plot of adding the pdf's

figure
plot(z,pdfZ)
title('Literal addition of pdfs of X and Y')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% generate plot of samples
pdX = makedist('tLocationScale', 0, sqrt(0.1), 8);
pdY = makedist('Lognormal', 0.1, sqrt(0.2)); 
UniformSample = rand(n,1);
XSample = icdf(pdX,UniformSample);
YSample = icdf(pdY,UniformSample);
ZSample = XSample + YSample;


scale = 1:1:n;

figure
plot(scale, ZSample, '.');
grid on
xlabel('Simulations')
ylabel('Z')
title('sample vs observation time')

figure
Bins=round(10*log(n));
histogram(ZSample, Bins)
title('Z = X + Y in histogram')

% Notice that the histogram does not represent figure 1. Therefore adding
% pdfs was a wrong method

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot empirical cdf
figure % open new figure
[f,z]=ecdf(ZSample);
plot(z,f);
grid on
xlabel('Z')
title('empirical cdf')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot empirical quantile
u=[.01 : .01 : .99];  % range of quantiles (values between zero and one)
q=prctile(ZSample,u*100);
figure % open new figure
plot(u,q);
grid on
xlabel('Grade')
ylabel('Quantile')
title('empirical quantile')