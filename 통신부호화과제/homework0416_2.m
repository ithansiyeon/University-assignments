%2번째 문제  
clear all;
clc;
Tb=1;
Eb=1;  
EbNo=0:1:12;
Number_of_bits=150000;
BER_coded=zeros(size(EbNo));
count_coded=zeros(size(EbNo));

G=[1 0 0 0 0 0 0 0 0 0 0 1 1 0 0;
   0 1 0 0 0 0 0 0 0 0 0 0 1 1 0;
   0 0 1 0 0 0 0 0 0 0 0 0 0 1 1;
   0 0 0 1 0 0 0 0 0 0 0 1 1 0 1;
   0 0 0 0 1 0 0 0 0 0 0 1 0 1 0;
   0 0 0 0 0 1 0 0 0 0 0 0 1 0 1;
   0 0 0 0 0 0 1 0 0 0 0 1 1 1 0;
   0 0 0 0 0 0 0 1 0 0 0 0 1 1 1;
   0 0 0 0 0 0 0 0 1 0 0 1 1 1 1;
   0 0 0 0 0 0 0 0 0 1 0 1 0 1 1;
   0 0 0 0 0 0 0 0 0 0 1 1 0 0 1];
% H_t=[1 1 0 0;
%     0 1 1 0;
%     0 0 1 1;
%     1 1 0 1;
%     1 0 1 0;
%     0 1 0 1;
%     1 1 1 0;
%     0 1 1 1;
%     1 1 1 1;
%     1 0 1 1;
%     1 0 0 1;
%     1 0 0 0;
%     0 1 0 0;
%     0 0 1 0 ;
%     0 0 0 1];
H=[1 0 0 1 1 0 1 0 1 1 1 1 0 0 0;
   1 1 0 1 0 1 1 1 1 0 0 0 1 0 0;
   0 1 1 0 1 0 1 1 1 1 0 0 0 1 0;
   0 0 1 1 0 1 0 1 1 1 1 0 0 0 1];
%복호기 사용시 
for n=1:length(EbNo)
EbNoR=10^(EbNo(n)/(10));
sigma=sqrt(1./(2*EbNoR));
%bits=round(rand(Number_of_bits,11));
bits=randi([0 1],Number_of_bits,11);
m_bits=mod(bits*G,2);
symbol=m_bits*(-2)+1;
noise=randn(Number_of_bits,15).*sigma;
signal=symbol+noise;
mapping=signal<0; %복조된 이진 데이터
syndrome=mod(mapping*H',2);

for j=1:Number_of_bits
    if syndrome(j,1:4)==[0 0 0 0]
        Tmapping_coded(j,1:15)=xor(mapping(j,1:15),[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]);
       
     elseif  syndrome(j,1:4)==[0 0 0 1]
            Tmapping_coded(j,1:15)=xor(mapping(j,1:15),[0 0 0 0 0 0 0 0 0 0 0 0 0 0 1]);
         
     elseif  syndrome(j,1:4)==[0 0 1 0]
           Tmapping_coded(j,1:15)=xor(mapping(j,1:15),[0 0 0 0 0 0 0 0 0 0 0 0 0 1 0]);
        
     elseif  syndrome(j,1:4)==[0 1 0 0]  
            Tmapping_coded(j,1:15)=xor(mapping(j,1:15),[0 0 0 0 0 0 0 0 0 0 0 0 1 0 0]);
             
     elseif  syndrome(j,1:4)==[1 0 0 0]   
              Tmapping_coded(j,1:15)=xor(mapping(j,1:15),[0 0 0 0 0 0 0 0 0 0 0 1 0 0 0]);
           
     elseif  syndrome(j,1:4)==[1 0 0 1]  
              Tmapping_coded(j,1:15)=xor(mapping(j,1:15),[0 0 0 0 0 0 0 0 0 0 1 0 0 0 0]);
           
    elseif  syndrome(j,1:4)==[1 0 1 1] 
              Tmapping_coded(j,1:15)=xor(mapping(j,1:15),[0 0 0 0 0 0 0 0 0 1 0 0 0 0 0]);
            
     elseif  syndrome(j,1:4)==[1 1 1 1]
              Tmapping_coded(j,1:15)=xor(mapping(j,1:15),[0 0 0 0 0 0 0 0 1 0 0 0 0 0 0]);
              
     elseif   syndrome(j,1:4)==[0 1 1 1]    
             Tmapping_coded(j,1:15)=xor(mapping(j,1:15),[0 0 0 0 0 0 0 1 0 0 0 0 0 0 0]);
 
     elseif  syndrome(j,1:4)==[1 1 1 0]      
             Tmapping_coded(j,1:15)=xor(mapping(j,1:15),[0 0 0 0 0 0 1 0 0 0 0 0 0 0 0]);
              
     elseif  syndrome(j,1:4)==[0 1 0 1]  
              Tmapping_coded(j,1:15)=xor(mapping(j,1:15),[0 0 0 0 0 1 0 0 0 0 0 0 0 0 0]);
              
     elseif  syndrome(j,1:4)==[1 0 1 0]
              Tmapping_coded(j,1:15)=xor(mapping(j,1:15),[0 0 0 0 1 0 0 0 0 0 0 0 0 0 0]);
               
     elseif  syndrome(j,1:4)==[1 1 0 1]
              Tmapping_coded(j,1:15)=xor(mapping(j,1:15),[0 0 0 1 0 0 0 0 0 0 0 0 0 0 0]);
             
    elseif  syndrome(j,1:4)==[0 0 1 1]     
             Tmapping_coded(j,1:15)=xor(mapping(j,1:15),[0 0 1 0 0 0 0 0 0 0 0 0 0 0 0]);
              
     elseif  syndrome(j,1:4)==[0 1 1 0]   
              Tmapping_coded(j,1:15)=xor(mapping(j,1:15),[0 1 0 0 0 0 0 0 0 0 0 0 0 0 0]);  
              
     elseif  syndrome(j,1:4)==[1 1 0 0] 
      Tmapping_coded(j,1:15)=xor(mapping(j,1:15),[1 0 0 0 0 0 0 0 0 0 0 0 0 0 0]);
      
     else Tmapping_coded(j,1:15)=xor(mapping(j,1:15),[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]);
    end
end

 for i=1:Number_of_bits
   Emapping_coded(i,1:11)=Tmapping_coded(i,1:11); 
end
bits=logical(bits);
% BER_count(n)=sum(xor(bits,Emapping_coded));
% BER_coded(n)=BER_count/(Number_of_bits*11);
count_coded(n)=sum(sum(bits~=Emapping_coded));
BER_coded(n)=sum(sum(bits~=Emapping_coded))./(Number_of_bits*11);

fprintf('Eb/No: %g BER: %g count: %g\n',EbNo(n),BER_coded(n),count_coded(n));
end
theroyBar=0.5*erfc(sqrt(10.^(EbNo/10)));
%interpolation
xq=0:0.01:12;
%uncoded
BER_ucoded1=interp1(EbNo,theroyBar,xq);
index1=(max(find(BER_ucoded1>0.0001)));
EbNo_gain_unco=xq(index1);

%coded
BER_coded1=interp1(EbNo,BER_coded,xq);
index2=(max(find(BER_coded1>0.0001)));
EbNo_gain_co=xq(index2);

fprintf('coding gain: %0.2f [dB]\n',EbNo_gain_unco-EbNo_gain_co);
figure(1); 
semilogy(EbNo,theroyBar,'r--',EbNo,BER_coded,'*-'),xlabel('Eb/No [dB]'), ylabel('BER')
grid on

axis([0 10 0.000001 1]), legend('비부화 이론치 결과','부호화 결과')
keyboard;
