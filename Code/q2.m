clc
clear
close all

I = imread('testImage.bmp');

figure
histogram(I)
title('Histogram')
xlabel('Number of Bins')
ylabel('Bins Count')

figure
histogram(I,'Normalization','count')
title('Normalized Histogram')
xlabel('Number of Bins')
ylabel('Bins Count')

figure
histogram(I,'Normalization','cumcount')
title('Comulative Histogram')
xlabel('Number of Bins')
ylabel('Bins Count')

figure
histogram(I,'Normalization','cdf')
title('Normalized Comulative Histogram')
xlabel('Number of Bins')
ylabel('Bins Count')
