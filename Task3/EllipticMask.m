function MImage = EllipticMask(FImage)
%EllipsMask Generate a mask for one eye and the complete face
%   Change pixel color for one eye and extract the face
%
%% Who has done it
% Group A
% Author: Erik Nilsson erini048
% Co-author: Lucas Palnén Rung lucpa286 
%
%
%% Syntax of the function
%
% Input arguments:  Fimage: Image containing a face 
%
% Output argument:  Mimage: Image with elliptical mask and a red eye
%
% You MUST NEVER change the first line
%
%% Basic version control (in case you need more than one attempt)
%
% Version: 1
% Date: 2017-11-10
%
% Gives a history of your submission to Lisam.
% Version and date for this function have to be updated before each
% submission to Lisam (in case you need more than one attempt)
%
%% General rules
%
% 1) Don't change the structure of the template by removing %% lines
%
% 2) Document what you are doing using comments
%
% 3) Before submitting make the code readable by using automatic indentation
%       ctrl-a / ctrl-i
%
% 4) In case a task requires that you have to submit more than one function
%       save every function in a single file and collect all of them in a
%       zip-archive and upload that to Lisam. NO RAR, NO GZ, ONLY ZIP!
%       All non-zip archives will be rejected automatically
%
% 5) Often you must do something else between the given commands in the
%       template
%
%

%% Your code starts here
%

%% create the output image (RGB!) which is a copy of the original image
% Use einstein.jpg as your FImage
% FImage is the IMAGE = numerical array and NOT THE FILENAME!

[sx,sy] = size(FImage);
MImage = FImage;

%% Generate the coordinates of the grid points
 [X,Y] = meshgrid((1:sy),(1:sx));
% Remember the matlab convention regarding rows, columns, x and y coordinates. Feel free to use 
% [Y,X] = meshgrid((1:sx),(1:sy)) or whatever notation instead if you feel more comfortable with that notation



%% Pick three points that define the elliptical mask of the face
% Read more about ellipses at https://en.wikipedia.org/wiki/Ellipse
% Your solution must at least be able to solve the problem for the case 
% where the axes of the ellipse are parallel to the coordinate axes
%
imshow(MImage);
fpts = ginput(3);


%% Generate the elliptical mask and 
% set all points in MImage outside the mask to black 

fmask = ((Y - fpts(1,2)).^2)./((fpts(1,2)-fpts(2,2)).^2) + ((X - fpts(1,1)).^2)./((fpts(1,1)-fpts(3,1)).^2) <= 1;  % this is the mask use C and R to generate it
MImage(~fmask) = 0; % here you modify the image using fmask

%% Pick two points defining one eye, generate the eyemask, paint it red

epts = ginput(2);
emask = ((X-epts(1,1)).^2+(Y-epts(1,2)).^2)./((epts(1,1)-epts(2,1)).^2+(epts(1,2)-epts(2,2)).^2) <= 1; % circular eye mask again, use C and R
% replace eye points with red pixels
MImage = repmat(MImage, [ 1 1 3]);
red = MImage(:,:,1);
green = MImage(:,:,2);
blue = MImage(:,:,3);

red(emask) = 255;
green(emask) = 0;
blue(emask) = 0;

MImage(:,:,1) = red;
MImage(:,:,2) = green;
MImage(:,:,3) = blue;


%% Display result if you want
%
imshow(MImage);

end

