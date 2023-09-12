%tamaño de los intervalos
h=0.05;
%proceso analitico

t=[0.1:h:3];
c=0.359103*e.^(-4.240541*t);

area=abs(c(1));
for i=2:(length(c)-1);
  area=area+abs(2*c(i));
endfor
%finfor
area=area+abs(c(length(c)));
area=(h/2)*area;
fprintf(' Area Metodo De Trapecios = %f',area);
%%Integral de c(t)
ic = @(t) -0.08468*e^(-4.240541*t);
valor_analitico=ic(3)-ic(0.1);
hold on
plot(t,c);
fprintf('\n\n Area Metodo Analitico = %f',valor_analitico);
er=abs((valor_analitico-area)/valor_analitico)*100;
fprintf('\n\n Porcentaje De Error:  = %f',er);
fprintf('\n\nFin Programa');