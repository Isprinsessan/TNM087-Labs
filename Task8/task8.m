load FStack.mat;
monims = reshape(FStack,32,32,1,192); 
montage(monims);
 
k = AutoFocus(FStack);
plot(k);