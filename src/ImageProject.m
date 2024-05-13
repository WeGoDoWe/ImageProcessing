% Read the image
originalImage = imread("../assets/download.jpeg");

% Display the original image
figure;
subplot(1, 2, 1);
imshow(originalImage);
title('Original Image');

% Perform multiplication
multipliedImage = originalImage * 2; % Multiply by 2 for demonstration purposes

% Display the multiplied image
subplot(1, 2, 2);
imshow(multipliedImage);
title('Multiplied Image');

% Save the original and multiplied images
imwrite(originalImage, 'original_image.jpg'); % Save original image as 'original_image.jpg'
imwrite(multipliedImage, 'multiplied_image.jpg'); % Save multiplied image as 'multiplied_image.jpg'
