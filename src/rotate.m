% Read the image
originalImage = imread("../assets/example.jpeg.jpg");

% Convert angle from degrees to radians
theta = 45;
theta_rad = deg2rad(theta);

% Define rotation matrix
R = [cos(theta_rad), -sin(theta_rad); sin(theta_rad), cos(theta_rad)];

% Get size of original image
[m, n, ~] = size(originalImage);

% Define center of rotation
center_x = n / 2;
center_y = m / 2;

% Create grid of coordinates
[X, Y] = meshgrid(1:n, 1:m);

% Shift coordinates to have origin at center of image
X_shifted = X - center_x;
Y_shifted = Y - center_y;

% Apply rotation transformation
rotated_coordinates = R * [X_shifted(:)'; Y_shifted(:)'];
X_rotated = reshape(rotated_coordinates(1, :), size(X));
Y_rotated = reshape(rotated_coordinates(2, :), size(Y));

% Shift coordinates back
X_rotated = X_rotated + center_x;
Y_rotated = Y_rotated + center_y;

% Interpolate to get rotated image
rotatedImage = zeros(size(originalImage), 'uint8');
for channel = 1:3
    rotatedImage(:, :, channel) = interp2(X, Y, double(originalImage(:, :, channel)), X_rotated, Y_rotated, 'linear', 0);
end

% Display the original and rotated images
subplot(1, 2, 1);
imshow(originalImage);
title('Original Image');

subplot(1, 2, 2);
imshow(rotatedImage);
title('Rotated Image');
