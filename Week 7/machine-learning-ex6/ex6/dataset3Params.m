function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 0.3;
sigma = 0.1;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%


%C=[0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
%sigma = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
%P=[];
%
%%build matrix P that contains all the possible values for the couple C/sigma
%for i=1:size(C)
%  for j=1:size(sigma)
%    P=[P;[C(i),sigma(j)]];
%  end
%end
%
%error=zeros(size(P),1);
%%for all the couples from P, check which one minimize prediction error
%for p=1:size(P,1)
%  % Train the SVM
%  model= svmTrain(X, y, P(p,1), @(x1, x2) gaussianKernel(x1, x2, P(p,2)));
%  predictions = svmPredict(model, Xval);
%  
%  error(p) = mean(double(predictions ~= yval));
%  
%end
%
%[min min_ind] = min(error);
%C = P(min_ind,1);
%sigma = P(min_ind,2);


% =========================================================================

end
