clear;
clc;
L=3;
D=1/10;
V=0.5;
c0=0.3;
delta_x=1/10;
[x,t] = meshgrid(0.05:delta_x:6,0.05:(delta_x/2):3);
Pe=(V*L)/D;
lamda=Pe/2;
Tprima=(t.*D)./(L^2);
T=(lamda^2).*Tprima;
cte1=-((2*pi)/(lamda^2));
c=0;
X=x./L;
aux=0;
for n=1:20000
   aux=aux+((n*sin(n*pi*X))/(1+(((n^2)*(pi^2))/(lamda^2)))).*(exp(-(1+(((n^2)*(pi^2))/(lamda^2)))*T)-1);
endfor
  aux=cte1.*aux;  c=c0.*aux;
  subplot(1,2,1); surf(x,t,c); title("Grafica Original");
  ylabel("t","fontweight","bold","fontsize",20); xlabel("x","fontweight","bold","fontsize",20);
  zlabel("c(x,t)","fontweight","bold","fontsize",20);colormap bone;
  fprintf('\n fin programa');

