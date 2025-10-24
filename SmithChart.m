%% 2025-10-20
clear, clc, close all
z0 = 50;
%z1 = [5+1j*0; 5+1j*10; 10+1j*20; 25+1j*40; 25+35*j];

%for z1 = 100ohm
%z1 = [61-j*35.5; 25.5-j*13; 20.6+j*10.95; 31.8+j*36; 91.2+j*38.3; 59.2-j*34.8; 25.3-j*12.37; 22.4-j*4.88];

%for R||C, R = 10 Ohm, C = 5 pF
z1 = [55.6-1i*282; 3.23-1i*42.1; 1.54-1i*0.7; 1.68+1i*25.8; 5.77+1i*93; 71.9-1i*298; 3.65-1i*40; 9.4740 - 2.2323i];
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

%%
% 2025-10-20 — Custom Smith chart with grid, mean-radius circle, and test point
clear; clc; close all;

z0 = 50;
%for R||C, R = 10 Ohm, C = 5 pF
% The last point is the theoretical value of R||C at f=750MHz 
z1 = [317 + 1i*736; 55.6-1i*282; 3.23-1i*42.1; 1.54-1i*0.7; 1.68+1i*25.8; 5.77+1i*93; ...
      71.9-1i*298; 3.65-1i*40; 9.4740 - 2.2323i]; 

      %for z1 = 100ohm
% z1 = [61-j*35.5; 25.5-j*13; 20.6+j*10.95; 31.8+j*36; 91.2+j*38.3; 59.2-j*34.8; 25.3-j*12.37; 22.4-j*4.88; 100];

% Compute reflection coefficients
gamma_all = (z1 - z0) ./ (z1 + z0);

% Separate main points (all except last)
gamma_main = gamma_all(1:end-1);
gamma_test = gamma_all(end);

% Compute mean radius from main points
radii_main = abs(gamma_main);
r_mean = mean(radii_main);

% --- Display values ---
disp('Main points |Γ| values:');
for k = 1:length(gamma_main)
    fprintf('Point %d: |Γ| = %.4f\n', k, radii_main(k));
end
fprintf('Mean radius = %.4f\n', r_mean);
fprintf('Test point |Γ| = %.4f\n', abs(gamma_test));

% --- Plot custom Smith chart ---
figure('Color','w'); hold on; axis equal;
box on;
xlabel('Real(\Gamma)'); ylabel('Imag(\Gamma)');
title('Custom Smith Chart + Grid + Mean-Radius Circle + Test Point');
xlim([-1.1 1.1]); ylim([-1.1 1.1]);

% Draw unit circle
theta = linspace(0,2*pi,400);
plot(cos(theta), sin(theta), 'k', 'LineWidth',1.5);

% Draw axes
plot([-1.1 1.1],[0 0],'k:'); 
plot([0 0],[-1.1 1.1],'k:'); 

% --- Draw basic Smith chart grid ---
r_vals = [0, 0.2, 0.5, 1, 2, 5]; % normalized resistance
x_vals = [0.2, 0.5, 1, 2, 5];    % normalized reactance

% Resistance circles
for r = r_vals
    center = r/(r+1);
    radius = 1/(r+1);
    th = linspace(0, 2*pi, 400);
    plot(center + radius*cos(th), radius*sin(th), 'Color', [0.7 0.7 0.7]);
    text(center+radius-0.05, 0.05, sprintf('r=%.1f', r), 'FontSize', 8);
end

% Reactance circles
for x = x_vals
    th = linspace(-pi/2, pi/2, 400);
    xc = 1; yc = 1/x; r = 1/x;
    plot(xc - r*sin(th), yc - r*cos(th), 'Color', [0.7 0.7 0.7]);
    plot(xc - r*sin(th), -yc + r*cos(th), 'Color', [0.7 0.7 0.7]);
    text(0.6, 1/(x)+0.05, sprintf('jx=%.1f', x), 'FontSize', 8);
    text(0.6, -1/(x)-0.05, sprintf('-jx=%.1f', x), 'FontSize', 8);
end

% --- Mean-radius circle ---
x_circle = r_mean * cos(theta);
y_circle = r_mean * sin(theta);
plot(x_circle, y_circle, 'b--','LineWidth',1.5);

% --- Plot main points ---
plot(real(gamma_main), imag(gamma_main), 'ro','MarkerFaceColor','r','LineWidth',1.5);
for k = 1:length(gamma_main)
    text(real(gamma_main(k))+0.02, imag(gamma_main(k))+0.02, ...
        sprintf('%.3f', radii_main(k)), 'FontSize', 8, 'Color','r');
end

% --- Plot last test point ---
if abs(gamma_test) <= r_mean
    color_test = 'g'; status = 'INSIDE';
else
    color_test = 'm'; status = 'OUTSIDE';
end
plot(real(gamma_test), imag(gamma_test), 'o','MarkerFaceColor',color_test,'MarkerEdgeColor','k','MarkerSize',8,'LineWidth',1.5);
text(real(gamma_test)+0.02, imag(gamma_test)+0.02, sprintf('%.3f', abs(gamma_test)), 'FontSize',8,'Color',color_test);

% Mark origin
plot(0,0,'kx','LineWidth',2,'MarkerSize',8);

% Display mean radius info
txt = sprintf('Mean radius = %.4f\nTest point |Γ| = %.4f (%s)', r_mean, abs(gamma_test), status);
text(-1, 1.05, txt, 'FontSize', 9, 'VerticalAlignment','top');

legend({'Unit Circle','Resistance/Reactance Grid','Mean Circle','Main Points','Test Point'}, 'Location','bestoutside');

hold off;
