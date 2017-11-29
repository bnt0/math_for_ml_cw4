function W = LDA(data, labels)
    % centralize data
    data_mean = mean(data, 1);
    central_data = data - repmat(data_mean, size(data, 1),1);
    
    % array of each label (c0..cn)
    unique_labels = unique(labels);
    % number of samples corresponding to each class (N_e0..N_en)
    n_eis = histc(labels, unique_labels);
    
    % array of all Ei matrices
    
    E_is = arrayfun(@(it) 1/it*ones(it), n_eis, 'UniformOutput', false);
    
    M = blkdiag(E_is{:});
    
    i_minus_m = (eye(length(labels)) - M);
    [V_w, Lambda_w] = eigs(i_minus_m * central_data * central_data' * i_minus_m, size(central_data, 1) - (size(unique_labels, 1) + 1));
    U = central_data' * i_minus_m * V_w / Lambda_w;
    
    proj_data = (U'*central_data'*M)';
    Q = pca(proj_data);
    W = U*Q;
end