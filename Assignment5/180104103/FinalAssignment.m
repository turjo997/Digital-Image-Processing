I =  im2double(imread('Image1.jpg'));

[row , col] = size(I);

%figure;
%imshow(I);


%%%%%%  LAPLACIAN FILTER %%%%%%%%%
LF   = [0 -1 0 ;
       -1 4 -1 ;
        0 -1 0];
       
%For boundary issues I use here zero padding
I1 = zeros(row+4);
for i = 1 : row
    for j = 1 : col
        I1(i+1 , j+1) = I(i,j);
    end
end
    
Laplaceimg = (zeros(row , col));
LaplaceEnhancedimg = (zeros(row , col));

for i = 1 : row  
    for j = 1 : col   
        
        N = I1(i : i+2 , j : j+2);
        N = N .* LF;
        N = sum(N(:));
        Laplaceimg(i , j) = N; 
    end
end


LaplaceEnhancedimg = (I - Laplaceimg);

%figure;
%imshow(Laplaceimg , []);

%figure;
%imshow(LaplaceEnhancedimg );
    
    
sx = [-1 0 1;
      -2 0 2;
      -1 0 1];
sy = [ 1  2  1;
       0  0  0;
      -1 -2 -1];

Sobelx = (zeros(row , col));
Sobely = (zeros(row , col));   
    
    
for i = 1 : row 
    for j = 1 : col
       
        N = I1(i : i+2 , j : j+2);
        N = N .* sx;
        N = sum(N(:));
        Sobelx(i,j) = N;
        M = I1(i : i+2 , j : j+2);
        M = M .* sy;
        M = sum(M(:)); 
        Sobely(i,j) = M;
        
    end
end

Sobel_image= sqrt(Sobelx.*Sobelx + Sobely.*Sobely);

T = 0.1;
for i = 1 : row
    for j = 1 : col
        
        if Sobel_image(i , j) > T
            Sobel_image(i , j) = Sobel_image(i , j);
        else
            Sobel_image(i , j) = 0;
        end
        
    end
end


%figure;
%imshow(Sobel_image);

%For boundary issues I use here zero padding
Sobel_image1 = zeros(row+8);

for i = 1 : row
    for j = 1 : col
        Sobel_image1(i+2 , j+2) = Sobel_image(i,j);
    end
end


AVGimg = (zeros(row , col));

for i = 1 : row  
    for j = 1 : col   
        
        N = Sobel_image1(i : i+4 , j : j+4);
        tot = mean(N(:));
        AVGimg(i , j) = tot;
    
    end
end

%figure;
%imshow(AVGimg);


productIMG = LaplaceEnhancedimg .* AVGimg ;  

%figure;
%imshow(productIMG);


addIMG = I + productIMG ;


%figure;
%imshow(addIMG);


c = 1;
gamma = 0.5;
powerlawIMG = zeros(row , col);

for i = 1 : row
    for j = 1 : col
       powerlawIMG(i , j) = c * (addIMG(i , j) .^ gamma);
      
    end
end

%figure;
%imshow(powerlawIMG);

figure;
subplot(2, 4, 1); 
imshow(I); 
title('a. Input Image');

subplot(2, 4, 2); 
imshow(Laplaceimg , []); 
title('b. Laplace Image');


subplot(2, 4, 3);
imshow(LaplaceEnhancedimg); 
title('c. Enhanced Laplace Image');

subplot(2, 4, 4); 
imshow(Sobel_image); 
title('d. Sobel Image');

subplot(2, 4, 5); 
imshow(AVGimg); 
title('e. Average Image');

subplot(2, 4, 6); 
imshow(productIMG);
title('f. Product of c and e');

subplot(2, 4, 7);
imshow(addIMG);
title('g. Sum of a and f');

subplot(2, 4, 8); 
imshow(powerlawIMG); 
title('h. Power Law Transform Image');


