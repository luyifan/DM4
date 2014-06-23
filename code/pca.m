function [eigvector, eigvalue] = PCA(data)
%PCA	Principal Component Analysis
%
%             Input:
%               data       - Data matrix. Each row vector of fea is a data point.
%
%             Output:
%               eigvector - Each column is an embedding function, for a new
%                           data point (row vector) x,  y = x*eigvector
%                           will be the embedding result of x.
%               eigvalue  - The sorted eigvalue of PCA eigen-problem.
%

% YOUR CODE HERE
%N=size ( data , 1 ) ;
%m=mean ( data ) ;
%M=m'*ones(1,N);
%XX=data-M';
XX=data;
covarince=cov(XX);
size ( covarince )
p=size ( data , 2 );
[ eigvector , eigvalue ] = eigs ( covarince , p ,'LM' ) ;

end