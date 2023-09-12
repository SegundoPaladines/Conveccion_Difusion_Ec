L=3;
D=1/10;
V=0.5;
c0=0.3;
t=0.1;
x=0.1;

Pe=(V*L)/D;
Tprima=(t*D)/(L^2);

lamda=Pe/2;
X=x/L;
T=(lamda^2)*Tprima;

cte1=-((2*pi)/(lamda^2));

f=@(n,v1,v2) ((n/(1+(((n^2)*(pi^2))/(lamda^2))))*sin(n*pi*v1))*((e^(-(1+(((n^2)*(pi^2))/(lamda^2)))*v2))-1);

ctmp=0;
for n=1:31000
  
    ctmp=ctmp+f(n,X,T);  
    
endfor
%fin for

z=cte1*ctmp;
z=c0*z;

fprintf('valor c %f',z);

fprintf('\nfin programa');