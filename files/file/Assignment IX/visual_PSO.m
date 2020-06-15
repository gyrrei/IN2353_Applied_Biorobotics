% history = (particle, values, generations )
% values = (PEA, AEA, G_mh, score)
figure
xlabel({'PEA'});
ylabel({'AEA'});
zlabel({'G_{mh}'});

view(-45, 20);
grid on
% Create title
title({'Visualisation of the evolution of the particle swarm'});
hold on
colormap jet

for i=1:size(history1, 3)
    head1 = scatter3(history1(:,1,i), history1(:,2,i), history1(:,3,i), 10,history1(:,4,i),'filled', 'LineWidth', 1.5);
    colorbar
    set(gca,'XLim',[x_min(1) x_max(1)],'YLim',[x_min(2) x_max(2)],'ZLim',[x_min(3) x_max(3)])
    drawnow
    pause(1)
    delete(head1)
end