% 2025-10-16 For different R||C load, calculate ZL values
%% R1 || C1
clear, clc, close all
f = 750e6;
omega = 2*pi*f;
Zc = 50;
R1 = 24;
C1 = 10e-12;
G1 = 1/R1;
Y1 = G1+j*omega*C1;
Z1 = 1/Y1
Zm1 = 7.12 + j*66.1;
absGamma1 = abs((Z1-Zc)/(Z1+Zc))
absGamma_m1 = abs((Zm1-Zc)/(Zm1 + Zc))

%% R2 || C2
%clear, clc, close all
f = 750e6;
omega = 2*pi*f;
Zc = 50;
R2 = 82;
C2 = 10e-12;
G2 = 1/R2;
Y2 = G2+j*omega*C2;
Z2 = 1/Y2

%% R3 || C3
clear, clc, close all
f = 750e6;
Zc = 50;
omega = 2*pi*f;
R3 = 10;
C3 = 5e-12;
G3 = 1/R3;
Y3 = G3+j*omega*C3;
Z3 = 1/Y3
Zm3 = 317 + j*736
Gamma_m3 = 0.95
absGamma3 = abs((Z3-Zc)/(Z3+Zc))
absGamma_m3 = abs((Zm3-Zc)/(Zm3 + Zc))

%% R4 || C4
% clear, clc, close all
f = 750e6;
omega = 2*pi*f;
Zc = 50;
R4 = 82;
C4 = 5e-12;
G4 = 1/R4;
Y4 = G4+j*omega*C4;
Z4 = 1/Y4
absgamma4 = abs((Z4-Zc)/(Z4+Zc))
Zm4 = 282 + j*125;
absgamma_m4 = abs((Zm4-Zc)/(Zm4+Zc))

%% from RL to R||C
% clear, clc, close all
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