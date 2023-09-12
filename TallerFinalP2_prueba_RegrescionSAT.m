t=[0.8:0.02:1.6];
 c=0.000861*(t./(-0.755652+t));
fprintf('Valores Aprox De C:');
for i=1:length(c)
  fprintf('\n%f',c(i));
endfor
%fin for
hold on
plot(t,c,'-y','linewidth',1);
ylabel("C","fontweight","bold","fontsize",20);
xlabel("t","fontweight","bold","fontsize",20);
h=get(gcf,"currentaxes");
set(h,"fontweight","bold","linewidth",2);
print('grafica7.jpg','-r300','-djpg','-F:Helvetica:12','-tight');
fprintf('\nfin programa');