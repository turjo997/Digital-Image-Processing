I = imread('input.jpg');

%I = i(:,:,3);

I = imresize(I , [256,256]);

figure; 
imshow(I);
title('Orginal Image')
[row, col , z] = size(I);
K = uint8(ones(row, col , z));

for plane = 1:z
    for i = 1:row
        for j = 1:col
            K(i,j , plane) = I(i,col - j + 1 , plane);
        end
    end
end
figure; 
imshow(K);
title('Mirror Image')

M = uint8(ones(row, col*2 , z));

for plane = 1:z
    for i = 1:row
        for j = 1:col
            M(i,j , plane) = I(i,j , plane);
        end
    end
end

for plane = 1:z
    for i = 1:row
        for j = 1:col
            M(i,j+256, plane) = K(i,j , plane);
        end
    end
end

figure; 
imshow(M);
title('Merged Image')

imwrite(K , 'output.jpg');