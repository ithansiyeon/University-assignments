function result=Inv_Mod_201621570(m,a) 
r=zeros(1,50);
q=zeros(1,50);
u=zeros(1,50);
v=zeros(1,50); 
x=0;
u(1)=0; u(2)=1;
v(1)=1; v(2)=0;
q(1)=0; q(2)=0; 
if m>a
    r(1)=m; r(2)=a;
else
    r(1)=a; r(2)=m;
end

i=2;
while r(i)~=0 
    i=i+1; 
    r(i)=mod(r(i-2),r(i-1)); 
    q(i)=floor(r(i-2)/r(i-1)); 
    u(i)=u(i-2)-u(i-1)*q(i);
    v(i)=v(i-2)-v(i-1)*q(i);
end
N=i-1;
o1=r(N);
o2=u(N);
o3=v(N);
if o1==1
    input('역행렬이 존재.');
    if m>a
        x=o2; 
        while x<0 || x>=m
    if x<0
        x=x+m;
    else
      x=x-m;  
    end
        end
    else x=o3;
        while x<0 || x>=m
          if x<0
        x=x+m;
    else
      x=x-m;  
          end
        end
    end
    else input('역행렬이 존재안함:');
end
result=x;
end







