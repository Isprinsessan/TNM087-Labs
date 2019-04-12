imdata1 = imread('T6HolgaImage.jpg');
imdata2 = imread('T6CanonImage.jpg');

k = Vignetting(imdata1, imdata2, 50);
