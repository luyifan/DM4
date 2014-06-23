function img = hack_pca(filename)
% Input: filename -- input image file name/path
% Output: img -- image without rotation


img_r = double(imread(filename));
% YOUR CODE HERE
[ X , Y ] = size ( img_r ) ;
location=[];
for i=1:X
    for j=1:Y
        if img_r(i,j)~=255
            location=[location;[j,i]];
        end
    end
end
[ eigvector , eigvalue ] = pca( location );
theta=atan(eigvector(2,1)/eigvector(1,1));
img = imrotate(img_r, theta * 180 / pi);
imagesc(img);colormap(gray);axis image; axis off;
end