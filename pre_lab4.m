%% 2025-11-14
clear, clc, close all
R = 1;
C = 10e-12;
L = 10e-9;
f = [100; 500; 1000]*1e6;
omega = 2*pi*f;
Z = R+1./(j*omega*C) + j*omega*L
omega0 = 1/sqrt(L*C);
f0 = omega0/2/pi