% Read the background, objects A, and B
background = imread("../assets/red_carpet.jpg");
A = imread("../assets/tom.png");
B = imread("../assets/jerry.png");

% Image addition
object = A + B;

% Resize background to match the size of object
background = imresize(background, [size(object, 1), size(object, 2)]);

% Initialize new image matrices
Im3 = uint8(zeros(size(object)));
whiteImg = uint8(ones(size(object)));

% Image division
mask = whiteImg ./ object;

% Logical AND
im3 = uint8(mask & background);

% Create a mask image where masked areas are black
maskImage = uint8(ones(size(background)) * 255);
maskImage(im3 == 0) = 0; % Set masked areas to black

% Image multiplication
finalImg = (background .* im3) + object;

% Display original objects, background, mask, and final image
figure;

subplot(2, 3, 1);
imshow(A);
title('Object A');

subplot(2, 3, 2);
imshow(B);
title('Object B');

subplot(2, 3, 3);
imshow(object);
title('Object A + B');

subplot(2, 3, 4);
imshow(background);
title('Background');

subplot(2, 3, 5);
imshow(maskImage);
title('Mask');

subplot(2, 3, 6);
imshow(finalImg);
title('Final Image');
