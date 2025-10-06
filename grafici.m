% RESULTS

t=1:Toss;
save data_sim

t = (t(1:end-time_off+1)-1);
% States estimation
fig1 = figure(100);
title('QoS')
%subplot(6,1,1)
    stairs(t,fault_1(time_off:end),'LineWidth',2)
    hold on
    stairs(t,fault_2(time_off:end),'-.','LineWidth',2)
    stairs(t,fault_3(time_off:end),'-.','LineWidth',2)
    stairs(t,fault_4(time_off:end),'-.','LineWidth',2)
    stairs(t,fault_5(time_off:end),':','LineWidth',2)
    stairs(t,fault_6(time_off:end),'--','LineWidth',2)
    legend('z_1(t)','z_2(t)','z_3(t)','z_4(t)','z_5(t)','z_6(t)')
    xlabel('Time [s]')
    ylim([-1 21])
    grid
    ax = gca;
    ax.FontSize = 12;


%%%% AGENTE 1 %%%%
fig2 = figure('Renderer', 'painters', 'Position', [50 50 600 900]);
%subplot(3,1,1), stairs(t,J_1_true(time_off:end),'LineWidth',2)
Js{1}(end)=Js{1}(end-1);
subplot(3,1,1), stairs(t,Js{1}(time_off:end),'LineWidth',2)
ylabel('J_1(t)')
hold on
%subplot(3,1,1), stairs(t,J_1(time_off:end),'LineWidth',2)
%legend('J_1(t)')
subplot(3,1,1), stairs(t,eps*ones(1,length(Js{1}(time_off:end))),'k--','LineWidth',2)
% legend('J_1(t)','Location','southeastoutside')
ax = gca;
  ax.FontSize = 12;
title('Agent 1')
grid
subplot(3,1,2), stairs(t,tau{1,1}(time_off:end),'LineWidth',2)
hold on
subplot(3,1,2), stairs(t,tau{1,2}(time_off:end),'LineWidth',2)
subplot(3,1,2), stairs(t,tau{1,3}(time_off:end),'LineWidth',2)
if simNumber == 2
    rectangle('Position',[500-time_off-10 0 20 1],'FaceColor', [0, 1, 0, 0.2],'EdgeColor', [0, 1, 0, 0.2])
end
ax = gca;
  ax.FontSize = 12;
  subplot(3,1,2), stairs(t,0.2*ones(1,length(Js{1}(time_off:end))),'k--','LineWidth',2)
legend('\tau_{1,1}','\tau_{1,2}','\tau_{1,3}','th')

grid
stati_h(1,end)=stati_h(1,end-1);
subplot(3,1,3), stairs(t,stati_h(1,(time_off:end)),'LineWidth',2)
yticks([0 0.5 1])
yticklabels({'HOME','','P&O'})
% legend('Aut. State','Location','southeastoutside')
grid
ax = gca;
  ax.FontSize = 12;
  xlabel('Times [s]')

%%%% AGENTE 2 %%%%
fig3 = figure('Renderer', 'painters', 'Position', [50 50 600 900]);
%subplot(3,1,1), stairs(t,J_2_true(time_off:end),'LineWidth',2)
Js{2}(end)=Js{2}(end-1);
subplot(3,1,1), stairs(t,Js{2}(time_off:end),'LineWidth',2)
hold on
%legend('J_2(t)','\hat{J}_2(t)')
subplot(3,1,1), stairs(t,eps*ones(1,length(Js{1}(time_off:end))),'k--','LineWidth',2)
ylabel('J_2(t)')
ax = gca;
  ax.FontSize = 12;
title('Agent 2')
grid
subplot(3,1,2), stairs(t,tau{2,1}(time_off:end),'LineWidth',2)
hold on
subplot(3,1,2), stairs(t,tau{2,2}(time_off:end),'LineWidth',2)
subplot(3,1,2), stairs(t,tau{2,3}(time_off:end),'LineWidth',2)
if simNumber == 2
    rectangle('Position',[500-time_off-10 0 20 1],'FaceColor', [0, 1, 0, 0.2],'EdgeColor', [0, 1, 0, 0.2])
end
ax = gca;
  ax.FontSize = 12;
subplot(3,1,2), stairs(t,0.2*ones(1,length(Js{1}(time_off:end))),'k--','LineWidth',2)
legend('\tau_{2,2}','\tau_{2,3}','\tau_{2,4}','th')
grid
stati_h(2,end)=stati_h(2,end-1);
subplot(3,1,3), stairs(t,stati_h(2,(time_off:end)),'LineWidth',2)
yticks([0 0.5 1])
yticklabels({'HOME','','P&O'})
grid
ax = gca;
  ax.FontSize = 12;
  xlabel('Times [s]')

%%%% AGENTE 3 %%%%
fig4 = figure('Renderer', 'painters', 'Position', [50 50 600 900]);
%subplot(3,1,1), stairs(t,J_3_true(time_off:end),'LineWidth',2)
%hold on
Js{3}(end)=Js{3}(end-1);
subplot(3,1,1), stairs(t,Js{3}(time_off:end),'LineWidth',2)
hold on
%legend('J_3(t)','\hat{J}_3(t)')
subplot(3,1,1), stairs(t,eps*ones(1,length(Js{1}(time_off:end))),'k--','LineWidth',2)
ylabel('J_3(t)')
ax = gca;
  ax.FontSize = 12;
title('Agent 3')
grid
subplot(3,1,2), stairs(t,tau{3,1}(time_off:end),'LineWidth',2)
hold on
subplot(3,1,2), stairs(t,tau{3,2}(time_off:end),'LineWidth',2)
subplot(3,1,2), stairs(t,tau{3,3}(time_off:end),'LineWidth',2)
subplot(3,1,2), stairs(t,0.2*ones(1,length(Js{1}(time_off:end))),'k--','LineWidth',2)
legend('\tau_{3,3}','\tau_{3,4}','\tau_{3,5}','th')
if simNumber == 2
    rectangle('Position',[500-time_off-10 0 20 1],'FaceColor', [0, 1, 0, 0.2],'EdgeColor', [0, 1, 0, 0.2])
%     rectangle('Position',[430-time_off-10 0 20 1],'FaceColor', [1, 0, 0, 0.4],'EdgeColor', [1, 0, 0, 0.4])
end
ax = gca;
  ax.FontSize = 12;
grid
stati_h(3,end)=stati_h(3,end-1);
subplot(3,1,3), stairs(t,stati_h(3,(time_off:end)),'LineWidth',2)
yticks([0 0.5 1])
yticklabels({'HOME','','P&O'})
grid
ax = gca;
  ax.FontSize = 12;
  xlabel('Times [s]')

%%%% AGENTE 4 %%%%
fig5 = figure('Renderer', 'painters', 'Position', [50 50 600 900]);
%subplot(3,1,1), stairs(t,J_4_true(time_off:end),'LineWidth',2)
%hold on
Js{4}(end)=Js{4}(end-1);
subplot(3,1,1), stairs(t,Js{4}(time_off:end),'LineWidth',2)
hold on
%legend('J_4(t)','\hat{J}_4(t)')
subplot(3,1,1), stairs(t,eps*ones(1,length(Js{1}(time_off:end))),'k--','LineWidth',2)
ylabel('J_4(t)')
ax = gca;
  ax.FontSize = 12;
title('Agent 4')
grid
subplot(3,1,2), stairs(t,tau{4,1}(time_off:end),'LineWidth',2)
hold on
subplot(3,1,2), stairs(t,tau{4,2}(time_off:end),'LineWidth',2)
subplot(3,1,2), stairs(t,tau{4,3}(time_off:end),'LineWidth',2)
% if simNumber == 2
%     rectangle('Position',[430-time_off-10 0 20 1],'FaceColor', [1, 0, 0, 0.4],'EdgeColor', [1, 0, 0, 0.4])
% end
rectangle('Position',[250-time_off-10 0 20 1],'FaceColor', [0, 1, 0, 0.2],'EdgeColor', [0, 1, 0, 0.2])
ax = gca;
  ax.FontSize = 12;
subplot(3,1,2), stairs(t,0.2*ones(1,length(Js{1}(time_off:end))),'k--','LineWidth',2)
legend('\tau_{4,4}','\tau_{4,5}','\tau_{4,6}','th')
grid
stati_h(4,end)=stati_h(4,end-1);
subplot(3,1,3), stairs(t,stati_h(4,(time_off:end)),'LineWidth',2)
yticks([0 0.5 1])
yticklabels({'HOME','','P&O'})
grid
ax = gca;
  ax.FontSize = 12;
  xlabel('Times [s]')

  %%%% AGENTE 5 %%%%
fig6 = figure('Renderer', 'painters', 'Position', [50 50 600 900]);
%subplot(3,1,1), stairs(t,J_5_true(time_off:end),'LineWidth',2)
%hold on
Js{5}(end)=Js{5}(end-1);
subplot(3,1,1), stairs(t,Js{5}(time_off:end),'LineWidth',2)
hold on
%legend('J_4(t)','\hat{J}_4(t)')
subplot(3,1,1), stairs(t,eps*ones(1,length(Js{1}(time_off:end))),'k--','LineWidth',2)
ylabel('J_5(t)')
ax = gca;
  ax.FontSize = 12;
title('Agent 5')
grid
subplot(3,1,2), stairs(t,tau{5,1}(time_off:end),'LineWidth',2)
hold on
subplot(3,1,2), stairs(t,tau{5,2}(time_off:end),'LineWidth',2)
subplot(3,1,2), stairs(t,tau{5,3}(time_off:end),'LineWidth',2)
% if simNumber == 2
%     rectangle('Position',[430-time_off-10 0 20 1],'FaceColor', [1, 0, 0, 0.4],'EdgeColor', [1, 0, 0, 0.4])
% end
rectangle('Position',[250-time_off-10 0 20 1],'FaceColor', [0, 1, 0, 0.2],'EdgeColor', [0, 1, 0, 0.2])
ax = gca;
  ax.FontSize = 12;
subplot(3,1,2), stairs(t,0.2*ones(1,length(Js{1}(time_off:end))),'k--','LineWidth',2)
legend('\tau_{5,1}','\tau_{5,5}','\tau_{5,6}','th')
grid
stati_h(5,end)=stati_h(5,end-1);
subplot(3,1,3), stairs(t,stati_h(5,(time_off:end)),'LineWidth',2)
yticks([0 0.5 1])
yticklabels({'HOME','','P&O'})
grid
ax = gca;
  ax.FontSize = 12;
  xlabel('Times [s]')

fig7 = figure(8);
%subplot(2,1,1), 
stairs(t,tau{1,3}(time_off:end),'LineWidth',2)
hold on
%subplot(2,1,1), 
stairs(t,tau{2,2}(time_off:end),'LineWidth',2)
%subplot(2,1,1), 
stairs(t,tau{3,1}(time_off:end),'LineWidth',2)
ax = gca;
  ax.FontSize = 12;

grid
legend('\tau_{1,3}','\tau_{2,3}','\tau_{3,1}')
%subplot(2,1,2), stairs(t,tau{2,3}(time_off:end),'LineWidth',2)
%hold on
%subplot(2,1,2), stairs(t,tau{3,2}(time_off:end),'LineWidth',2)
%subplot(2,1,2), stairs(t,tau{4,1}(time_off:end),'LineWidth',2)
%grid
%legend('\tau_{1,1}','\tau_{5,1}')
xlabel('Times [s]')
ax = gca;
  ax.FontSize = 12;

  if simNumber == 1
    cd sim1
  else
      cd sim2
  end

    saveas(fig1,['fault'],'epsc')
    savefig(fig1,'fault.fig')
    saveas(fig2,['r1'],'epsc')
    savefig(fig2,'r1.fig')
    saveas(fig3,['r2'],'epsc')
    savefig(fig3,'r2.fig')
    saveas(fig4,['r3'],'epsc')
    savefig(fig4,'r3.fig')
    saveas(fig5,['r4'],'epsc')
    savefig(fig5,'r4.fig')
    saveas(fig6,['r5'],'epsc')
    savefig(fig6,'r5.fig')
    saveas(fig7,['tau'],'epsc')
    savefig(fig7,'tau.fig')
   cd ..

   close all