function [] = myTemplateMatcher(Img,Img_temp)
%           myTemplateMacher Function 2018
% ==========Code By: Usman Sheikh ==================%  
% This function will find all instances of template image in
% the input image and displays found templates in image and shows nummber
% of such objects found. 
%To execute, provide input image and template image names along with file type
%as input argument string
%---------------------------------------------------------
% reading input image and template image (temp1, temp9, temp12)%%
Img = imread(Img);
Img_temp = imread(Img_temp);

%Img=medfilt2(Image,[3 3]);
%Img_temp=medfilt2(Image_temp,[3 3]);
imshowpair(Img,Img_temp,'montage')
% Finding correlation between two images and displaying values
c1 = normxcorr2(Img_temp,Img);
c2 = normxcorr2(255-Img_temp,Img);
c = max(c1,c2);

figure;imshow(0.2<c<0.6,[]);hold on

d= 0.2<c<0.6;[];
%imwrite(d,'C:\Users\student\Desktop\Bitirme10022020\templateresult.tif');
figure
imshow(d);
figure, 
surf(c), shading flat
% If corralation value is greater than 0.75, 
%   template match is found 

[ypeak, xpeak] = find(c>1);
% Removing false match points
y = ypeak;
x = xpeak;
for n =1:length(y)-1
    if (abs(ypeak(n)-ypeak(n+1))<5)
        %printf("iteration")
        y(n) = 0;
        x(n) = 0;
    end
end
x = nonzeros(x);
y = nonzeros(y);

% Displaying found templates on input image and printing total matches 
yoffSet = y-size(Img_temp,1);
xoffSet = x-size(Img_temp,2);
%Img_med=medfilt2(Img,[20 20]);
figure
imshow(Img);
for m = 1:length(y)
    imrect(gca, [xoffSet(m)+1, yoffSet(m)+1, size(Img_temp,2), size(Img_temp,1)]);
end

title(['NO of Templates found = ',num2str(m)]);
disp('Template matching task completed');

end