img = imread('img.jpeg');
L = imresize(img, [512,512]);
I = im2gray(L);
figure
imshow(uint8(L));

%colorize 1 bit
colorized=colorize1bit(I,122);
figure
imshow(colorized);

%zoom
resized = resize_bilinear(I,1.5);
figure
imshow(uint8(resized));

resized = resizeNearestGreyScale(I,1.5);
figure
imshow(uint8(resized));

resized = resizeNearestNghbrRGB(L,1.5);
figure
imshow(uint8(resized));

resized = resize_bilinear_rgb(L,1.5);
figure
imshow(uint8(resized));

%shrink
resized = resize_bilinear(I,0.7);
figure
imshow(uint8(resized));

resized = resizeNearestGreyScale(I,0.7);
figure
imshow(uint8(resized));

resized = resizeNearestNghbrRGB(L,0.7);
figure
imshow(uint8(resized));

resized = resize_bilinear_rgb(L,0.7);
figure
imshow(uint8(resized));
