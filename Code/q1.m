clc
clear
close all

I = rgb2gray(imread('testImage.bmp'));
[m, n] = size(I);
Lmin = min(I(:));
Lmax = max(I(:));
Crange = round(double(Lmax - Lmin),2);
CnormRange = round(double(((Lmax - Lmin)/((2^8)-1))),2);
Cmich = round((double(Lmax - Lmin)/double(Lmax + Lmin)),2);
Crms = round(sqrt(mean2((I-mean2(I)).^2)),2);
L = mean2(I);
Lharm = (m*n)/((m*n)*(mean2(I)));
Lgeom = exp(mean2(log(double(I))));
Mrange = round(double(((Lmax - Lmin)/2)),2);
Wmean = winsorisedMean(I, 10);
T = ((m*n)*mean2(I))/((m*n)-10);

function wm = winsorisedMean(L, percent)
    % Image Vertical and Horizontal size
    M = size(L,1);
    N = size(L,2);
    
    % Minimum and Maximum values
    Lmin = min(L);
    Lmax = max(L);
    
    L2 = L;
    % Loops through the image
    for i=1+1:M-1
        for j=1+1:N-1
            if L(i,j) <= Lmin * (1 + percent / 100) | L(i,j) >= Lmax  * (1 + percent / 100)
                window = L(i-1:i+1,j-1:j+1); % Gets the window around the pixel
                L2(i,j) = mean2(window); % calculates the arithmetic mean of the pixels around and gives the value to the pixel in the middle
            end
        end
    end
    
    wm = mean2(L2); % Calculates the arithmetic mean of the whole image
end







