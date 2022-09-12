I = imread('cameraman.png');

[row, col] = size(I);

X = zeros(1,256);

for i=1:row
    for j =1:col
        
        temp = I(i,j) + 1;
        X(temp)=X(temp) +1;
    end
end

sum = 0;

for i = 1 : 256
    sum = sum + X(i);
end


PDF = zeros(1,256);

for i = 1 : 256
    PDF(i) = X(i) / sum ;
end


CDF = zeros(1,256);

CDF(1) = PDF(1);

for i = 2 : 256
    CDF(i) = CDF(i-1) + PDF(i);
end

L = 255;

CDF1 = zeros(1,256);

for i = 1 : 256
    CDF1(i) = CDF(i) * L;
end

RoundingOff = zeros(1,256);

for i = 1 : 256
    RoundingOff(i) = round(CDF1(i));
end

NewImg = uint8(zeros(1,256));

for i = 1 : row
    for j = 1 : col
    
     temp = I(i , j) + 1;   
     NewImg(i , j) = RoundingOff(temp);
    
    end
end

M = zeros(1,256);

for i=1:row
    for j =1:col
        temp = NewImg(i,j) + 1;
        M(temp)=M(temp)+1;
    end
end


figure
subplot(2, 2, 1);
imshow(I);

subplot(2, 2, 3);
bar(X);
title('Hist plot');
xlabel('1 to 256 pixel values');
ylabel('frequency');

subplot(2, 2, 2);
imshow(NewImg);

subplot(2, 2, 4);
bar(M);
title('Hist plot');
xlabel('1 to 256 pixel values');
ylabel('frequency');



