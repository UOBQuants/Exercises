%%
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% generate plot of samples
pdX = makedist('tLocationScale', 0, sqrt(0.1), 8);
pdY = makedist('Lognormal', 0.1, sqrt(0.2)); 
UniformSample = rand(n,1);
XSample = icdf(pdX,UniformSample);
YSample = icdf(pdY,UniformSample);
ZSample = XSample + YSample;

w = 1/n;
scale = w:w:1;

figure
plot(ZSample, scale, '.');

figure
histogram(ZSample, 300)

% Notice that the histogram does not represent figure 1. Therefore adding
% pdfs was a wrong method