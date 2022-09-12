I = imread('cameraman.png');

[row , col] = size(I);

B = 0;
A = 10000000;

for i = 1 : row
    for j = 1 : col
        if I(i,j) > B
            B = I(i,j);
        end
        
        if I(i,j) < A
            A = I(i,j);
        end
              
    end
end

    %disp(A);
    %disp(B);
    
D = B - A;
    
M = row - 1;
    
R = uint8(ones(row, col));
    
    
for i = 1 : row
    for j = 1 : col
        
        x = ( I(i,j) - A ) / D ;
        R(i , j) = (x * M) + A; 
        
    end
end
    
    
figure;
imshow(I);
    
figure;
imshow(R);

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
    

Y = zeros(1,256);

for i=1:row
    for j =1:col
        temp1 = R(i,j) + 1;
        Y(temp1)=Y(temp1)+1;
    end
end

figure;
bar(Y);
title('Hist plot');
xlabel('1 to 256 pixel values');
ylabel('frequency');



figure;
subplot(2,2,1);
imshow(I);

subplot(2,2,3);
imshow(R);


subplot(2,2,2);
bar(X);
title('Hist plot');
xlabel('1 to 256 pixel values');
ylabel('frequency');


subplot(2,2,4);
bar(Y);
title('Hist plot');
xlabel('1 to 256 pixel values');
ylabel('frequency');