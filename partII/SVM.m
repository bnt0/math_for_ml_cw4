function SVM()

    % Solve the quadratic optimisation problem. Estimate the labels for 
    % each of the test samples and report the accuracy of your trained SVM 
    % utilising the ground truth labels for the test data.

    load('X.mat'); 
    load('l.mat');
    load('X_test.mat');
    load('l_test.mat');    
    
    accuracy = 0; % to be calculated
    fprintf('Accuracy on the test set is %3.2f\n', accuracy);

end