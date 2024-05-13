% Load the two big images
image1 = imread('your_image.jpg'); % Replace 'image1.jpg' with the path to your first image
image2 = imread('your_image.png'); % Replace 'image2.jpg' with the path to your second image

% Convert images to double to prevent overflow during arithmetic operations
image1 = double(image1);
image2 = double(image2);

% Resize the larger image to match the dimensions of the smaller one
image1 = imresize(image1,[720,1080]);
image2 = imresize(image2, [720, 1080]);
size(image1)
size(image2)
addition_result = image1 + image2;

% Subtraction of two images using matrix subtraction
subtraction_result = image1 - image2;

% Display the results
subplot(1, 3, 1), imshow(uint8(image1)), title('Image 1');
subplot(1, 3, 2), imshow(uint8(image2)), title('Image 2');
subplot(1, 3, 3), imshow(uint8(addition_result)), title('Addition Result');

figure;
subplot(1, 2, 1), imshow(uint8(image1)), title('Image 1');
subplot(1, 2, 2), imshow(uint8(subtraction_result)), title('Subtraction Result');
imwrite(addition_result, 'addition_image.jpg');
imwrite(subtraction_result, 'sub_image.jpg');