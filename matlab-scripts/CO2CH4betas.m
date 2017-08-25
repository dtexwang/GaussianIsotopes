% from Shuhei Ono's methane2.m script
% modified by DTW on 16 Nov 2013 to calculate partition functions for other
%   alkanes, using frequency data from Galimov73, scaled to NIST WebBook
% betas calculated are relative to isotopologue described by *freqs(:,1)

close all
clear all

%% vibrational frequencies for methane isotopologues (cm-1)

% load the calcualted vibrational frequency data (from Gaussian)
nRowsToSkip = 1;
nColsToSkip = 0;
freqsCH4 = csvread('freqs_Methane.csv', nRowsToSkip, nColsToSkip)
freqsCO2 = csvread('freqs_CarbonDioxide.csv', nRowsToSkip, nColsToSkip)



%%  calculation of beta-factor vs. Temperature



T = [0:5:100, 120:20:300, 350:50:1000];     % temperatures at which to calculate beta-factors (in Celsius)
T = 273.15 + T;                             % convert to Kelvin

betasCH4 = calcbetas(freqsCH4,T);       % call function CALCBETA.M to calculate betas
betasCO2 = calcbetas(freqsCO2,T);      

str = ['The ß-factor for 13CH4/12CH4 at 5 °C is: ', num2str(betasCH4(find(T == 273.15+5)))];
disp(str);

betadata = [(T-273.15)', betasCH4, betasCO2];     % betadata = [T (Celsius), beta methane-13C/12C]
csvwrite('CO2CH4betas.csv',betadata);

