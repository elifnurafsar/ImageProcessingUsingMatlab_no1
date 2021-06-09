I = imread('bw.png');
L=imresize(I, [512,512]);
E = colorize1bit(L,1);
%below code is just for try
%D = bwdist(E); 
%figure
%imshow(D,[]);
[x,y]=size(E);
for i=1:x
    E=DistanceTransform(E,i);
end
E=normalization(E);
figure
imshow(uint8(E));