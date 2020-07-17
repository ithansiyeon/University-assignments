%첫번째 문제
clear all;
clc;
Tb=1;
Eb=1;  
EbNo=0:1:10;
Number_of_bits=1000000;
BER=zeros(size(EbNo));
count=zeros(size(EbNo));
for n=1:length(EbNo)
EbNoR=10^(EbNo(n)/10);
sigma=sqrt(1./(2*EbNoR));
bits=round(rand(Number_of_bits,1));
symbol=bits*(-2)+1;
noise=randn(Number_of_bits,1)*sigma;
signal=noise+symbol;
for i=1:Number_of_bits
    if(signal(i)<0)
        mapping(i)=1;
    else mapping(i)=0;
    end
end
count(n)=sum(xor(bits,mapping'));
BER(n)=count(n)./Number_of_bits;   
fprintf('Eb/No: %g BER: %g count: %g\n',EbNo(n),BER(n),count(n));
end
EbNo_t=0:0.05:10;
BER_t=berawgn(EbNo_t,'psk',2,'nondiff');
figure(1); semilogy(EbNo,BER,'b*',EbNo_t,BER_t,'r-'),xlabel('Eb/No [dB]'), ylabel('BER')
grid on
axis([0 10 0.000001 1]), legend('시물레이션 결과','이론상 결과')
keyboard;


