function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

R = (lambda/2) * (sum(theta .^ 2) - theta(1) ^ 2);

for i = 1:m
    H = sigmoid(sum(X(i,:) * theta));
    J = J + ((-y(i) * log(H)) - (1 - y(i)) * log(1 - H));

    grad(1) = grad(1) + (H - y(i)) * X(i, 1);
    for j = 2:size(grad)
        grad(j) = grad(j) + (H - y(i)) * X(i, j);
    end
end

for j = 2:size(grad)
    grad(j) = grad(j) + lambda * theta(j);
end

J = J + R;
J = J / m;
grad = grad / m;



% =============================================================

end
