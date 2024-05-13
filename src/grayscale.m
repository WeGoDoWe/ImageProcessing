% Read the PNG file
input_image = imread("../assets/display.jpeg");

% Check if the input image is RGB or grayscale
if size(input_image, 3) == 3
    % Convert RGB image to grayscale using linear algebra
    grayscale_image = double(input_image(:,:,1)) * 0.2989 + double(input_image(:,:,2)) * 0.5870 + double(input_image(:,:,3)) * 0.114;
else
    % If the input image is already grayscale, just copy it
    grayscale_image = input_image;
end

% Convert the grayscale image to uint8 data type
grayscale_image = uint8(grayscale_image);

% Save the grayscale image
imwrite(grayscale_image, 'grayscale_image.jpg');
disp('Conversion to grayscale completed and saved as grayscale_image.jpg');

% Display original and grayscale images side by side
figure;
subplot(1, 2, 1);
imshow(input_image);
title('Original Image');

subplot(1, 2, 2);
imshow(grayscale_image);
title('Grayscale Image');

sgtitle('Original vs. Grayscale Image');
