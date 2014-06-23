function y = knn(X, X_train, y_train, K)
%KNN k-Nearest Neighbors Algorithm.
%
%   INPUT:  X:         testing sample features, P-by-N_test matrix.
%           X_train:   training sample features, P-by-N matrix.
%           y_train:   training sample labels, 1-by-N row vector.
%           K:         the k in k-Nearest Neighbors
%
%   OUTPUT: y    : predicted labels, 1-by-N_test row vector.
%

% YOUR CODE HERE
test_N = size(X,2);
if(K>size(X_train,2))
	error(message('the train number is less than K'));
end

y = zeros(1,test_N);

D = EduDist2(X_train',X',0);
[Y I]=sort(D);
label = y_train(I(1:K,:));
if(K==1)
    y = label;
else
    [nelements center]=hist(label,min(y_train):max(y_train));
    [val I] = max(nelements);
    y = center(I)';
end


end

