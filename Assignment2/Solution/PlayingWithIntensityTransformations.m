I = imread('input.jpg');

I = rgb2gray(I);

I = imresize(I , [256 , 256]);
imshow(I);

[row , col] = size(I);

X = zeros(1,256);

for i=1:row
    for j =1:col
        temp = I(i,j) + 1;
        X(temp)=X(temp)+1;
    end
end


figure;
bar(X);
title('Hist plot');
xlabel('1 to 256 pixel values');
ylabel('frequency');



% Power Transformed Image
I_pow = im2double(I);
c = 1.5;
prompt ='Write the Gama Value: ';
gamma = input(prompt);


for i = 1 : row
    for j = 1 : col
       I_pow(i , j) = c * (I_pow(i , j) .^ gamma);
    end
end

I_pow = im2uint8(I_pow);

X_pow = zeros(1,256);

for i=1:row
    for j =1:col
        temp = I_pow(i,j) + 1; 
        X_pow(temp)=X_pow(temp) + 1;
    end
end



figure;
imshow(I_pow);

figure;
bar(X_pow);
title('Hist plot');
xlabel('1 to 256 pixel values');
ylabel('frequency');



prompt ='Write the Threshold Value: ';
A = input(prompt);

IT = I;

for i = 1 : row
    for j = 1 : col
       if IT(i , j) < A
           IT(i , j) = I(i , j) + 0.5 * I(i , j);
       else
           IT(i , j) = I(i , j) - 0.25 * I(i , j);
       end
    end
end

IT = im2uint8(IT);

X_thres = zeros(1, 256);
for i=1:row
    for j=1:col
        temp = IT(i, j)+1;
        X_thres(temp) = X_thres(temp)+1;
    end
end


figure;
imshow(IT);


figure;
bar(X_thres);
title('Hist plot');
xlabel('1 to 256 pixel values');
ylabel('frequency');



I_log = im2double(I);

c = 1.9;
for i = 1 : row
    for j = 1 : col
       I_log(i , j) = c * log(1 + I_log(i , j));
    end
end

I_log = im2uint8(I_log);

X_log = zeros(1, 256);

for i=1:row
    for j=1:col
        temp = I_log(i, j)+1;
        X_log(temp) = X_log(temp)+1;
    end
end



figure;
imshow(I_log);


figure;
bar(X_log);
title('Hist plot');
xlabel('1 to 256 pixel values');
ylabel('frequency');



I_neg = uint8(zeros(row , col));

for i = 1 : row
    for j = 1 : col
        I_neg(i , j) = 255 - I(i , j);
    end
end

X_neg = zeros(1, 256);

for i=1:row
    for j=1:col
        temp = I_neg(i, j)+1;
        X_neg(temp) = X_neg(temp)+1;
    end
end



figure;
imshow(I_neg);


figure;
bar(X_neg);
title('Hist plot');
xlabel('1 to 256 pixel values');
ylabel('frequency');