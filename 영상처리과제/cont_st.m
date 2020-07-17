function cimg = cont_st(img)
max_val=max(max(img));
min_val=min(min(img));
[row,col]=size(img);
outimg=255.0*double(img-min_val)/double(max_val-min_val);
cimg=uint8(outimg);
end
