function SVM()

    % Solve the quadratic optimisation problem. Estimate the labels for 
    % each of the test samples and report the accuracy of your trained SVM 
    % utilising the ground truth labels for the test data.

    load('X.mat'); 
    load('l.mat');
    load('X_test.mat');
    load('l_test.mat');
    
    
    N = length(l);
    S_t = (1/N) * (X*X');
    
    aK  = diag(l) * X';
    K_y = aK / S_t * aK';
    
    a_l = zeros(N, 1);
    a_u = 1*ones(N,1);
    
    f = -ones(1,N);
    
    c   = 0;
    A_e = l';
    c_e = 0;
    A   = zeros(1, N);
    
    alpha = quadprog(K_y,f,A,c,A_e,c_e,a_l,a_u);
    
    res_labels = sign((S_t \ X * (alpha .* l))' * X_test)';
    
    accuracy = sum(res_labels == l_test) / length(res_labels);
    fprintf('Accuracy on the test set is %3.2f\n', accuracy);

end