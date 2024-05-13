% Read the input RGB image
inputImage = imread("../assets/display.jpeg");

% Apply the negative filter to each pixel
negativeImage = 255 - inputImage;

% Display the original and negative images
figure;
subplot(1, 2, 1);
imshow(inputImage);
title('Original Image');

subplot(1, 2, 2);
imshow(negativeImage);
title('Negative Filtered Image');

% Save the negative image
imwrite(negativeImage, 'negative_image.jpg');
