L=3;
D=1/10;
V=0.5;
c0=0.3;
t=[0.8:0.1:2];
x=[0.8:0.1:2];
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
fprintf('Valores De C Con Ecuacion Original\n');
for i=1:length(c)
  
  fprintf('\n %f',c(i));
  
endfor
%fin for
hold on
plot(t,c,'ob','linewidth',3);
ylabel("c(x,t)","fontweight","bold","fontsize",20);
xlabel("t","fontweight","bold","fontsize",20);
h=get(gcf,"currentaxes");
set(h,"fontweight","bold","linewidth",2);
print('G_Analitica_punto2.jpg','-r300','-djpg','-F:Helvetica:12','-tight');
fprintf('\n fin programa');