%% Assignment IV: The Bouncing Mass Problem

%% Definitions:
x_0 = 1.2;    % Initial position (m) 
l_0 = 1;    % Length of spring in (m)
k = 100;    % Spring constant
m = 1;      % Mass in (kg)
g = -9.81;  % Gravitational acceleration (m/s)


%% Comparison of analytic and numerical solution
syms t;         % Time variable
w = sqrt(k/m);  % The natural frequency

% We will only analyze the error for the spring and not for the entire
% hybrid system

% Stance (for x<l_0)
% Find the time t_t when the mass reahces x(t_t) = l_0 
t_t = double(solve(l_0 == (1/2)*g*t + x_0));
% Calculate the initial velocity dx_0 
dx_0 = g*t_t + x_0;

% Time vector
T = x_s.time;

X_s = (dx_0/w)*sin(w*T)-(g/w^2)*cos(w*T)+(g/w^2) + l_0;
E_s = abs(X_s - x_s.data);   % absolute error of position


% Plot the two solutions with the error
figure
subplot(2,1,1)  
plot(T,X_s,'DisplayName','Analytical x(t)', 'LineWidth',3,'Color',[0 0 1]);
hold on
plot(x_s.time,x_s.data,'DisplayName','Numerical x(t)', 'LineWidth',3,'Color',[0 1 0]);
title('Comparison of the analytical and the numerical solution');
xlabel('Time (s)');
ylabel('Position (m)');
grid on
hold off
legend('show');

% Plot the error 
subplot(2,1,2)
plot(T,E_s,'DisplayName','Absolute error', 'LineWidth',3,'Color',[1 0 0]);
title('The absolute error for the position');
ylim([0 1.5])
xlabel('Time (s)');
ylabel('Absolute error ');
grid on
legend('show');

%% Plot the energies
figure
title('The energy of the bouncing mass');
xlabel('Time (s)');
ylabel('Energy (J)');
grid on
hold on
% Plot kinematic energy
plot(e_k.time,e_k.data,'DisplayName','Kinetic Energy','Tag','DisplayLine1',...
    'LineWidth',2,...
    'Color',[1 1 0.07]);

% Plot potential energy
plot(e_p.time,e_p.data,'DisplayName','Potential Energy','Tag','DisplayLine2',...
    'LineWidth',2,...
    'Color',[0.075 0.62 1]);

% Plot elastic energy
plot(e_e.time,e_e.data,'DisplayName','Elastic Energy','Tag','DisplayLine3',...
    'LineWidth',2,...
    'Color',[1 0.41 0.16]);

e_all = e_k.data + e_p.data + e_e.data;
% Plot total sum of energies
plot(e_e.time,e_all,'DisplayName','Total energy','Tag','DisplayLine4',...
    'LineWidth',2,...
    'Color',[0.39 0.83 0.075]);
legend('show');
hold off

%% Plot the position, velocity and acceleration
figure
subplot(3,1,1)       
plot(x.time,x.data,'DisplayName','Distance x(t)','LineWidth',2,...
    'Color',[1 1 0.067]);
title('Distance of the mass from the ground')
xlabel('Time (s)');
ylabel('Distance (m)');
grid on
legend('show');

subplot(3,1,2)       
plot(dx.time,dx.data,'DisplayName','Velocity dx(t)','LineWidth',2,...
    'Color',[0.075 0.63 1]);
title('Plot of the velocity of the mass')
xlabel('Time (s)');
ylabel('Velocity (m/s)');
grid on
legend('show');

subplot(3,1,3)       
plot(ddx.time,ddx.data,'DisplayName','Acceleration ddx(t)','LineWidth',2,...
    'Color',[1 0.41 0.16]);
title('Plot of the acceleration of the mass')
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');
grid on
legend('show');


