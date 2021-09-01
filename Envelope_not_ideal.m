clear
clc

%NB T is in Joules or eV so it is actually k_B*T[K]

% constants
m = 2.014082*1.6605*10^(-27); %u*1.6605*10^(-27)kg/u ---> kg
q = 1.602*10^(-19); %C=1A*1s
mi_0 = 4*pi*10^(-7);
color = ['b','m','k', 'g', 'c', 'r', 'y', 'b--', 'r--', 'k--'];


% %formulae
% % fix B , B=1
% B = 1;
% beta = linspace(0.05,0.5,10); %in percentage
% %beta = 0.05;
% Tev = linspace(10,100,100); %keV
% 
% for i=1:length(beta)
%     
%     n= (beta(i) * B^2) ./ (2*mi_0.*Tev.* (10^3*1.602*10^(-19))); %density 
%     
% figure(1)
% 
%     plot(Tev,n,color(i),'Linewidth',1);
%     xlabel('Temperature $[keV]$','Interpreter','Latex','Fontsize',18);
%     ylabel('electron number density [$m^{-3}$]','Interpreter','Latex','Fontsize',18);
%     grid on
%     grid minor
%     hold on
% %     xlim([0 15])
% %     ylim([0.25 1])
%     %axis equal
%     legend(['$\beta$ = ',num2str(beta(1)*100),'$\%$'],['$\beta$ = ',num2str(beta(2)*100),'$\%$'],['$\beta$ = ',num2str(beta(3)*100),'$\%$'],['$\beta$ = ',num2str(beta(4)*100),'$\%$'],['$\beta$ = ',num2str(beta(5)*100),'$\%$'], ['$\beta$ = ',num2str(beta(6)*100),'$\%$'], ['$\beta$ = ',num2str(beta(7)*100),'$\%$'], ['$\beta$ = ',num2str(beta(8)*100),'$\%$'], ['$\beta$ = ',num2str(beta(9)*100),'$\%$'] , ['$\beta$ = ',num2str(beta(10)*100),'$\%$'],'Interpreter','Latex','Fontsize',18)
%     
% end
%    title_for_chart=sprintf('$n$ vs T');
%    sgtitle(title_for_chart,'Interpreter','Latex','Fontsize',22); 
   
   
%fix T
   %formulae
% 12.9 keV = 150 milion K

T=12.9*(10^3*1.602*10^(-19));%J
b = linspace(1,10,10); %T
%b2 = linspace(2,5,4);
beta = linspace(0,1,100); %in percentage

for i=1:length(b)
    
    n= (beta * b(i).^2) ./ (2*mi_0*T); %density 
    n1 = (beta * b(i)^2) * ((2*mi_0*T).^(-1));
figure(1)

    plot(beta*100,n,color(i),'Linewidth',1);
    xlabel('$\beta$ $[\%]$','Interpreter','Latex','Fontsize',18);
    ylabel('electron number density [$m^{-3}$]','Interpreter','Latex','Fontsize',18);
    grid on
    grid minor
    hold on
%     xlim([0 15])
%     ylim([0.25 1])
    %axis equal
    %legend(['$\beta$ = ',num2str(beta(1)*100),'$\%$'],['$\beta$ = ',num2str(beta(2)*100),'$\%$'],['$\beta$ = ',num2str(beta(3)*100),'$\%$'],['$\beta$ = ',num2str(beta(4)*100),'$\%$'],['$\beta$ = ',num2str(beta(5)*100),'$\%$'], ['$\beta$ = ',num2str(beta(6)*100),'$\%$'], ['$\beta$ = ',num2str(beta(7)*100),'$\%$'], ['$\beta$ = ',num2str(beta(8)*100),'$\%$'], ['$\beta$ = ',num2str(beta(9)*100),'$\%$'] , ['$\beta$ = ',num2str(beta(10)*100),'$\%$'],'Interpreter','Latex','Fontsize',18)
    legend(['B = ',num2str(b(1)),'T'],['B = ', num2str(b(2)),'T'],['B = ', num2str(b(3)),'T'], ['B = ', num2str(b(4)), 'T'], ['B = ', num2str(b(5)), 'T'], ['B = ', num2str(b(6)), 'T'], ['B = ', num2str(b(7)), 'T'], ['B = ', num2str(b(8)), 'T'], ['B = ', num2str(b(9)), 'T'], ['B = ', num2str(b(10)), 'T'],'Interpreter','Latex','Fontsize',18)
 %legend(['B = ',num2str(b2(1)),'T'],['B = ', num2str(b2(2)),'T'],['B = ', num2str(b2(3)),'T'], ['B = ', num2str(b2(4)), 'T'],'Interpreter','Latex','Fontsize',18)

end
   title_for_chart=sprintf('$n$ vs beta for $T=12.9keV$');
   sgtitle(title_for_chart,'Interpreter','Latex','Fontsize',22); 
   
  T= linspace(1,15,100).*(10^3*1.602*10^(-19));%J
  n= (T*2*mi_0).^(-1);
   plot(T,n,'r','Linewidth',1);
   
   %end