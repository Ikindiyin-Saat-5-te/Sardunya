%imfind circle example%

RGB = imread('denemergb2gray.tif');
dd=im2double(RGB);
imshow(RGB);
Rmin = 120;
Rmax = 180;
[center, radius] = imfindcircles(RGB,[Rmin Rmax],'Sensitivity',0.989,'ObjectPolarity','dark');
% Display the circle
viscircles(center,radius);
% Display the calculated center
hold on;
if isempty(center)
else
plot(center(:,1),center(:,2),'yx','LineWidth',2);
hold off;
end
