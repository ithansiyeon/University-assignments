clear;
fii=fopen('lena_512_low.raw','r'); % 원본이미지를 읽어들여서 fii에 저장 
fid=fopen('outimg.raw','r'); % contrast stretching 한 이미지를 읽어들여서 fii에 저장
img_i=fread(fii,[512 512]); %fii를 512*512 크기 만큼 읽어서 img_i에 저장 
img_r=fread(fid,[512 512]); %fid를 512*512 크기 만큼 읽어서 img_i에 저장
fclose(fii); %fii 파일을 닫음 
imgi=img_i'; %img_i를 전치함 
imgi = uint8(imgi); %unsigned integer 8로 imgi를 바꿈  
%%
fclose(fid); % fid 파일을 닫음
imgr=img_r'; %img_r를 전치함
imgr = uint8(imgr); %unsigned integer 8로 imgr를 바꿈
%%
figure;
subplot(1,2,1);
imshow(imgi,[0 255]);title('원본 Image'); % 원본 이미지를 출력 
subplot(1,2,2);
imshow(imgr,[0 255]);title('contrast stretching후 Image'); % contrast stretching 후의 이미지를 출력 
