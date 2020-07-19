fpt=fopen('tr_plain.txt', 'r');
ori_plain=fread(fpt);
fclose(fpt);

N=length(ori_plain);
temp=zeros(1,N);
j=0;
for i=1:N
    if ori_plain(i)>='A' && ori_plain(i)<='Z'
        j=j+1;
        temp(j)=ori_plain(i);
    elseif ori_plain(i)>='a' && ori_plain(i)<='z'
        j=j+1;
        temp(j)=char( mod(ori_plain(i)-'a',26) + 'A' );
    end
end
plain=temp(1:j);

K=6; P=[3 5 1 6 4 2];
r=mod(length(plain),K); 
if r~=0
    for i=1:K-r
        plain=[plain,'E']; 
    end
end
N=length(plain);
cipher=zeros(1,N);
for i=1:K:N
    for k=1:K
        cipher(i+k-1)=plain(i+P(k)-1); 
    end
end

fpt=fopen('tr_cipher.txt', 'w');
fprintf(fpt,'%s',cipher);
fclose(fpt);

