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

%%
% error between RLs
RL1 = [-10.29; -3.42; -2.68];
RL2 = [-11.69; -4.122; -1.5461];
RC1 = 10.^(RL1./20);
RC2 = 10.^(RL2./20);
error = (RC1 - RC2)./RC1
fake_error = (RL1 - RL2)./RL2

%%
% error between RLs
RL1 = [-9.88; -8.55];
RL2 = [-9.54; -9.54];
RC1 = 10.^(RL1./20);
RC2 = 10.^(RL2./20);
error = (RC1 - RC2)./RC1
fake_error = (RL1 - RL2)./RL2
%%
% error between RLs
RL1 = [-9.52; -9.17; -9.34];
RL2 = [-11.88; -4.16; -1.56];
RC1 = 10.^(RL1./20);
RC2 = 10.^(RL2./20);
error = (RC1 - RC2)./RC1
fake_error = (RL1 - RL2)./RL1

