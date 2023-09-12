t=[0.6:0.02:2];
c=0.003821*t.^(-4.016641)
fprintf('Valores Aprox De C:');
for i=1:length(c)
  fprintf('\n%f',c(i));
endfor
%fin for
hold on
plot(t,c,'-r','linewidth',1);
ylabel("C","fontweight","bold","fontsize",20);
xlabel("t","fontweight","bold","fontsize",20);
h=get(gcf,"currentaxes");
set(h,"fontweight","bold","linewidth",2);
print('grafica5.jpg','-r300','-djpg','-F:Helvetica:12','-tight');
fprintf('\nfin programa');