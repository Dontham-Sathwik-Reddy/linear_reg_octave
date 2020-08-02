function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
m = length(y);
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    temp = X * theta;
    error = temp - y;
    newX = error' * X;
    theta = theta - ((alpha/m) * newX');  
    J_history(iter) = computeCostMulti(X, y, theta);

end

end
