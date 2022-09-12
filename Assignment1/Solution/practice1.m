I = imread('input.jpg');
I = imresize(I , [300,300]);

figure; 
imshow(I);
title('Orginal Image1')

J = imread('input1.jpg');
J = imresize(J , [300,300]);

figure; 
imshow(J);
title('Orginal Image2')

[img1_row, img1_col ,z] = size(I);
[img2_row, img2_col ,z] = size(J);
K = uint8(ones(img1_row, img1_col , z));

disp(img1_col)

img1_col1 = I(: , 1 : 50 , :);
img2_col2 = J(: , 51 : 100 , :);
img1_col3 = I(:  , 101:150 , :);
img2_col4 = J(: , 151 : 200 , :);
img1_col5 = I(: , 201 : 250 , :);
img2_col6 = J(: , 251 : 300 , :);

K = [img1_col1,img2_col2,img1_col3,img2_col4,img1_col5,img2_col6];
figure;
imshow(K);
title('Merged Image')

imwrite(K , 'merge.jpg');
