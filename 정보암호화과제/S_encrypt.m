fpt=fopen('tr_plain.txt', 'r');
plain=fread(fpt);
fclose(fpt);

N=length(plain);
temp=zeros(1,N);
K1=5;
K2=7;
j=0;
for i=1:N
    if plain(i)>='A' && plain(i)<='Z'
        j=j+1;
        temp(j)=char( mod((plain(i)-'A')*K1+K2,26) + 'A' );
    elseif plain(i)>='a' && plain(i)<='z'
        j=j+1;
        temp(j)=char( mod((plain(i)-'a')*K1+K2,26) + 'A');
    end
end
cipher=temp(1:j);

fpt=fopen('sub_cipher.txt', 'w');
fprintf(fpt,'%s',cipher);
fclose(fpt);



