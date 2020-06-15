%% Assignment IX: Particle Swarm Optimization 
% To find the best parameters for a stable gait for the JenaFox model
% Needs to walk minimum 5m and have the highest velocity possible

%% Initialization of the Swarm
N = 30;         % Number of particles
D = 3;          % Number of parameters
G = 5;          % Number of generations

x_min = [0 -15 1];  % Lower limit of search space 
x_max = [15 0  2];  % Upper limit of search space
v_max = 0.2*(x_max-x_min);  % Maximum Velocity 20% search space range

x = [unifrnd(x_min(1),x_max(1),N,1) unifrnd(x_min(2),x_max(2),N,1) unifrnd(x_min(3),x_max(3),N,1)]; % Position of the individuals dim N*D
v = zeros(N,D);     % The velocity of each individual
h = zeros(N,D);     % Nearest Neighbors - all topology 
f = zeros(N,1);     % Results for max velocity
d = zeros(N,1);     % Results for distance walked 
b = x;              % Best performance of each individual
            
% sig = 2;          % Neighborhood size sig<N, not used in this assigment

phi_max = 2.05;     % Maximum learning rate  
phi1 = zeros(N,D);  % Cognition learning rate
phi2 = zeros(N,D);  % Social learning rate

w = 0.7;            % Inertia weight

history = zeros(N,D+1,G);  % for ploting of the swarm

%% The Search Algorithm for PSO
gen = 1; % criteria for stoping
tic
while gen ~= (G+1)
    disp(['Generation no. ',num2str(gen)]);
    for ind = 1:N
        [f(ind),d(ind)] = simFox(x(ind,1),x(ind,2),x(ind,3));
        history(ind,:,gen) = [x(ind,1) x(ind,2) x(ind,3) f(ind)];
    end
    for ind = 1:N 
        [m,i] = max(f(:));
        h(ind,:) = x(i,:); % The best of all the neighbors
        %phi1(ind,:) = [2.5586 2.5586 2.5586]; % Numbers taken from Pedersen 2010
        %phi2(ind,:) = [1.3358 1.3358 1.3358];
        % Initialize the learning rates randomly
        if gen == 1
            phi1(ind,:) = [((phi_max+1).*rand()-1) ((phi_max+1).*rand()-1) ((phi_max+1).*rand()-1)]; 
            phi2(ind,:) = [((phi_max+1).*rand()-1) ((phi_max+1).*rand()-1) ((phi_max+1).*rand()-1)];
        end
        
        % Updating the velocity
        v(ind,:) = w.*v(ind,:) + phi1(ind,:).*(b(ind,:)-x(ind,:)) + phi2(ind,:).*(h(ind,:)-x(ind,:));
        
        % Checking the speed limits
        for a=1:D
            if abs(v(ind,a)) > v_max(a)
                v(ind,a) = v(ind,a).*v_max(a)/abs(v(ind,a));
            end
        end
        
        % Updating the position
        x(ind,:) = x(ind,:) + v(ind,:);
        
        % Checking position limits
        if min(x(ind,:) - x_min) < 0
            if (x(ind,1) - x_min(1)) < 0
                x(ind,1) = x_max(1)/2;
            end
            if (x(ind,2) - x_min(2)) < 0
                x(ind,2) = x_min(2)/2;
            end
            if (x(ind,3) - x_min(3)) < 0
                x(ind,3) = x_min(3)/2;
            end
        elseif (max(x(ind,:) - x_max)) > 0
            if (x(ind,1) - x_max(1)) > 0
                x(ind,1) = x_max(1)/2;
            end
            if (x(ind,2) - x_max(2)) > 0
                x(ind,2) = x_min(2)/2;
            end
            if (x(ind,3) - x_max(3)) > 0
                x(ind,3) = x_max(3)/2;
            end
        end
        
        % Best performance of this individual
        [fb,db] = simFox(b(ind,1),b(ind,2),b(ind,3)); 
        if f(ind)>fb
            b(ind,:) = x(ind,:);
        end
    end
    
    % Outputs when a particle in the swarm reaches 5m distance
    if max(d)> 5
        disp('Best particle is over 5m');
    end
    
    w = w*(G-gen)/G;    % Decreasing inertia
    gen = gen + 1;      % Next generation
end

t = toc;

%% Results
% Best particle according to the reward function:
[m,i] = max(f(:));
disp(['The best particle is ', num2str(i)]);
disp(['The best parameters is ', num2str(x(i,1)),',',num2str(x(i,2)),',', num2str(x(i,3))]);
disp(['The longest distance walked is ', num2str(d(i))]);
disp(['The max velocity is ', num2str(m)]);
disp(['Time spent ', num2str(t)]);

Results = [[N G x(i,1) x(i,2) x(i,3) d(i) m t ], 
            Results];