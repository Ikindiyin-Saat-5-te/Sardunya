
%image substraction total code with dilating cleaning and everything that
%we will need%%


img1=imread('templateresult.tif');

% [r, c] = size(img1);
% 
% bintemp=zeros(r,c);
% for i=1:r
%     for j=1:c
%         if img1(i,j)==255
%             bintemp(i,j)=0;
%             
%         else 
%             bintemp(i,j)=1;
%         end
%     end
% end    
figure,imshow(1-img1)
se = strel('square',8);
dilatedimg=imdilate(1-img1,se);
figure, imshow(dilatedimg);
cleanedimg = bwareaopen(dilatedimg, 3000);
figure
imshow(cleanedimg);
de=strel('square',25);
extendedclean=imdilate(cleanedimg,de);
%imwrite(cleanedimg,'C:\Users\student\Desktop\Bitirme_04022020a\2bitimages\cleanedimg.tif')

% dilatedimg=imread('cleanedimg95000.tif');
% figure, imshow(dilatedimg);

img2=imread('denemergb2gray.tif');

[row ,column] = size(img2);

binrgb=zeros(row,column);
for i=1:row
    for j=1:column
        if img2(i,j)==255
            binrgb(i,j)=1;
            
        else 
            binrgb(i,j)=0;
        end
    end
end    
figure,imshow(binrgb)

yeni=zeros(row,column);
for i1=1:row
    for j1=1:column
        if binrgb(i1,j1)+extendedclean(i1,j1)>=1
            yeni(i1,j1)=1;
       
        else
            yeni(i1,j1)=0;
        end
    end
end 

figure,imshow(yeni);
imwrite(yeni,'C:\Users\student\Desktop\Bitirme10022020\enensonimage.tif')




