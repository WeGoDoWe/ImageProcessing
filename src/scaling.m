% Read the image
originalImage = imread("../assets/example.jpeg.jpg");

% Scale factors
scaleFactorX = 2; % Scale factor for width
scaleFactorY = 2; % Scale factor for height

% Dimensions of original image
[rows, cols, ~] = size(originalImage);

% Dimensions of scaled image
newRows = round(rows * scaleFactorY);
newCols = round(cols * scaleFactorX);

% Initialize scaled image
scaledImage = zeros(newRows, newCols, 3, 'uint8');

% Nearest neighbor interpolation
for i = 1:newRows
    for j = 1:newCols
        % Corresponding coordinates in original image
        x = round(i / scaleFactorX);
        y = round(j / scaleFactorY);
        
        % Assign pixel value
        scaledImage(i, j, :) = originalImage(min(x, rows), min(y, cols), :);
    end
end
imwrite(scaledImage, "scaled.jpeg");
scaledImage = imread("scaled.jpeg");

% Display original and scaled images
% Create a figure
figure;

% Display the original image
subplot(1, 2, 1);
imshow(originalImage);
title('Original Image');

% Calculate the width ratio between the two images
width_ratio = size(originalImage, 2) / size(scaledImage, 2);

% Display the scaled image with adjusted width
subplot(1, 2, 2);
imshow(scaledImage);
title('Scaled Image');
pos = get(gca, 'Position');
pos(3) = pos(3) * width_ratio;
set(gca, 'Position', pos);