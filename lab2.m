% 2025-10-30
%%
clear,clc
c=3e8;
f=770e6;
half_lambda = c/f*1e3/2
330+half_lambda


%% calculate error between two dB value
clear,clc
VdB = [-37.5; -42.168]
V = 10.^(VdB./20)
error = (V(1)-V(2))/1
%% R||C => ZL
clear,clc
f = 730e6;
omega = 2*pi*f;
R = 82;
C = 5e-12;
Y = 1/R + j*omega*C;
ZL = 1/Y
%% GammaL => ZL
clear, clc
GammaL = 0.783*exp(j*7);
ZL = 50*(1+GammaL)/(1-GammaL)

%%
clear, clc
Z0 = 50;
% ZL = [44.732 + 118.95*i; 4.9108-19.4569*i]
ZL = [9.46-j*6.16; 184+j*12.2; 17.695-j*33.73]
GammaL = (ZL - Z0)./(ZL + Z0)
absGammaL = abs(GammaL)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Below is HI-X
%% Calculate using (15), verify William, diff with 1dB
clear, clc,close all
f = 730e6;
omega = 2*pi*f;
c = 3e8;
beta = omega/c;
Z = [103.3:20:343.3]*1e-3;
L = 528.5*1e-3;
VdB = 20*log10(abs(1+exp(j*(pi-2*beta*(L-Z))))/2)
plot(Z, VdB)
%% Calculate using (15), Skyler, most right except two
clear, clc,close all
f = 730e6;
omega = 2*pi*f;
c = 3e8;
beta = omega/c;
Z = [103.3:20:343.3]*1e-3
L = 528.5e-3;
VdB = 20*log10(abs(1+exp(j*(pi-2*beta*(L-Z))))/2)
plot(Z, VdB)
%% Calculate using (15), David, not agree with all
clear, clc,close all
f = 730e6;
omega = 2*pi*f;
c = 3e8;
beta = omega/c;
Z = [103.3:20:343.3]*1e-3
L = 527.5e-3;
VdB = 20*log10(abs(1+exp(j*(pi-2*beta*(L-Z))))/2)
plot(Z, VdB)

%% Calculate using (15), Kartik, one number wrong
clear, clc,close all
f = 740e6;
omega = 2*pi*f;
c = 3e8;
beta = omega/c;
Z = [105.1:20:345.1]*1e-3;
L = 52.68*1e-2;
VdB = 20*log10(abs(1+exp(j*(pi-2*beta*(L-Z))))/2)
plot(Z, VdB)

%% Calculate using (15), Maxime, most right but lack one data
clear, clc,close all
f = 740e6;
omega = 2*pi*f;
c = 3e8;
beta = omega/c;
Z = [105.1:20:345.1]*1e-3
L = 528.7e-3;
VdB = 20*log10(abs(1+exp(j*(pi-2*beta*(L-Z))))/2)
plot(Z, VdB)
%% Calculate using (15), Zaid, didn't calculate it successfuly.
clear, clc,close all
f = 740e6;
omega = 2*pi*f;
c = 3e8;
beta = omega/c;
Z = [105.1:20:345.1]*1e-3
L = 528.8e-3;
VdB = 20*log10(abs(1+exp(j*(pi-2*beta*(L-Z))))/2)
plot(Z, VdB)
%% Calculate using (15), Shayan, half is wrong.
clear, clc,close all
f = 760e6;
omega = 2*pi*f;
c = 3e8;
beta = omega/c;
Z = [107.3:20:347.3]*1e-3
L = 527.6e-3;
VdB = 20*log10(abs(1+exp(j*(pi-2*beta*(L-Z))))/2)
plot(Z, VdB)
%% Calculate using (15), Julia, all is correct!
clear, clc,close all
f = 760e6;
omega = 2*pi*f;
c = 3e8;
beta = omega/c;
Z = [107.3:20:347.3]*1e-3;
L = 527.8*1e-3;
VdB = 20*log10(abs(1+exp(j*(pi-2*beta*(L-Z))))/2)
plot(Z, VdB)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Below is HJ-X
%% Calculate using (15), Connor, perfect
clear, clc,close all
f = 740e6;
omega = 2*pi*f;
c = 3e8;
beta = omega/c;
Z = [106.6:20:346.6]*1e-3
L = 528.8*1e-3;
VdB = 20*log10(abs(1+exp(j*(pi-2*beta*(L-Z))))/2)
plot(Z, VdB)
%% Calculate using (15), Jose, not same but close
clear, clc,close all
f = 740e6;
omega = 2*pi*f;
c = 3e8;
beta = omega/c;
Z = [106.6:20:346.6]*1e-3
L = 527.5*1e-3;
VdB = 20*log10(abs(1+exp(j*(pi-2*beta*(L-Z))))/2)
plot(Z, VdB)
%% Calculate using (15), Nathan, calculate L wrong leading to dB wrong
clear, clc,close all
f = 750e6;
omega = 2*pi*f;
c = 3e8;
beta = omega/c;
Z = [109:20:349]*1e-3
L = 530*1e-3;
VdB = 20*log10(abs(1+exp(j*(pi-2*beta*(L-Z))))/2)
plot(Z, VdB)
%% Calculate using (15), Nancy, close, except measured on not 0dB
clear, clc,close all
f = 750e6;
omega = 2*pi*f;
c = 3e8;
beta = omega/c;
Z = [109:20:349]*1e-3
L = 532*1e-3;
VdB = 20*log10(abs(1+exp(j*(pi-2*beta*(L-Z))))/2)
plot(Z, VdB)
%% Calculate using (15), Neil, trend is right
clear, clc,close all
f = 750e6;
omega = 2*pi*f;
c = 3e8;
beta = omega/c;
Z = [109:20:349]*1e-3
L = 532*1e-3;
VdB = 20*log10(abs(1+exp(j*(pi-2*beta*(L-Z))))/2)
plot(Z, VdB)
%% Calculate using (15), Mathumitha, trends are good, Camila parallel the data but trend is good
clear, clc,close all
f = 770e6;
omega = 2*pi*f;
c = 3e8;
beta = omega/c;
Z = [115.5:20:355.5]*1e-3
L = 525*1e-3
VdB = 20*log10(abs(1+exp(j*(pi-2*beta*(L-Z))))/2)
plot(Z, VdB)
%% Calculate using (15), Deborah,
clear, clc,close all
f = 770e6;
omega = 2*pi*f;
c = 3e8;
beta = omega/c;
Z = [115.5:20:355.5]*1e-3
L = 527.8*1e-3;
VdB = 20*log10(abs(1+exp(j*(pi-2*beta*(L-Z))))/2)
plot(Z, VdB)

%%%%%%%%%%%%%%%%
%% ZL from Gamma
clear, clc, close all
c = 3e8;
f = 730e6;
lambda =c/f
Zsh = 323.5e-3;
Zmin = 218.9e-3;
SWR = 10^(34/20)
absG = (SWR-1)/(SWR+1)
Phi = 4*pi*(Zsh-Zmin)/lambda + pi
Gamma = absG*exp(j*Phi)
ZL = 50*(1+Gamma)/(1-Gamma) %296.11+49.93*j
%%
clear, clc, clf, close all
zsh = 333.7e-3;
zmin = 215.5e-3;
c = 3e8;
f = 770e6;
omega = 2*pi*f;
lambda = c/f;
phi = 4*pi*(zsh-zmin)/lambda + pi
phi_degree = phi*180/pi-360
SWRdB = 13;%dB
SWR = 10^(SWRdB/20)
absGamma = (SWR-1)/(SWR+1)
Gamma = absGamma*exp(j*phi);
ZL = 50*(1+Gamma)/(1-Gamma)
R = 82; 
C0 = 10e-12;
Y = 1/R+j*omega*C0;
ZL0 = 1/Y
Gamma0 = (50-ZL0)/(50+ZL0)
abs(Gamma0)
%%
dBValue = [-45.5; -23]
LValue = 10.^(dBValue/20)
%%
clear, clc
SWRdB = 7.25;%dB
SWR = 10^(SWRdB/20)
absGamma = (SWR-1)/(SWR+1)