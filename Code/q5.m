clc
clear
close all

I = rgb2gray(imread('testImage.bmp'));

X = imadjust(I);

% Threshold image - manual threshold
BW = X > 198;

% Open mask with disk
radius = 1;
decomposition = 0;
se = strel('disk', radius, decomposition);
BW = imopen(BW, se);

% Dilate mask with disk
radius = 3;
decomposition = 0;
se = strel('disk', radius, decomposition);
BW = imdilate(BW, se);

% Fill holes
BW = imfill(BW, 'holes');

% Clear borders
BW = imclearborder(BW);

% Create masked image.
maskedImage = I;
maskedImage(~BW) = 0;