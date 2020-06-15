%% Assignment VI: The Spring Mass Walker

%% Definitions:
x_0 = 0;    % Initial x-position (m) 
y_0 = 0.97;    % Initial y-position (m) 
dx_0 = 1.06;     % Initial dx-velocity (m/s)
dy_0 = 0;     % Initial dy-velocity (m/s)
l_0 = 1;      % Length of spring in (m)
k = 10000;       % Spring constant (N/m)
m = 80;       % Mass in (kg)
g = -9.81;    % Gravitational acceleration (m/s)
a_TD = 64.2076;    % Angle of attack (at touch down)
No_Steps = 25; %Number of steps to be investigated
E = 810; % Total energy (J)

% Checking the possible forward speed max limit and mean
max(dx.data)
mean(dx.data)
%% Plot CoM trajectory
figure     
plot(x.data,y.data,'DisplayName','CoM','LineWidth',2,...
    'Color',[0.075 0.63 1]);
title('Plot of CoM trajectory')
xlabel('Distance x(m)');
ylabel('Distance y(m)');
grid on
legend('show');

%% Plot the position, velocity and acceleration
figure
subplot(3,1,1)       
plot(x.time,x.data,'DisplayName','Distance x(t)','LineWidth',2,...
    'Color',[1 1 0.067]);
title('Plot of the horizontal movement of the mass')
xlabel('Time (s)');
ylabel('Distance (m)');
grid on
legend('show');

subplot(3,1,2)       
plot(dx.time,dx.data,'DisplayName','Velocity dx(t)','LineWidth',2,...
    'Color',[0.075 0.63 1]);
title('Plot of the velocity of the mass in the horizontal direction')
xlabel('Time (s)');
ylabel('Velocity (m/s)');
grid on
legend('show');

subplot3 = subplot(3,1,3)       
plot(ddx.time,ddx.data,'DisplayName','Acceleration ddx(t)','LineWidth',2,...
    'Color',[1 0.41 0.16]);
title('Plot of the acceleration of the mass in the horizontal direction')
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');
ylim(subplot3,[-2.5 2.5]);
grid on
legend('show');


%% Plot the spring forces
figure
subplot(2,1,1)       
plot(Fx1.time,Fx1.data,'DisplayName','Fx1','LineWidth',2,...
    'Color',[0.075 0.63 1]);
hold on
plot(Fx2.time,Fx2.data,'DisplayName','Fx2','LineWidth',2,...
    'Color',[1 0.41 0.16]);
title('Plot of the horisontal spring force')
xlabel('Time (s)');
ylabel('Horisontal Spring Force (N)');
grid on
legend('show');

subplot(2,1,2)       
plot(Fy1.time,Fy1.data,'DisplayName','Fy1','LineWidth',2,...
    'Color',[0.075 0.63 1]);
hold on
plot(Fy2.time,Fy2.data,'DisplayName','Fy2','LineWidth',2,...
    'Color',[1 0.41 0.16]);
title('Plot of the vertical spring force')
xlabel('Time(s)');
ylabel('Vertical Spring Force (N)');
grid on
legend('show');
%% Plot the position, velocity and acceleration in the vertical direction
figure
subplot(3,1,1)       
plot(y.time,y.data,'DisplayName','Distance y(t)','LineWidth',2,...
    'Color',[1 1 0.067]);
title('Plot of the vertical movement of the mass')
xlabel('Time (s)');
ylabel('Distance (m)');
grid on
legend('show');

subplot(3,1,2)       
plot(dy.time,dy.data,'DisplayName','Velocity dy(t)','LineWidth',2,...
    'Color',[0.075 0.63 1]);
title('Plot of the velocity of the mass in the vertical direction')
xlabel('Time (s)');
ylabel('Velocity (m/s)');
grid on
legend('show');

subplot(3,1,3)       
plot(ddy.time,ddy.data,'DisplayName','Acceleration ddy(t)','LineWidth',2,...
    'Color',[1 0.41 0.16]);
title('Plot of the acceleration of the mass in the vertical direction')
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');
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

% Plot elastic energy for spring 1
plot(e_s1.time,e_s2.data,'DisplayName','Elastic Energy Spring 1','Tag','DisplayLine3',...
    'LineWidth',2,...
    'Color',[1 0.41 1]);

% Plot elastic energy for spring 2
plot(e_s2.time,e_s2.data,'DisplayName','Elastic Energy Spring 2','Tag','DisplayLine4',...
    'LineWidth',2,...
    'Color',[1 1 0.16]);

% Plot total sum of energies
plot(e_t.time,e_t.data,'DisplayName','Total energy','Tag','DisplayLine5',...
    'LineWidth',2,...
    'Color',[0.39 0.83 0.075]);
legend('show');
hold off

%% Plot y(t) and dy(t)
figure      
plot(y.data,dy.data,'DisplayName','Phase y(t)/dy(t)','LineWidth',0.1,...
    'Color',[0.075 0.62 1]);
title('Phase plot for the walking model')
xlabel('Distance (m/s)');
ylabel('Velocity (m/s^2)');
grid on
legend('show');

%% Checking the speed limits
figure
plot(dx.time,dx.data,'DisplayName','Velocity dx(t)','LineWidth',2,...
    'Color',[0.075 0.63 1]);
title('Plot of the velocity of the mass in the horizontal direction')
xlabel('Time (s)');
ylabel('Velocity (m/s)');
grid on
legend('show');