%% MatLab file for the AVIII - NNC for sample data 
U = zeros(4,1);
length(kinematics_ISB)
U1 = zeros(1,length(kinematics_ISB));
U2 = zeros(1,length(kinematics_ISB));
U2 = zeros(1,length(kinematics_ISB));
U3 = zeros(1,length(kinematics_ISB));
t_0 = 0;
y_latched = zeros(8,1);

for i = 1:length(kinematics_ISB)
    t_1 = kinematics_ISB(i,1);
    phi = [ kinematics_ISB(i,6),kinematics_ISB(i,8), kinematics_ISB(i,10), kinematics_ISB(i,12)];
    GC = [kinematics_ISB(i,14), kinematics_ISB(i,15)];
    [U, t_0, y]  = neuro_control(t_0,phi,GC, y_latched, t_1);
    U1(i) = U(1);
    U2(i) = U(2);
    U3(i) = U(3);
    U4(i) = U(4);
end

%% Plot the Motor Voltages
figure
subplot(4,1,1)       
plot(U1,'DisplayName','U_{hr}','LineWidth',2,...
    'Color',[0.075 0.63 1]);
xlabel('Time (ms)');
ylabel('U (V)');
grid on
legend('show');
title('Plot of Motor Voltages for the Hips and Knees for Sample Set')
subplot(4,1,2) 
plot(U2,'DisplayName','U_{hl}','LineWidth',2,...
    'Color',[0.075 0.63 1]);
xlabel('Time (ms)');
ylabel('U (V)');
grid on
legend('show');

subplot(4,1,3)       
plot(U3,'DisplayName','U_{kr}','LineWidth',2,...
    'Color',[0.075 0.63 1]);
xlabel('Time (ms)');
ylabel('U (V)');
grid on
legend('show');
subplot(4,1,4) 
plot(U4,'DisplayName','U_{kl}','LineWidth',2,...
    'Color',[0.075 0.63 1]);
xlabel('Time(ms)');
ylabel('U (V)');
grid on
legend('show');
