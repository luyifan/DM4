load('ORL_data', 'fea_Train', 'gnd_Train', 'fea_Test', 'gnd_Test');

% YOUR CODE HERE

% 1. Feature preprocessing
% 2. Run PCA
% 3. Visualize eigenface
% 4. Project data on to low dimensional space
% 5. Run KNN in low dimensional space
% 6. Recover face images form low dimensional space, visualize them

[N,P]=size(fea_Train);
mu=mean( fea_Train );
sigma=sqrt(var(fea_Train));
fea_Train=(fea_Train-repmat(mu,N,1))./repmat(sigma,N,1);

[N,P]=size(fea_Test);
mu=mean( fea_Test );
sigma=sqrt(var(fea_Test));
fea_Test=(fea_Test-repmat(mu,N,1))./repmat(sigma,N,1);


[eigvector, eigvalue] = pca(fea_Train);
show_face(eigvector');
K = [8, 16, 32, 64,128];
for i=1:length(K)
    fea_Test1 = fea_Test*eigvector(:,1:K(i));
    fea_Train1 = fea_Train*eigvector(:,1:K(i));
    label = knn(fea_Test1',fea_Train1',gnd_Train',1);
    error=length(find(label~=gnd_Test'))/length(gnd_Test);
    fprintf ( 'PCA when choose K=%d , the test error rate =%f\n' , K(i),error );
end



options=[];
options.Fisherface=1;
[eigvector, eigvalue] = LDA(gnd_Train,options,fea_Train);
K = [8, 16, 32 ];
for i=1:length(K)
    fea_Test1 = fea_Test*eigvector(:,1:K(i));
    fea_Train1 = fea_Train*eigvector(:,1:K(i));
    label = knn(fea_Test1',fea_Train1',gnd_Train',1);
    error=length(find(label~=gnd_Test'))/length(gnd_Test);
    fprintf ( 'LDA when choose K=%d , the test error rate =%f\n' , K(i),error );
end

