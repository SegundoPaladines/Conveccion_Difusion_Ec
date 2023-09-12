L=3;
D=1/10;
V=0.5;
c0=0.3;
t=[0.05:0.05:3];
x=[0.05:0.05:3];

Pe=(V*L)/D;
Tprima=(t.*D)./(L^2);

lamda=Pe/2;
X=x./L;
T=(lamda^2).*Tprima;

cte1=-((2*pi)/(lamda^2));

f=@(n,v1,v2) ((n/(1+(((n^2)*(pi^2))/(lamda^2))))*sin(n*pi*v1))*((e^(-(1+(((n^2)*(pi^2))/(lamda^2))*v2)))-1);

for i=1:60

  ctmp=0;
  
  for n=1:2000
    
    ctmp=ctmp+f(n,X(i),T(i));  
    
  endfor
  
  c(i)=0.3*cte1*ctmp;

endfor
%finfor

for i=1:60
  
  fprintf('\n %f',c(i));
  
endfor
%fin for

hold on
plot(t,c,'linewidth',1);
ylabel("c(x,t)/C0","fontweight","bold","fontsize",20);
xlabel("t","fontweight","bold","fontsize",20);
h=get(gcf,"currentaxes");
set(h,"fontweight","bold","linewidth",2);
print('img_taller_final.jpg','-r300','-djpg','-F:Helvetica:12','-tight');

fprintf('\n fin programa');