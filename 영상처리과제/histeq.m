clear all;
img_rgb=imread('lighthouse.png');
imgst_rbg=imread('lighthouse.png');
img_r=imgst_rbg(:,:,1);
img_g=imgst_rbg(:,:,2);
img_b=imgst_rbg(:,:,3);
imgst_rbg(:,:,1)=hist_eq(img_r);
imgst_rbg(:,:,2)=hist_eq(img_g);
imgst_rbg(:,:,3)=hist_eq(img_b);
figure;
subplot(121);imshow(img_rgb);title('Original image')
subplot(122);imshow(imgst_rbg);title('After contrast stretching');