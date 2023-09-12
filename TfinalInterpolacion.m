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

n=length(t);
p=polyfit(t,c,n);

fprintf('Valores de P\n');
for i=1:n+1
  
  fprintf('\n %f',p(i));
  
endfor
%finfor

reg=0;
for i=0:n
  
  reg=reg+p(i+1)*(t.^(n-i));
  
 endfor
 %finfor
 
fprintf('\n\nValores de reg\n');
for i=1:8
  
  fprintf('\n %f',reg(i));
  
endfor
%finfor

hold on
plot(t,reg,'-r','linewidth',0.3);
ylabel("reg(t)","fontweight","bold","fontsize",20);
xlabel("t","fontweight","bold","fontsize",20);
h=get(gcf,"currentaxes");
set(h,"fontweight","bold","linewidth",2);
print('img_taller_final.jpg','-r300','-djpg','-F:Helvetica:12','-tight');

fprintf('\n fin programa');

fprintf('\n fin programa');