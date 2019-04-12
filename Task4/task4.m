imdata = imread('T4WhitePoint.jpg');
infor = imfinfo('T4WhitePoint.jpg');
ImType = infor.Format;
k = WhitePoint(imdata, ImType);