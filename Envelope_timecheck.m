clear
clc

%compare time obtained from Lawson creteria formula with values the ratio
%between the energy provided by the capacitors over the power extracted by
%the plasma to ionise deuterium



% constants
m = 2.014082*1.6605*10^(-27); %u*1.6605*10^(-27)kg/u ---> kg
q = 1.602*10^(-19); %C=1A*1s
mi_0 = 4*pi*10^(-7);
kB = 1.38064852 * 10^(-23); %m^2 kg s^-2 K^-1
Tb = 300; %gradi kelvin ---> background temperature
n = 2.4*10^(16); %for B=5 and beta>50%
R = 4*0.01; %m
l = 12*0.01; %m
r = 0.0052; %gyroradius for B=5T

SurfaceArea = pi^2 * 4 * R * r;
Volume = 2* R * (pi*r)^2 ; 

S = 2*pi*R*(l+R); % m^2 considering a cylindrical chamber
E = 2.179*10^(-18); %J ionisation

c = sqrt((8*kB*Tb)/(pi * m)); %m/s
gamma = (n*c)/4;
power = gamma*S*E;  %watt
%capacitor constants
energy = (0.5*1500*10^(-6)*550^2) * 3;  %J
%fotoflash
%V=1000 V
%C=1500 microF
time = (energy)/power;  %s

% t = linspace(10,100,100); %keV
% t = t .* (10^3*1.602*10^(-19)); %J
% b = 6;
% beta = 1;%0.5; %  50%
% sigma_v2 = linspace(5.99*10^(-25), 2.74*10^(-23), 100);
% 
% %Biettercount page 336
% 
%     n = (beta*b^2) * ((2*mi_0.*t).^(-1));
%    figure(1)
%     plot((t*6.242*10^(15)),n,'b','Linewidth',1);
%     xlabel('temperature $(keV)$','Interpreter','Latex','Fontsize',18);
%     ylabel('electron number density [$m^{-3}$]','Interpreter','Latex','Fontsize',18);
%     grid on
%     grid minor
%     %legend(['B = ',num2str(b(1)),'T'],['B = ', num2str(b(2)),'T'],['B = ', num2str(b(3)),'T'], ['B = ', num2str(b(4)), 'T'], ['B = ', num2str(b(5)), 'T'], ['B = ', num2str(b(6)), 'T'],'Interpreter','Latex','Fontsize',18)
%     title_for_chart=sprintf('number density vs $T$');
%     sgtitle(title_for_chart,'Interpreter','Latex','Fontsize',22);  
%     
%     figure(2)
%  tau = (12./n) .* (t.*(6.242*10^(18)))/(4*10^6) .* (sigma_v2).^(-1);
%     plot(t*6.242*10^(15),tau,'k','Linewidth',1)
%     xlabel('temperature $(keV)$','Interpreter','Latex','Fontsize',18);
%     ylabel('$\tau_E$ ($s$)','Interpreter','Latex','Fontsize',18);
%     grid on
%     grid minor
%     %legend(['B = ',num2str(b(1)),'T'],['B = ', num2str(b(2)),'T'],['B = ', num2str(b(3)),'T'], ['B = ', num2str(b(4)), 'T'],'Interpreter','Latex','Fontsize',18)
%     legend('$B=6$','Interpreter','Latex','Fontsize',18)
%     title_for_chart=sprintf('lifetime vs temperature in $keV$');
%     sgtitle(title_for_chart,'Interpreter','Latex','Fontsize',22); 
%   	
