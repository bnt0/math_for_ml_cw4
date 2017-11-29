function U = PCA(data)
    data_mean = mean(data, 1);
    central_data = data - repmat(data_mean, size(data, 1),1);
    covar = central_data * central_data';
    [V, D] = eigs(covar, size(central_data, 1)-1);
    U = central_data' * V * D^-0.5;

%  % alternative solution using the Matlab built-in pca function
%     U = pca(data);
end