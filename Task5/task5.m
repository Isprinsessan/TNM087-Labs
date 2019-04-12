imdata = imread('T5GammaCoins.jpg');
Gamma = 0.5;
Lower = 0.01;
Upper = 0.98;
k = GammaCorrection(imdata, Gamma, Lower, Upper);
imshow(imdata);
figure;
imshow(k);