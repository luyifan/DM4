% YOUR CODE HERE
load('ORL_data', 'fea_Train', 'gnd_Train', 'fea_Test', 'gnd_Test');

[N,P]=size(fea_Train);
mu=mean( fea_Train );
sigma=sqrt(var(fea_Train));
fea_Train=(fea_Train-repmat(mu,N,1))./repmat(sigma,N,1);

t='original picture';
show_faceWithTitle(fea_Train,t);
[eigvector, eigvalue] = pca(fea_Train);

K = [8, 16, 32, 64,128];
for i=1:length(K)
   figure 
   t=sprintf('When choose K=%d the visual new image after dimensionality reduction' , K(i));
   recover_Train=fea_Train*eigvector(:,1:K(i))*eigvector(:,1:K(i))';
   show_faceWithTitle(recover_Train,t);
end

