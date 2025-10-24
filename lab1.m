%%
clear, clc, close all
f = [100;750; 1500]*1e6;
R = 82;
C = 5e-12;
omega = 2*pi*f;
YL = 1/R + j*omega*C;
ZL = 1./YL
Gamma = (ZL - 50)./(ZL + 50);
RL = 20*log10(abs(Gamma))