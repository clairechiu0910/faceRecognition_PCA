function vectors = computeEigenface(A, d)
    n = size(A, 1);

    A_ = mean(A.');

    As = [];
    for i = 1:size(A, 2)
        As = [As A(:, i) - A_.']; 
    end
    
    C = As * As.' / (size(A, 2) - 1);
    
    [eigenvector eigenvalue] = eig(C);
    eigenvalue = diag(eigenvalue);

    eigens = [eigenvalue eigenvector.'];
    eigens_sorted = sortrows(eigens, 'descend');
    featureVector = eigens_sorted(:, 2:n+1).';
    vectors = featureVector(:, 1:d);  
end