// Read image (using  IPCV toolbox)
img = imread("D:\image_2.jpg");
// change to gray image
if size(img, 3) == 3 then
    img_gray = rgb2gray(img);
else
    img_gray = img;
end

// Implement Histogram Equalization
img_eq = imhistequal(img_gray);

// Display 2 image before and after equalization
subplot(1,2,1);
imshow(img_gray);
xtitle("Original Image");

subplot(1,2,2);
imshow(img_eq);
xtitle("Equalized Image");
