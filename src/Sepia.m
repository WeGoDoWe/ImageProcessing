% Read the input RGB image
inputImage = imread("../assets/display.jpeg");

% Sepia transformation matrix
sepiaMatrix = [0.393 0.769 0.189; ...
               0.349 0.686 0.168; ...
               0.272 0.534 0.131];

% Apply the sepia transformation to each pixel
sepiaImage = zeros(size(inputImage));

for i = 1:size(inputImage, 1)
    for j = 1:size(inputImage, 2)
        pixel = double(reshape(inputImage(i, j, :), 1, [])); % Reshape to row vector
        sepiaPixel = pixel * sepiaMatrix';   % Apply sepia transformation
        sepiaImage(i, j, :) = sepiaPixel;   % Assign the transformed value to the pixel
    end
end

% Clip values to range [0, 255]
sepiaImage(sepiaImage > 255) = 255;

% Convert back to uint8
sepiaImage_uint8 = uint8(sepiaImage);

% Display the original and sepia images
figure;
subplot(1, 2, 1);
imshow(inputImage);
title('Original Image');

subplot(1, 2, 2);
imshow(sepiaImage_uint8);
title('Sepia Filtered Image');

% Save the sepia image
imwrite(sepiaImage_uint8, 'sepia_image.jpg');
