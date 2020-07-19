function y=fn_dec2bin(x,m)
y=[];
for i=1:m
    if x/(2^(m-i))>=1
        y=[y,1]; 
        x=x-2^(m-i);
    else
        y=[y,0];
    end
end
end
