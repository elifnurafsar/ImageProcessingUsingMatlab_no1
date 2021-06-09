img = imread('img.jpeg');
L = imresize(img, [512,512]);
I = im2gray(L);
figure
imshow(uint8(L));

resized = resizeNearestNghbrRGB(L,1.5);
figure
imshow(uint8(resized));

resized = resize_bilinear_rgb(L,1.5);
figure
imshow(uint8(resized));
