clc
clear
close all

I = imread('testImage.bmp');

% Define thresholds for channel 1 based on histogram settings
channel1Min = 177.000;
channel1Max = 225.000;

% Define thresholds for channel 2 based on histogram settings
channel2Min = 132.000;
channel2Max = 225.000;

% Define thresholds for channel 3 based on histogram settings
channel3Min = 20.000;
channel3Max = 64.000;

% Create mask based on chosen histogram thresholds
sliderBW = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
BW = sliderBW;

figure
imshow(BW)

maskedRGBImage = I;
maskedRGBImage(repmat(~BW,[1 1 3])) = 0;

imwrite(BW,'fig3.1.png')
imwrite(maskedRGBImage,'fig3.1a.png')
