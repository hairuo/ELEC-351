% 2025-10-23
%% Q1
clear,clc,close all
f = 750e6;
Rc = 50;
u = 3e7; %not 3e8 here!
L = 80e-2;
ZL = 83 + j*46;
lambda = u/f;
beta = 2*pi/lambda %5*pi rad/m
GammaL = (ZL-Rc)/(ZL + Rc)
AbsGammaL = abs(GammaL)
AngGammaL = angle(GammaL)
DegreeGammaL = AngGammaL * 180/pi

%% Q2, Q3
clear, clc, close all
u = 3e7;
f = 750e6;
lambda = u/f;
beta = 2*pi/lambda;
L = 80e-2;
Cf = 0.11*exp(1i * deg2rad(10));
Cb = 0.09*exp(1i * deg2rad(-20));
% eq(4.6), amplitude ratio in short case
absRshort = abs(Cb/Cf) %0.09/0.11
delta_theta_short = (angle(Cb)-angle(Cf) + 81*pi - 2*beta*L)*180/pi
% eq(4.8), amplitude ratio in load case
ZL = 83 + j*46;
Rc = 50;
GammaL = (ZL-Rc)/(ZL + Rc)
absRload = absRshort*abs(GammaL)
delta_theta_load = (delta_theta_short*pi/180 - pi + angle(GammaL))*180/pi

%% Q4
clear, clc, close all
Rc = 50;
absRshort =   0.8182;
absRload =   0.3291;
delta_theta_short =  150.0000 %degree
delta_theta_load =    5.2660 %degree
absGammaL = absRload/absRshort
phi = delta_theta_load - delta_theta_short + 180
GammaL = absGammaL*exp(1i * deg2rad(phi))
ZL = Rc*(1+GammaL)/(1-GammaL)
