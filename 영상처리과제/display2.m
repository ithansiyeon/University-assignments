clear;
fii=fopen('lena_512_low.raw','r'); % �����̹����� �о�鿩�� fii�� ���� 
fid=fopen('outimg.raw','r'); % contrast stretching �� �̹����� �о�鿩�� fii�� ����
img_i=fread(fii,[512 512]); %fii�� 512*512 ũ�� ��ŭ �о img_i�� ���� 
img_r=fread(fid,[512 512]); %fid�� 512*512 ũ�� ��ŭ �о img_i�� ����
fclose(fii); %fii ������ ���� 
imgi=img_i'; %img_i�� ��ġ�� 
imgi = uint8(imgi); %unsigned integer 8�� imgi�� �ٲ�  
%%
fclose(fid); % fid ������ ����
imgr=img_r'; %img_r�� ��ġ��
imgr = uint8(imgr); %unsigned integer 8�� imgr�� �ٲ�
%%
figure;
subplot(1,2,1);
imshow(imgi,[0 255]);title('���� Image'); % ���� �̹����� ��� 
subplot(1,2,2);
imshow(imgr,[0 255]);title('contrast stretching�� Image'); % contrast stretching ���� �̹����� ��� 
