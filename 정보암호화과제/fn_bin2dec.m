function y=fn_bin2dec(x)
y=0;
N=length(x);
for i=1:N
    if x(i)==1, y=y+2^(N-i); end
end
