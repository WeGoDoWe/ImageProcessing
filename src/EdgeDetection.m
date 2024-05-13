% Read the image
originalImage = imread("../assets/edgeflower.jpg"); % Replace 'your_image.jpg' with the path to your image

% Convert the image to grayscale
grayImage = rgb2gray(originalImage);

% Define Sobel edge detection kernels
sobelX = [-1 0 1; -2 0 2; -1 0 1];
sobelY = [-1 -2 -1; 0 0 0; 1 2 1];

% Pad the image to handle boundaries
paddedImage = padarray(double(grayImage), [1, 1], 'replicate');

% Get dimensions of the padded image
[m, n] = size(paddedImage);

% Create matrices to store gradient magnitudes and directions
gradientMagnitudes = zeros(m-2, n-2);
gradientDirections = zeros(m-2, n-2);

% Perform convolution with Sobel kernels
for i = 1:m-2
    for j = 1:n-2
        % Extract the region of interest from the padded image
        roi = paddedImage(i:i+2, j:j+2);
        
        % Compute gradients in x and y directions
        gradientX = sum(sum(roi .* sobelX));
        gradientY = sum(sum(roi .* sobelY));
        
        % Compute magnitude and direction of the gradient
        gradientMagnitude = sqrt(gradientX^2 + gradientY^2);
        gradientMagnitudes(i, j) = gradientMagnitude;
        gradientDirection = atan2d(gradientY, gradientX); % Compute direction in degrees
        gradientDirections(i, j) = gradientDirection;
    end
end

% Threshold gradient magnitudes to obtain binary edge map
threshold = 50; % Adjust threshold as needed
binaryEdgeMap = gradientMagnitudes > threshold;

% Display original image and edge map
figure;
subplot(1,2,1);
imshow(originalImage);
title('Original Image');
subplot(1,2,2);
imshow(binaryEdgeMap);
title('Edge Map');
