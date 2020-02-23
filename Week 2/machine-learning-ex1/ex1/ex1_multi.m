%% Machine Learning Online Class
%  Exercise 1: Linear regression with multiple variables
%% Initialization

%% ================ Part 1: Feature Normalization ================

%% Clear and Close Figures
clear ; close all; clc

fprintf('Loading data ...\n');

%% Load Data
data = load('ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

% Print out some data points
fprintf('First 10 examples from the dataset: \n');
fprintf(' x = [%.0f %.0f], y = %.0f \n', [X(1:10,:) y(1:10,:)]');

fprintf('Program paused. Press enter to continue.\n');
pause;

% Scale features and set them to zero mean
fprintf('Normalizing Features ...\n');

[X mu sigma] = featureNormalize(X);

% Add intercept term to X
X = [ones(m, 1) X];


%% ================ Part 2: Gradient Descent ================

fprintf('Running gradient descent ...\n');

% Choose some alpha value
alpha = [0.3,0.1,0.03,0.01];
num_iters = 50;

% Init Theta and Run Gradient Descent 
theta1 = zeros(3, 1);
theta2 = zeros(3, 1);
theta3 = zeros(3, 1);
theta4 = zeros(3, 1);

[theta1, J_history1] = gradientDescentMulti(X, y, theta1, alpha(1), num_iters);
[theta2, J_history2] = gradientDescentMulti(X, y, theta2, alpha(2), num_iters);
[theta3, J_history3] = gradientDescentMulti(X, y, theta3, alpha(3), num_iters);
[theta4, J_history4] = gradientDescentMulti(X, y, theta4, alpha(4), num_iters);

% Plot the convergence graph
figure;
hold on;
plot(1:numel(J_history1), J_history1, '-b', 'LineWidth', 2);
plot(1:numel(J_history2), J_history2, '-r', 'LineWidth', 2);
plot(1:numel(J_history3), J_history3, '-k', 'LineWidth', 2);
plot(1:numel(J_history4), J_history4, '-m', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');
legend("alpha=0.3","alpha=0.1","alpha=0.03","alpha=0.01");

% Display gradient descent's result
fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta1);
fprintf('\n');

% Estimate the price of a 1650 sq-ft, 3 br house (Warning: normalization)
X_estimate = [1,(1650-mu(1))/sigma(1),(3-mu(2))/sigma(2)]

price = theta1'*X_estimate'; 

fprintf(['Predicted price of a 1650 sq-ft, 3 br house ' ...
         '(using gradient descent):\n $%f\n'], price);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ================ Part 3: Normal Equations ================

fprintf('Solving with normal equations...\n');

%% Load Data
data = csvread('ex1data2.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

% Add intercept term to X
X = [ones(m, 1) X];

% Calculate the parameters from the normal equation
theta = normalEqn(X, y);

% Display normal equation's result
fprintf('Theta computed from the normal equations: \n');
fprintf(' %f \n', theta);
fprintf('\n');

% Estimate the price of a 1650 sq-ft, 3 br house
price = 0; % You should change this
X_estimateNorm = [1,1650,3]
price = theta'*X_estimateNorm'; 

fprintf(['Predicted price of a 1650 sq-ft, 3 br house ' ...
         '(using normal equations):\n $%f\n'], price);

