echo off;
clear all;
img=imread('bike.png');
img=uint8(img);
lum_cnt=zeros(256,1);
pro_lum=zeros(256,1);
cdf_lum=zeros(256,1);
numofpixels=size(img,1)*size(img,2);
i_histeq=uint8(zeros(size(img,1),size(img,2)));
output=zeros(256,1);
for i=1:size(img,1)
    for j=1:size(img,2)
        val=img(i,j);
        lum_cnt(val+1)=lum_cnt(val+1)+1; %array mismatch ¶§¹®¿¡ 
        %pro_lum(val+1)=lum_cnt(val+1)/numofpixels;
    end
end
sum=0;
for j=1:256
 sum=sum+lum_cnt(j);
 cdf_lum(j)=sum;
 pro_lum(j)=cdf_lum(j)/numofpixels;
output(j)=round(pro_lum(j)*255+0.5);
end
for i=1:size(img,1)
    for j=1:size(img,2)
        i_histeq(i,j)=output(img(i,j)+1);
    end
end
   
figure;
subplot(121); imshow(img); title('Original image');
subplot(122); imshow(i_histeq); title('Histogram equalization');
figure;
subplot(121); bar(imhist(img)); title('Histogram of orginal image');
subplot(122); bar(imhist(i_histeq)); title('Histogram after histogram equalization');