# ImageProcessingUsingMatlab_no1
BIL467 HW1
In this homework, the instructor gave us some problems to solve. This report is written for explain how I created solutions for each problem, which points I had difficulities and my observations from this task. 
-We need a 512*512 grey scale image. My phone camera can took colorful and standart sized photos, to obtain some image which is suitable for these constraints I used
``
L = imresize('img.jpeg', [512,512]);
I = im2gray(L);
``
functions. Then I coded a function which recolorize the image according to given number parameter (if the current pixel's value is lower than parameter change pixel's value with 0 elsewhere change it as 255).
Here is my input picture and some different outputs using this function.

![2021-06-09](https://user-images.githubusercontent.com/60623941/121318187-b0a38480-c913-11eb-8aa4-83c76b850609.png)
