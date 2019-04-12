imdata1 = imread('T7Cross.jpg');
center = [128,256];
angle = 90;
k = ImageRotation(imdata1, center, angle);
imshow(imdata1);
figure;
imshow(k);