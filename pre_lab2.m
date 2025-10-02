% 2025-10-01W
clear,clc, close all
c = 3e8; % speed of light in m/s
f = 750e6; % frequency in rad/s
lambda = c/f; % wavelength in m
L = 1; % length of TL in m
ZL = 100 - j*30; % load impedance in Ohm
Rc =  50; % characteristic impedance in Ohm

%% Q1.1
% As L = Zsho +lambda/2;
Zsho = L - lambda/2

%% Q1.2
Vplus = 1; %V
Gamma = (ZL - Rc)/(ZL + Rc)
AG = abs(Gamma)
PhiG = angle(Gamma)
Vmax = 1 + AG
Vmin = 1 - AG
SWR = (1+AG)/(1-AG)
SWRdB = 20*log10(SWR)
% Zmin nearest the load: position in m
Zmin = L - PhiG*lambda/4/pi - lambda/4 % eq(3.11)

%% Q1.3
% Given Zshort, SWR and Zmin, calculate magnitude and angle of the
% reflection coefficient GammaL
Zshort = Zsho;
AbGL = (SWR-1)/(SWR+1) 
PhGL = 4*pi*(Zshort - Zmin)/lambda + pi

%% Q1.4
GammaL = AbGL*exp(j*PhGL) % equal to Gamma above
% AbGL and PhGL are from Zshort, SWR and Zmin in Q1.3
% not from (ZL - Rc)/(ZL + Rc) as Z_L is unknown here
Z_L = Rc*(1+GammaL)/(1-GammaL)