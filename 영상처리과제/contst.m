clear all;
img_rgb=imread('lighthouse.png');
img_ycbcr=rgb2ycbcr(img_rgb);
img_intensity=img_ycbcr(:,:,1);
imgst_y=cont_st(img_intensity);
img_ycbcr(:,:,1)=imgst_y;
imgst_rbg = ycbcr2rgb(img_ycbcr);
figure;
subplot(121);imshow(img_rgb);title('Original image')
subplot(122);imshow(imgst_rbg);title('After contrast stretching');
