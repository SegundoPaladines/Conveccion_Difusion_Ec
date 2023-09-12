clc;
clear;
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

y=log(c);
%fin for
sumt=0;
for i=1:length(t)
  sumt=sumt+t(i);
endfor
%finpara

sumy=0;
for i=1:length(y)
  sumy=sumy+y(i);
endfor
%finpara

t_2_sum=0;
for i=1:length(t)
  t_2_sum=t_2_sum+((t(i))^2);
endfor
%finpara

t_sum_2=sumt^2;

txy=0;
for i=1:length(t)
  txy(i)=t(i)*y(i);
endfor
%finpara
sumtxy=0;
for i=1:length(txy)
  sumtxy=sumtxy+txy(i);
endfor
%finpara

promt=sumt/length(t);
promy=sumy/length(y);

fprintf('\nsuma ln(c) = %f',sumy);
fprintf('\nsuma t = %f',sumt);
fprintf('\nsumatoria de t cuadrado = %f',t_2_sum);
fprintf('\nsumatoria al cuadrado de t= %f',t_sum_2);
fprintf('\nsumatoria de t*ln(c) = %f',sumtxy);
fprintf('\npromedio de t= %f',promt);
fprintf('\npromedio de ln(c) = %f',promy);
fprintf('\n_____________________________________________________');

a1=(length(t)*sumtxy-sumt*sumy)/(length(t)*t_2_sum-t_sum_2);
a0=promy-a1*promt;

fprintf('\n\nValor de a0: ln(alfa)= %f',a0);
fprintf('\nValor de a1: beta= %f',a1);
fprintf('\n_____________________________________________________');
ln_c=0;
for i=1:length(t)
  ln_c(i)=a0+a1*t(i);
endfor
%finpara

fprintf('\n\n');
for i=1:length(ln_c)
  fprintf('\n Valor de ln(c) %f',ln_c(i));
  fprintf('   Valor de t %f',t(i));
endfor
%finpara

fprintf('\n\nEcuacion Lineal De C: ln(c)=%f',a0);
fprintf('%f',a1);
fprintf('*t');
hold on
plot(t,ln_c,'-b','linewidth',0.3);
ylabel("log(c)","fontweight","bold","fontsize",20);
xlabel("t","fontweight","bold","fontsize",20);
h=get(gcf,"currentaxes");
set(h,"fontweight","bold","linewidth",2);
print('linealizacion_Expo.jpg','-r300','-djpg','-F:Helvetica:12','-tight');

fprintf('\nfin programa');
