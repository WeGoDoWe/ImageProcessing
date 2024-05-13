% Read the target image file
img = imread("../assets/download.jpeg");

% Create the reflection matrix for vertical reflection
reflection_matrix = [-1 0 0; 0 1 0; 0 0 1]; % 3x3 matrix

% Apply the reflection transformation
tform = affine2d(reflection_matrix);
mirror_image = imwarp(img, tform);

% Display the original and mirror images side by side
figure;
subplot(1, 2, 1);
imshow(img);
title('Original Image');

subplot(1, 2, 2);
imshow(mirror_image);
title('Mirror Image');

sgtitle('Original vs. Mirror Image');
