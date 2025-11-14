% 2025-10-16 For different R||C load, calculate ZL values
%% R1=24 Ohm || C1 = 10 pF
clear, clc, close all
f = 770e6;
omega = 2*pi*f;
Zc = 50;
R1 = 24;
C1 = 10e-12;
G1 = 1/R1;
Y1 = G1+j*omega*C1;
Z1 = 1/Y1
Zm1 = 11.55 + j*70.56;
Gamma1 = (Z1-Zc)/(Z1+Zc)
absGamma1 = abs((Z1-Zc)/(Z1+Zc))
absGamma_m1 = abs((Zm1-Zc)/(Zm1 + Zc))

%% R2 =  82 Ohm || C2 = 10 pF
clear, clc, close all
f = 770e6;
omega = 2*pi*f;
Zc = 50;
R2 = 82;
C2 = 10e-12;
G2 = 1/R2;
Y2 = G2+j*omega*C2;
Z2 = 1/Y2
Zm2 = 22+j*112.8;
Gamma_m2 = (Zm2-Zc)/(Zm2+Zc)
AbsGamma_m2 = abs(Gamma_m2)
Gamma2 = (Z2-Zc)/(Z2+Zc)
AbsGamma2 = abs(Gamma2)

%% R3 = 10 Ohm || C3 = 5 pF
clear, clc, close all
f = 760e6;
Zc = 50;
omega = 2*pi*f;
R3 = 10;
C3 = 5e-12;
G3 = 1/R3;
Y3 = G3+j*omega*C3;
Z3 = 1/Y3
Zm3 = 1.38 - j*3.7
Gamma_m3 = 0.95
absGamma3 = abs((Z3-Zc)/(Z3+Zc))
absGamma_m3 = abs((Zm3-Zc)/(Zm3 + Zc))
RL = 20*log10(Gamma_m3)

%% R4 = 82 Ohm || C4 = 5 pF
clear, clc, close all
f = 740e6;
omega = 2*pi*f;
c=3e8;
lambda = c/f
Zc = 50;
R4 = 82;
C4 = 5e-12;
G4 = 1/R4;
Y4 = G4+j*omega*C4;
Z4 = 1/Y4
absgamma4 = abs((Z4-Zc)/(Z4+Zc))
Zm4 = 9.4 + j*6.21;
absgamma_m4 = abs((Zm4-Zc)/(Zm4+Zc))

%% from RL to R||C
clear, clc, close all
f = 750e6; % Hz
omega = 2 * pi * f; % Angular frequency

% --- Step 1: Get user input ---
realZ = input('Enter the REAL part of ZL (ohms): ');
imagZ = input('Enter the IMAGINARY part of ZL (ohms): ');
ZL = realZ + 1j * imagZ;

% --- Step 2: Calculate the admittance ---
Y = 1 ./ ZL; % Admittance
G = real(Y); % Conductance
B = imag(Y); % Susceptance

% --- Step 3: Extract equivalent R and C ---
R = 1 / G;          % Resistance (ohms)
C = B / omega *1e12;         % Capacitance (in pF)  (note the negative sign because for capacitors, B = -ωC)

% --- Step 4: Display results ---
fprintf('\nEquivalent Parallel RC Circuit at f = 750 MHz:\n');
fprintf('R = %.4f ohms\n', R);
fprintf('C = %.4e pF\n', C);

% Optional: show the reconstructed impedance for verification
Z_check = 1 / (1/R + 1j * omega * C);
fprintf('\nCheck: Reconstructed Z = %.4f + j%.4f ohms\n', real(Z_check), imag(Z_check));
%%
clear,clc,close all
ZL = 55.6 - j*282
Zc = 50
Gamma = (ZL-Zc)/(ZL+Zc)
absGamma = abs(Gamma)

%%
%openExample('rf/PlotImpedanceDataOnASmithPlotExample')
clear,clc,close all
% z1 = 0.1*50 + 1j*(0:2:50);
z1 = [5+j*0; 5+j*2; 5+j*3]
% z2 = (0:2:50) - 0.6*50j;
z0 = 50;
gamma1 = z2gamma(z1,z0);
% gamma2 = z2gamma(z2,z0);
s = smithplot(gamma1,'Color',[0.2 0 1],'GridType',"Z");
hold on;
% s = smithplot(gamma2,'Color','g','LineStyle','-.','LineWidth',1);
s.Marker = {'+','s'}
%% Section HI-X, Team A, David, Skyler, William
clear, clc, clf, close all
%% R3 = 10 Ohm || C3 = 5 pF
clear, clc, close all
c = 3e8;
f = 740e6;
lambda = c/f;
omega = 2*pi*f;
beta = omega/c;
Zc = 50;
R3 = 10;
C3 = 5e-12;
G3 = 1/R3;
Y3 = G3+j*omega*C3;
Z3 = 1/Y3
Zm3 = 76 + j*361
Gamma_m3 = 0.95
absGamma3 = abs((Z3-Zc)/(Z3+Zc))
absGamma_m3 = abs((Zm3-Zc)/(Zm3 + Zc))
RL = 20*log10(Gamma_m3)
degree1_sc = 152.7; angle1_sc = degree1_sc*pi/180;
degree2_sc = 76.65; angle2_sc = degree2_sc*pi/180;
Lmin = (pi - angle1_sc) /(2*beta)*1e2 %m->cm
Lmin_p = Lmin + +lambda*1e2
Lmax = (pi - angle2_sc) /(2*beta)*1e2 %m->cm
Lmax_p = Lmax + 3/2*lambda*1e2
L_estimated = 0.102*lambda*1e2

%%
clear, clc, clf, close all
c = 3e8;
f = 760e6;
lambda = c/f;
omega = 2*pi*f;
beta = omega/c;
% beta = 2*pi/39/1e-2;
degree1_sc = 97.5; angle1_sc = degree1_sc*pi/180;
degree2_sc = -12.8; angle2_sc = degree2_sc*pi/180;
Lmin = (pi - angle1_sc) /(2*beta)*1e2 %m->cm
Lmin_p = Lmin + lambda*1e2
Lmax = (pi - angle2_sc) /(2*beta)*1e2 %m->cm
Lmax_p = Lmax + 3/2*lambda*1e2
L_estimated = 0.099*lambda*1e2
deltaL = 0.114*lambda*1e2+lambda*1e2
%%
clear, clc, clf, close all
c = 3e8;
f = 760e6;
lambda = c/f;
omega = 2*pi*f;
beta = omega/c;
2*beta*4e-2*180/pi
20*log10(0.88)
%% error compare, dB to linear
clear, clc
dB1 = -10.173;
lin1 = 10^(dB1/20)
dB2 = -9.63;
lin2 = 10^(dB2/20)
(lin1-lin2)/lin2
%% phase of calculated
clear, clc
f = 770e6;
c = 3e8;
lambda = c/f;
omega = 2*pi*f;
beta = omega/c;
L = [42.3:4:67.5]*1e-2;
phi = -2*beta*L*180/pi+360*2