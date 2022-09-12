I = imread('peppers_color.jpg');

R = rgb2gray(I); 

[row , col] = size(R);

imshow(R);


X = uint8(ones(1, 8));

for i = 1 : 8
    X(i) = pow2(i-1);
end

slice1 = zeros(row, col);
slice2 = zeros(row, col);
slice3 = zeros(row, col);
slice4 = zeros(row, col);
slice5 = zeros(row, col);
slice6 = zeros(row, col);
slice7 = zeros(row, col);
slice8 = zeros(row, col);

for i = 1 : row
    for j = 1: col
        slice1(i, j) = bitand(R(i, j), X(1));
        slice2(i, j) = bitand(R(i, j), X(2));
        slice3(i, j) = bitand(R(i, j), X(3));
        slice4(i, j) = bitand(R(i, j), X(4));
        slice5(i, j) = bitand(R(i, j), X(5));
        slice6(i, j) = bitand(R(i, j), X(6));
        slice7(i, j) = bitand(R(i, j), X(7));
        slice8(i, j) = bitand(R(i, j), X(8));
    end
end

figure
subplot(2, 4, 1);
imshow(slice1); title('LSB Bit Plane');
subplot(2, 4, 2);
imshow(slice2); title('2nd Bit Plane');
subplot(2, 4, 3);
imshow(slice3); title('3rd Bit Plane');
subplot(2, 4, 4);
imshow(slice4); title('4th Bit Plane');
subplot(2, 4, 5);
imshow(slice5); title('5th Bit Plane');
subplot(2, 4, 6);
imshow(slice6); title('6th Bit Plane');
subplot(2, 4, 7);
imshow(slice7); title('7th Bit Plane');
subplot(2, 4, 8);
imshow(slice8); title('MSB Bit Plane');



