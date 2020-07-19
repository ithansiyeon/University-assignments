function round_key=fn_roundkey(key) % 64-bit key ют╥б
% DES Key Schedule 

permutation_choice_1=[57 49 41 33 25 17 9, 1 58 50 42 34 26 18, 10 2 59 51 43 35 27, 19 11 3 60 52 44 36, ...
    63 55 47 39 31 23 15, 7 62 54 46 38 30 22, 14 6 61 53 45 37 29, 21 13 5 28 20 12 4];
permutation_choice_2=[14 17 11 24 1 5, 3 28 15 6 21 10, 23 19 12 4 26 8, 16 7 27 20 13 2, ...
    41 52 31 37 47 55, 30 40 51 45 33 48, 44 49 39 56 34 53, 46 42 50 36 29 32];
left_shift=[1 1 2 2 2 2 2 2 1 2 2 2 2 2 2 1];

round_key=zeros(16,48); % K1~K16
C=zeros(17,28); % C0~C16
D=zeros(17,28); % D0~D16
temp=zeros(16,56); % C1D1~C16D16

for i=1:28
    C(1,i)=key(permutation_choice_1(i));
    D(1,i)=key(permutation_choice_1(i+28));
end

for i=1:16
    C(i+1,1:28)=[C(i,left_shift(i)+1:28),C(i,1:left_shift(i))];
    D(i+1,1:28)=[D(i,left_shift(i)+1:28),D(i,1:left_shift(i))]; 
    temp(i,:)=[C(i+1,:),D(i+1,:)];
    for j=1:48
        round_key(i,j)=temp(i,permutation_choice_2(j));
    end
end

end