%% Assignment II: The Falling Mass Problem (due Apr. 18th)
close all; clear all; clc
%% Problem statement:
%{
Describe the trajectory of a falling ball (mass 1kg) dropped from a skyscraper and calculate the 
displacement it moved when it reaches a velocity of -10m/s. Assume the acceleration due to gravity 
to be -9.81m/s² and neglect drag (resistence of air).
%}

% Definitions:
v_0 = 0;    % Initial velocity
g = -9.81;  % Gravitational acceleration
v_t = -10;  % Target velocity
syms t;     % Time variable

% Find the time t_t when the target speed is reached
t_t = double(solve(v_t == v_0 + g*t,t)); 

% Calculate the displacement
dx = v_0*t_t + 0.5*g*t_t^2;

% Time vector
T = 0:t_t/100:1.5*t_t;

% Plotting the velocity of the ball
V = v_0 + g*T;

figure
plot(T,V,'DisplayName','v(t)', 'LineWidth',3,'Color',[0 0 1]);
y1 = [V(end),0];
x1 = [0,T(end)];
hold on
% Create ylabel
ylabel('Velocity v [m/s]');
% Create xlabel
xlabel('Time t [s]');
% Create title
title('The velocity of the ball');
grid on
% Plot the intersection of t_t and v_t
plot([t_t t_t], y1, 'DisplayName','t_t')
plot(x1, [v_t v_t], 'DisplayName','v_t')

% Plotting the displacement of the ball
dX = v_0*T + 0.5*g*T.^2;

figure
plot(T,dX,'DisplayName','dx(t)', 'LineWidth',3,'Color',[0 0.5 0]);
y2=[dX(end),0];
hold on
% Create ylabel
ylabel('Displacement dx [m]');
% Create xlabel
xlabel('Time t [s]');
% Create title
title('The displacement of the falling ball');
grid on
% Plot the intersection of t_t and dx
plot([t_t t_t], y2, 'DisplayName','t_t')
plot(x1, [dx dx], 'DisplayName','dx_t')
hold off

