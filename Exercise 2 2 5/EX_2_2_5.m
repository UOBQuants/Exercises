%% Info
% *Author: Ashley Robertson*
% *Excerise: 2.2.5 Meucci*

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clean up workspace
clear; close all;  clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% define input parameters
load db_FX 
Display=[1 2];  % 1 = Spot USD/EUR; 2 = Spot USD/GBP; 3 = Spot USD/JPY; 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Compound = log(Data(2:end,2:end))-log(Data(1:end-1,2:end));%Matrix of compound 
                                                            %returns

% compute empirical copula by sorting
[NumObs,NumOassets]=size(Compound);
Copula = [];
for i = 1:1:NumOassets
    Copula(:,i) = ksdensity(Compound(:,i),Compound(:,i),'function','cdf');
end

%Meucci uses a different technique of finding the emprical cdf. the method
%was plausable and computationally cheap. However the final results are the
%same

figure 
% marginals
NumBins=round(10*log(NumObs));

subplot('Position',[.05 .3 .2 .6]) 
[n,D]=hist(Compound(:,Display(2)),NumBins);
barh(D,n,1);
grid on

subplot('Position',[.3 .05 .6 .2]) 
[n,D]=hist(Compound(:,Display(1)),NumBins);
bar(D,n,1);
grid on

% scatter plot
subplot('Position',[.3 .3 .6 .6]) 
h=plot(Copula(:,Display(1)),Copula(:,Display(2)),'.');
grid on
title('Copula')
xlabel(num2str(Fields(Display(1)+1).Name));
ylabel(num2str(Fields(Display(2)+1).Name));
    