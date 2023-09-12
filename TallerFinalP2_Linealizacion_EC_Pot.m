L=3;
D=1/10;
V=0.5;
c0=0.3;
t=[0.1:0.2:1.6];
x=[0.1:0.2:1.6];
Pe=(V*L)/D;
Tprima=(t.*D)./(L^2);
lamda=Pe/2;
X=x./L;
T=(lamda^2).*Tprima;
cte1=-((2*pi)/(lamda^2));
aux=0;
for n=1:30000
    aux=aux+((n*sin(n*pi*X))/(1+(((n^2)*(pi^2))/(lamda^2)))).*(exp(-(1+(((n^2)*(pi^2))/(lamda^2)))*T)-1);
endfor
%finfor  
c=cte1.*aux;
c=c0.*c;

%Linealizacion
y=log10(c);
x=log10(t);
sumx=0;
for i=1:length(x)
  sumx=sumx+x(i);
endfor
%finpara
sumy=0;
for i=1:length(y)
  sumy=sumy+y(i);
endfor
%finpara
x_2_sum=0;
for i=1:length(x)
  x_2_sum=x_2_sum+((x(i))^2);
endfor
%finpara
x_sum_2=sumx^2;
xxy=0;
for i=1:length(x)
  xxy(i)=x(i)*y(i);
endfor
%finpara
sumxxy=0;
for i=1:length(xxy)
  sumxxy=sumxxy+xxy(i);
endfor
%finpara
promx=sumx/length(x);
promy=sumy/length(y);
fprintf('_____________________________________________________');
fprintf('\nsuma log(c) = %f',sumy);
fprintf('\nsuma log(t) = %f',sumx);
fprintf('\nsumatoria de log(t) cuadrado = %f',x_2_sum);
fprintf('\nsumatoria al cuadrado de log(t)= %f',x_sum_2);
fprintf('\nsumatoria de log(c)*log(t) = %f',sumxxy);
fprintf('\npromedio de log(t)= %f',promx);
fprintf('\npromedio de log(c) = %f',promy);
fprintf('\n_____________________________________________________');

beta=(length(t)*sumxxy-sumx*sumy)/(length(t)*x_2_sum-x_sum_2);
l_alfa=promy-beta*promx;
alfa=10^l_alfa;
fprintf('\n\nValor de a0=log(alfa)= %f',l_alfa);
fprintf('\nValor de a1=beta %f',beta);

l_c=0;
fprintf('\n\nvalores de log(c):');
for i=1:length(x)
  l_c(i)=l_alfa+beta*x(i);
  fprintf('\n %f',l_c(i));
endfor
%finpara

fprintf('\n\nEcuacion Lineal De C: log(c)=%f',l_alfa);
fprintf('+log(t)*(%f',beta);
fprintf(')');
fprintf('\n_____________________________________________________');

hold on
plot(x,l_c,'-b','linewidth',0.3);
ylabel("log(c)","fontweight","bold","fontsize",20);
xlabel("log(t)","fontweight","bold","fontsize",20);
h=get(gcf,"currentaxes");
set(h,"fontweight","bold","linewidth",2);
print('linealizacion_potencial.jpg','-r300','-djpg','-F:Helvetica:12','-tight');
fprintf('\nfin programa');