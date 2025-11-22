%2025-11-21
%% 
clear, clc, clf, close all
Zmm = 123 - j*30; %measured match load 50 Ohm
Gamma =(Zmm - 50)/(Zmm + 50)
AbsG = abs(Gamma)
S11 = 20*log10(AbsG)