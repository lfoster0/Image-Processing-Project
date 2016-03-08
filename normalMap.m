
function [ ] = normalMap ( )
% load the image file %
srcImage = imread('check', 'png');

% The 'height' in a normal map is represented by the brightness
% of the greyscale version of the image
srcGray = rgb2gray(srcImage);
[Gx,Gy] = getHeights(srcGray);

% Image must be square in this implementation
[sizeX, sizeY] = size(Gx);
normalMapImage = zeros(sizeX,sizeY,3,'uint8');

% Normal map image is made by taking the cross product
% of the X and Y gradient vectors of the pixel to get the
% vector perpendicular to the pixel which is the normal
% vector. Vector is normalized and then converted from a
% value of [-1.0, 1.0] to RGB values from 0-255
for row = 1:sizeY
    for col=1:sizeX
        xVect = [1,0,Gx(col,row)];
        yVect = [0,1,Gy(col,row)];
        nVect = cross(xVect,yVect);
        nVect = normr(nVect);
        rgbVect = ((nVect+1)/2) * 255;
        normalMapImage(col,row,1) = rgbVect(1);
        normalMapImage(col,row,2) = rgbVect(2);
        normalMapImage(col,row,3) = rgbVect(3);
    end
end

figure('Name', 'Source');
imshow(srcGray);

figure('Name','Horizontal Edge');
imshow(Gx);

figure('Name', 'Vertical Edge');
imshow(Gy);

figure('Name', 'Normal');
imshow(normalMapImage);

end

% Uses sobel edge detection to find the change in intensity
% in the X and Y to indicate the change in height of each pixel.
% The change in height of a pixel in each X or Y direction indicates
% the direction of its normal vector
function [Gx,Gy] = getHeights ( image )
    Sx = [-1 0 1; -2 0 2; -1 0 1];
	Sy = [-1 -2 -1; 0 0 0; 1 2 1];
    Gx = conv2(double(image),double(Sx));
    Gy = conv2(double(image),double(Sy));

end
