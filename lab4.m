%2025-11-21
%% 
clear, clc, clf, close all
Zmm = [98.8-j*40.4; 30+j*10.3] %measured match load 50 Ohm
Gamma =(Zmm - 50)./(Zmm + 50)
AbsG = abs(Gamma)
S11 = 20*log10(AbsG)
