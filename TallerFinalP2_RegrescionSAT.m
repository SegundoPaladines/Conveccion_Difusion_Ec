L=3; D=1/10; V=0.5; c0=0.3; t=[0.6:0.02:1.6]; x=[0.6:0.02:1.6]; Pe=(V*L)/D; Tprima=(t.*D)./(L^2); lamda=Pe/2; X=x./L;
T=(lamda^2).*Tprima; cte1=-((2*pi)/(lamda^2)); aux=0;
for n=1:30000
    aux=aux+((n*sin(n*pi*X))/(1+(((n^2)*(pi^2))/(lamda^2)))).*(exp(-(1+(((n^2)*(pi^2)*T)/(lamda^2))))-1);
endfor
%finfor  
c=cte1.*aux; c=c0.*c;
%Linealización
y=1./c; x=1./t; sumx=0;
for i=1:length(x)
  sumx=sumx+x(i);
endfor
%fin para
sumy=0;
for i=1:length(y)
  sumy=sumy+y(i);
endfor
%fin para
x_2_sum=0;
for i=1:length(x)
  x_2_sum=x_2_sum+((x(i))^2);
endfor
%finpara
x_sum_2=sumx^2;xxy=0;
for i=1:length(x)
  xxy(i)=x(i)*y(i);
endfor
%finpara
sumxxy=0;
for i=1:length(xxy)
  sumxxy=sumxxy+xxy(i);
endfor
%finpara
promx=sumx/length(x); promy=sumy/length(y);
beta_sobre_alfa=(length(t)*sumxxy-sumx*sumy)/(length(t)*x_2_sum-x_sum_2); uno_sobre_alfa=promy-beta_sobre_alfa*promx;  alfa=1/uno_sobre_alfa; beta=beta_sobre_alfa*alfa;
fprintf('Valor de alfa= %f',alfa); fprintf('\nValor de beta %f',beta);
%Ecuación Encontrada
c_aprox=alfa*(t./(beta+t));
%ecuacionencontrada
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
cprom=cprom/length(c);
st=0;
for i=1:length(c)
  st=st+((c(i)-cprom)^2);
endfor
%%fin para
r_c=(st-sr)/st;
fprintf('\n\nEcuacion Saturada De C: c=%f',alfa); fprintf('*(t/(%f',beta);
fprintf('+t)))'); fprintf('\n_____________________________________________________');
fprintf('\nValor De Sr: %f',sr); fprintf('Valor De St: %f',st); fprintf('\nValor De r cuadrado: %f',r_c);
fprintf('\n\nAJUSTE DEFICIENTE'); fprintf('\n_____________________________________________________');