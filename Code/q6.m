clc
clear
close all

I = imread('testImage.bmp');
figure
imshow(I)

roi = [324 240 160 40];

RGB = insertShape(I,'Rectangle',roi);
figure
imshow(RGB)

ocrResults = ocr(I, roi);

Iocr = insertText(I,roi(1:2),ocrResults.Text,'AnchorPoint',...
    'RightTop','FontSize',16);
figure; imshow(Iocr);