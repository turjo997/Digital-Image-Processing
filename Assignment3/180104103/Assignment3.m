%My id is 180104103 --> 103
% remainder of (103 / 4) is 3
% So I use here 11 x 11 kernel filter

I = rgb2gray(imread('sunflower.jpg'));
I = imresize(I , [380,380]);

imwrite(I , 'input1.jpg');

figure;
imshow(I);


X = [-5 -4 -3 -2 -1 0 1 2 3 4 5;
    -5 -4 -3 -2 -1 0 1 2 3 4 5; 
    -5 -4 -3 -2 -1 0 1 2 3 4 5;
    -5 -4 -3 -2 -1 0 1 2 3 4 5; 
    -5 -4 -3 -2 -1 0 1 2 3 4 5;
    -5 -4 -3 -2 -1 0 1 2 3 4 5;
    -5 -4 -3 -2 -1 0 1 2 3 4 5;
    -5 -4 -3 -2 -1 0 1 2 3 4 5;
    -5 -4 -3 -2 -1 0 1 2 3 4 5;
    -5 -4 -3 -2 -1 0 1 2 3 4 5;
    -5 -4 -3 -2 -1 0 1 2 3 4 5]

Y = transpose(X);
[row , col] = size(I);

%For boundary issues I use here zero padding


I1 = zeros(row+20);

for i = 1 : row
    for j = 1 : col
        I1(i+5 , j+5) = I(i,j);
    end
end

Sigma=input('Enter the value of Sigma: ');


cons = (1 / (2.0 * pi * Sigma * Sigma));
X1 = X.^2;
Y1 = Y.^2;
Z = X1 + Y1;

res = ( -(Z) )/ (2.0 * Sigma * Sigma);
res1 = cons * exp(res);
newimg = uint8(zeros(row , col));

for i = 1 : row  
    for j = 1 : col   
        
        N = I1(i : i+10 , j : j+10);
        N = N .* res1;
        tot = sum(N(:));
        newimg(i , j) = tot;
    
    end
end


figure;
imshow(newimg);


imwrite(newimg , 'output.jpg');

