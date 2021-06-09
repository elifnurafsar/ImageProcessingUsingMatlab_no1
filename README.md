# ImageProcessingUsingMatlab_no1
BIL467 HW1
SETUP
1)Download the files soru_3_4_5 and odev1soru6
2)double tap to main functions
3)Click the run button which located in editor bar.
*you can also add the codes which are commented.
Done...
In this homework, the instructor gave us some problems to solve. This report is written for explain how I created solutions for each problem, which points I had difficulities and my observations from this task. 
-We need a 512*512 grey scale image. My phone camera can took colorful and standart sized photos, to obtain some image which is suitable for these constraints I used
``
img = imread('img.jpeg');
L = imresize(img, [512,512]);
I = im2gray(L);
``
functions. Then I coded a function which recolorize the image according to given number parameter (if the current pixel's value is lower than parameter change pixel's value with 0 elsewhere change it as 255).
Here is my input picture and some different outputs using this function.

![2021-06-09](https://user-images.githubusercontent.com/60623941/121318465-f2ccc600-c913-11eb-871e-cbcc2da91e59.png)

with the parameter 70 the output is:

![2021-06-09 (1)](https://user-images.githubusercontent.com/60623941/121318999-75ee1c00-c914-11eb-827a-42de34e0b6ba.png)

with the parameter 120 the output is:

![2021-06-09 (2)](https://user-images.githubusercontent.com/60623941/121319063-8605fb80-c914-11eb-8dd4-035fc27968a5.png)

with the parameter 187 the output is:

![2021-06-09 (3)](https://user-images.githubusercontent.com/60623941/121319105-8e5e3680-c914-11eb-9af7-e1a0bd209f07.png)

-In second (4th) task I use my lecture notes to code a function for nearest neighbor interpolation. As input, I gave same image with question 1 and here is my 2'nd part of main code and the main code's whole output:

``
resized = resizeNearestGreyScale(I,0.7);
figure
imshow(uint8(resized));
``
![2021-06-09 (4)](https://user-images.githubusercontent.com/60623941/121320625-00834b00-c916-11eb-9be9-471dd8582666.png)

*First figure is 512x512 and the second figure is 358x358.

  In this task I did not realize that I should cast my matrix-image- using ``uint8(my_matrix)`` function. I tried to show my result using ``imshow(resized);`` line.
Then I ask for a help to my instructors. They helped me then I staarted to cast every image to uint8 before display them.

For bilinear interpolation problem I write code which finds nearest four points of given pixel then compute their weighted distance by using hypotenuse of the triangle with the legs as |x2-x1| and |y2-y1|. But this solution does not worked for me. Then I made some researches and found this algorithm:
``
res(x,y) = ( 1-difference_in_Y_axis )*( difference_in_X_axis * val_top_rght_pxl + (1-difference_in_X_axis)*val_top_left_pxl ) + difference_in_Y_axis*( difference_in_X_axis * val_bottom_right_pxl + (1 - difference_in_X_axis) * val_bottom_left_pxl );
``
Then I coded a code using given weighted-distance algorithm.  Here is my main code's 3rd part and my whole outputs.
``
resized = resize_bilinear(I,0.7);
figure
imshow(uint8(resized));
``

![2021-06-09 (5)](https://user-images.githubusercontent.com/60623941/121326020-cf594980-c91a-11eb-860d-93c9d2c12c4d.png)

here is the zoom-in examples:
``
resized = resizeNearestGreyScale(I,1.7);
figure
imshow(uint8(resized));

resized = resize_bilinear(I,1.7);
figure
imshow(uint8(resized));
``
![2021-06-09 (6)](https://user-images.githubusercontent.com/60623941/121331254-60322400-c91f-11eb-8cea-317633104c9b.png)


  From this 2 method (bilinear and nearest neighbor interpolation) I can see the difference in the quality of images using different interpolation techiques, both in shrinking and zoom-in processes. In bilinear interpolation the umbrella's right side in the image has smoother and mixed tones while, in the nearest neighbor interpolation, the same part of the image seems like interrupted bold vertical lines.

  In this task I tried `` img_res = imresize(I, 1.7, 'bicubic'); `` function but cannot write code for this interpolation.
  
  -In third (5th) task I code bilinear and nearest neighbor interpolation methods for rgb images. In this section I just added one for foop for (3'rd) rgb dimension to old functions.For each pixel in image I processed each red, green and blue values and added these values to my new 3 dimensioned matrice's color-rgb- dimension.
    Here is an example from neaarest neighbor for rgb images function:
    
    ``
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

    ``
    
input:

![2021-06-09 (12)](https://user-images.githubusercontent.com/60623941/121337047-ca00fc80-c924-11eb-8e8e-5e995a4ed65d.png)

Nearest Neighbor interpolation output:

![2021-06-09 (14)](https://user-images.githubusercontent.com/60623941/121339071-c9696580-c926-11eb-9503-5f5c8c03f29d.png)


Bilinear interpolation output:

![2021-06-09 (15)](https://user-images.githubusercontent.com/60623941/121339131-d8501800-c926-11eb-8891-25e979164de8.png)


  Also, when I worked with rgb images I can see the difference between Bilinear interpolation and Nearest Neighbor interpolation. In Bilinear interpolation we can create more smother and realistic images than the ones we created ehen using Nearest Neighbor interpolation.

-In 6th task I create an image using paint. Then I followed steps given in assignment paper. I code a loop that iterates for size of image timesand computes distance pixels according to border lines. 
  In this process first I tried matlab functions such as ``bwdist();`` and ``bwmorph(BW,'skel',Inf); ``
Here are my input and output images.
Input:

![bw](https://user-images.githubusercontent.com/60623941/121387379-4dd1dd80-c953-11eb-81b4-bc3b98145b94.png)

Output:

![2021-06-09 (21)](https://user-images.githubusercontent.com/60623941/121387590-75c14100-c953-11eb-9a69-9f253810ef34.png)

  In this task first, I tought that I should create a zero matrix and specify input image's borders as 1's and every other pixel (include the area of the image to background) as 0 in this matrix and update every 8 neighbors which are 0. Then I iterated DistanceTransform from 2 to size of the image. Then I got this output:
  
  ![2021-06-09 (20)](https://user-images.githubusercontent.com/60623941/121388714-61317880-c954-11eb-9941-ca2d4c297188.png)

  
   But this output does not look like which we saw in the class. Then I deleted the method -named contour- which makes shape's inside area and background zero.
   I continue with DistanceTransform function, iterated from 1 to size of the image.


