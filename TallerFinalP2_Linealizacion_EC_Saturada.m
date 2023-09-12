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
    aux=aux+((n*sin(n*pi*X))/(1+(((n^2)*(pi^2))/(lamda^2)))).*(exp(-(1+(((n^2)*(pi^2)*T)/(lamda^2))))-1);
endfor
%finfor  
c=cte1.*aux;
c=c0.*c;

%Linealizacion
y=1./c;
x=1./t;
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
fprintf('\nsuma 1/c = %f',sumy);
fprintf('\nsuma 1/t = %f',sumx);
fprintf('\nsumatoria de 1/t cuadrado = %f',x_2_sum);
fprintf('\nsumatoria al cuadrado de 1/t= %f',x_sum_2);
fprintf('\nsumatoria de (1/c)*(1/t) = %f',sumxxy);
fprintf('\npromedio de 1/t= %f',promx);
fprintf('\npromedio de 1/c = %f',promy);
fprintf('\n_____________________________________________________');

beta_sobre_alfa=(length(t)*sumxxy-sumx*sumy)/(length(t)*x_2_sum-x_sum_2);
uno_sobre_alfa=promy-beta_sobre_alfa*promx;
alfa=1/uno_sobre_alfa;
beta=beta_sobre_alfa*alfa;

fprintf('\n\nValor de a0=1/alfa= %f',uno_sobre_alfa);
fprintf('\nValor de a1=beta/alfa %f',beta_sobre_alfa);

uno_sobre_c=0;
fprintf('\n\nvalores de 1/c:');
for i=1:length(x)
  uno_sobre_c(i)=uno_sobre_alfa+beta_sobre_alfa*x(i);
  fprintf('\n %f',uno_sobre_c(i));
endfor
%finpara

fprintf('\n\nEcuacion Lineal De C: 1/c=%f',uno_sobre_alfa);
fprintf('+(1/t)*(%f',beta_sobre_alfa);
fprintf(')');
fprintf('\n_____________________________________________________');

hold on
plot(x,uno_sobre_c,'-b','linewidth',0.3);
ylabel("1/c","fontweight","bold","fontsize",20);
xlabel("1/t","fontweight","bold","fontsize",20);
h=get(gcf,"currentaxes");
set(h,"fontweight","bold","linewidth",2);
print('D:/Octave/Taller Final/imagenes/linealizacion_saturada.jpg','-r300','-djpg','-F:Helvetica:12','-tight');
fprintf('\nfin programa');