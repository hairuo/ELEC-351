%2025-10-01
clear,clc, close all
c = 3e8; %m/s
f = 750e6; %rad/s
lambda = c/f; %m
L = 1; %length of TL
ZL = 100 - j*30; %Ohm
Rc =  50; %Ohm

%% Q1.1
% L = Zsho +lambda/2;
Zsho = L - lambda/2

%% Q1.2
Vplus = 1; %V
Gamma = (ZL - Rc)/(ZL + Rc)
AG = abs(Gamma)
PhiG = angle(Gamma)
SWR = (1+AG)/(1-AG)
Vmax = 1 + AG
Vmin = 1 - AG
SWRdB = 20*log(SWR)
Zmin = L - PhiG*lambda/4/pi - lambda/4

%% Q1.3
% Given Zshort, SWR and Zmin, calculate magnitude and angle of the
% reflection coefficient GammaL
Zshort = Zsho;
AbGL = (SWR-1)/(SWR+1) 
PhGL = 4*pi*(Zshort - Zmin)/lambda + pi

%% Q1.4
GammaL = AbGL*exp(j*PhGL)
Z_L = Rc*(1+GammaL)/(1-GammaL)