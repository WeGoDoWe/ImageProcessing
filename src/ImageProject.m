% Read the image
originalImage = imread("../assets/download.jpeg");

% Display the original image (optional)
figure;
imshow(originalImage);
title('Original Image');

% Perform multiplication
multipliedImage = originalImage .* 2; % Multiply by 2 for demonstration purposes

% Display the multiplied image (optional)
figure;
imshow(multipliedImage);
title('Multiplied Image');

% Save the multiplied image (optional)
imwrite(multipliedImage, 'multiplied_image.jpg'); % Save as 'multiplied_image.jpg'
