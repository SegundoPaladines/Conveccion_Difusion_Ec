clear; clc; L=3; D=1/10; V=0.5; c0=0.3; t=[0.1:0.05:3]; x=[0.1:0.05:3]; Pe=(V*L)/D;
Tprima=(t.*D)./(L^2); lamda=Pe/2; X=x./L; T=(lamda^2).*Tprima; cte1=-((2*pi)/(lamda^2));
aux=0;
for n=1:30000
    aux=aux+((n*sin(n*pi*X))/(1+(((n^2)*(pi^2))/(lamda^2)))).*(exp(-(1+(((n^2)*(pi^2))/(lamda^2)))*T)-1);
endfor
%finfor  
c=cte1.*aux; c=c0.*c; y=log(c); sumt=0;
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
promt=sumt/length(t); promy=sumy/length(c);
beta=(length(t)*sumtxy-sumt*sumy)/(length(t)*t_2_sum-t_sum_2);
ln_alfa=promy-beta*promt; alfa=e^ln_alfa;
fprintf('Valor de alfa= %f',alfa); fprintf('\nValor de beta = %f',beta);
%ecuacion obtenida
c_aprox=alfa*e.^(beta*t);
%ecuacion obtenida
fprintf('\n_____________________________________________________');
for i=1:length(c_aprox)
  fprintf('\n Valor Aprox De C: %f',c_aprox(i));
  fprintf('   Valor Real De C: %f',c(i));
endfor
sr=0;
for i=1:length(c)
  sr=sr+(c(i)-c_aprox(i));
endfor
%%fin para
sr=sr^2; sr=0;
for i=1:length(c)
  sr=sr+((c(i)-c_aprox(i))^2);
endfor
%%fin para
cprom=0;
for i=1:length(c)
  cprom=cprom+c(i);
endfor
%finfor
cprom=cprom/length(c); st=0;
for i=1:length(c)
  st=st+((c(i)-cprom)^2);
endfor
%%fin para
r_c=(st-sr)/st;
fprintf('\n\nEcuacion Exponencial De C: C=%f',alfa); fprintf('*e^(%f',beta); fprintf('*t)');
fprintf('\n_____________________________________________________');
fprintf('\nValor De Sr: %f',sr); fprintf('Valor De St: %f',st);
fprintf('\nValor De r cuadrado: %f',r_c);
fprintf('\n\nBUEN AJUSTE');
fprintf('\n_____________________________________________________');

