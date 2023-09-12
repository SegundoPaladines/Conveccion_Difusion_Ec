t=[0.1:0.02:1.6];
c=0.178530*e.^(-3.605802*t);
fprintf('Valores Aprox De C:');
for i=1:length(c)
  fprintf('\n%f',c(i));
endfor
%fin for
hold on
plot(t,c,'-g','linewidth',1);
ylabel("C","fontweight","bold","fontsize",20);
xlabel("t","fontweight","bold","fontsize",20);
h=get(gcf,"currentaxes");
set(h,"fontweight","bold","linewidth",2);
print('grafica3.jpg','-r300','-djpg','-F:Helvetica:12','-tight');
fprintf('\nfin programa');