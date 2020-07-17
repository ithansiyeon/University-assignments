function he_img=hist_eq(img)
[s1,s2]=size(img);
num_pixels=s1*s2;
he_img=uint8(zeros(s1,s2));
% zeros =>matrix 持失, zeros(256,1)=>vector 持失
freq=zeros(256,1);
probf=zeros(256,1);
probc=zeros(256,1);
cum=zeros(256,1);
output=zeros(256,1);
for i=1:s1
for j=1:s2
value=img(i,j);
freq(value+1)=freq(value+1)+1;
end
end
sum=0;
for i=1:256
probf(i)=freq(i)/num_pixels;
sum=sum+probf(i);
probc(i)=sum;
out_lum(i)=round(probc(i)*255);
end
for i=1:s1
for j=1:s2
he_img(i,j)=out_lum(img(i,j)+1);
end
end
