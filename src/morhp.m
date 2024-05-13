% Load the two images
image1 = imread('../assets/tom.png');
image2 = imread('../assets/jerry.png');

% Define corresponding points manually or using some feature detection algorithm
points1 = [1 1; 2 2; 3 3]; % Points in image 1
points2 = [1 1; 2 2; 3 3]; % Corresponding points in image 2

% Compute transformation matrix
T = fitgeotrans(points1, points2, 'affine');

% Define the size of the output image
outputSize = size(image1);

% Warp image1 to image2
warpedImage1 = imwarp(image1, T, 'OutputView', imref2d(outputSize));

% Morphing (blend images)
alpha = 0.5; % Blend factor
morphedImage = alpha * warpedImage1 + (1 - alpha) * image2;

% Display the result
imshow(morphedImage);
