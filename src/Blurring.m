% Read the image
originalImage = imread("../assets/download.jpeg");

% Define Gaussian blur kernel
kernelSize = 5; % Kernel size (odd number)
sigma = 2; % Standard deviation
blurKernel = fspecial('gaussian', [kernelSize, kernelSize], sigma);

% Apply convolution to blur the image
blurredImage = imfilter(originalImage, blurKernel, 'conv', 'replicate');

% Display original and blurred images
figure;
subplot(1,2,1);
imshow(originalImage);
title('Original Image');
subplot(1,2,2);
imshow(blurredImage);
title('Blurred Image');
