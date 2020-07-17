echo off;
clear all;
img_rgb=imread('lighthouse.png');
imgst_rbg=imread('lighthouse.png');
img_ycbcr=rgb2ycbcr(imgst_rbg);
Y=img_ycbcr(:,:,1);
Y_t=hist_eq(Y);
R=imgst_rbg(:,:,1);
G=imgst_rbg(:,:,2);
B=imgst_rbg(:,:,3);

R_t=double(double(R).*(double(double(Y_t)./double(Y))));
G_t=double(double(G).*(double(double(Y_t)./double(Y))));
B_t=double(double(B).*(double(double(Y_t)./double(Y))));

if(R_t>255)
     imgst_rbg=255;
end

if(G_t>255)
     imgst_rbg=255;
end

if(B_t>255)
     imgst_rbg=255;
end

imgst_rbg(:,:,1)=R_t;
imgst_rbg(:,:,2)=G_t;
imgst_rbg(:,:,3)=B_t;

imgst_rbg=uint8(imgst_rbg);



figure;
subplot(121);imshow(img_rgb);title('Original image')
subplot(122);imshow(imgst_rbg);title('After contrast stretching');