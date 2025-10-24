% 2025-10-20
clear, clc, close all
z0 = 50;
%z1 = [5+1j*0; 5+1j*10; 10+1j*20; 25+1j*40; 25+35*j];

%for z1 = 100ohm
%z1 = [61-j*35.5; 25.5-j*13; 20.6+j*10.95; 31.8+j*36; 91.2+j*38.3; 59.2-j*34.8; 25.3-j*12.37; 22.4-j*4.88];

%for R||C, R = 10Ohm, C = 5pF
z1 = [55.6-j*282; 3.23-j*42.1; 1.54-j*0.7; 1.68+j*25.8; 5.77+j*93; 71.9-j*298; 3.65-j*40];
gamma1 = (z1 - z0) ./ (z1 + z0);

smithplot_custom(gamma1, 'Z0', z0, 'GridType', 'Z');

function h = smithplot_custom(Gamma, varargin)
%SMITHPLOT_CUSTOM Draw a Smith chart with impedance/admittance grids
%   h = smithplot_custom(Gamma, 'Z0', 50, 'GridType', 'Z')
%
%   Gamma: complex reflection coefficients (|Gamma| <= 1)
%   Options:
%     'Z0'       : characteristic impedance (default 50)
%     'GridType' : 'Z' for impedance chart (default), 'Y' for admittance

% Parse optional arguments
p = inputParser;
addParameter(p, 'Z0', 50);
addParameter(p, 'GridType', 'Z');
parse(p, varargin{:});
Z0 = p.Results.Z0;
gridType = upper(p.Results.GridType);

figure; hold on; axis equal;
box on;
xlabel('Real(\Gamma)'); ylabel('Imag(\Gamma)');
title(sprintf('Smith Chart (%s-grid)', gridType));
xlim([-1.1 1.1]); ylim([-1.1 1.1]);

% Outer circle
th = linspace(0, 2*pi, 400);
plot(cos(th), sin(th), 'k', 'LineWidth', 1);

% Axes lines
plot([-1.1 1.1], [0 0], 'k:');  % horizontal axis
plot([0 0], [-1.1 1.1], 'k:');  % vertical axis

% Resistance and reactance grid
r_vals = [0, 0.2, 0.5, 1, 2, 5];
x_vals = [0.2, 0.5, 1, 2, 5];

for r = r_vals
    center = r/(1+r);
    radius = 1/(1+r);
    theta = linspace(0, 2*pi, 400);
    plot(center + radius*cos(theta), radius*sin(theta), 'Color', [0.7 0.7 0.7]);
    % Label resistance circle
    text(center+radius-0.05, 0.05, sprintf('r=%.1f', r), 'FontSize', 8);
end

for x = x_vals
    theta = linspace(-pi/2, pi/2, 400);
    xc = 1; yc = 1/x; r = 1/x;
    plot(xc - r*sin(theta), yc - r*cos(theta), 'Color', [0.7 0.7 0.7]);
    plot(xc - r*sin(theta), -yc + r*cos(theta), 'Color', [0.7 0.7 0.7]);
    % Label reactance circles
    text(0.6, 1/(x)+0.05, sprintf('jx=%.1f', x), 'FontSize', 8);
    text(0.6, -1/(x)-0.05, sprintf('-jx=%.1f', x), 'FontSize', 8);
end

% Plot data
h = plot(real(Gamma), imag(Gamma), 'r-o', 'LineWidth', 1.5);

% Add tick labels for normalized Z and Y axes
if gridType == "Z"
    text(-1, -0.1, sprintf('Z=0'), 'FontSize', 9);
    text(0.9, -0.1, sprintf('Z→∞'), 'FontSize', 9);
else
    text(-1, -0.1, sprintf('Y→∞'), 'FontSize', 9);
    text(0.9, -0.1, sprintf('Y=0'), 'FontSize', 9);
end

hold off;
end
