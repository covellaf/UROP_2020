clear
clc

% constants
m = 2.014082*1.6605*10^(-27); %u*1.6605*10^(-27)kg/u ---> kg
q = 1.602*10^(-19); %C=1A*1s
mi_0 = 4*pi*10^(-7);
kB = 1.38064852 * 10^(-23); %m^2 kg s^-2 K^-1
Tb = 300; %gradi kelvin ---> background temperature
n = 5*10^(21); %number of particles per m^3 for B=5 and beta>50%
Volume_chamber = pi * 1.5^2 * 2; %m^3
pressure_chamber = 10^(-6)*100; %Pa
R_gas = 8.3144598; %J/mol K

nb = (pressure_chamber*Volume_chamber/(Tb*R_gas))* (6.022*10^(23)); %number
%of particles in the background
nb = nb/Volume_chamber ;
R = 3.5*0.01; %m
l = 12*0.01; %m
r = 0.0052; %gyroradius for B=5T
SurfaceArea = pi^2 * 4 * R * r;
Volume = 2* R * (pi*r)^2 ; 
E = 2.179*10^(-18); %J/particles ionisation
c = sqrt((8*kB*Tb)/(pi * m)); %m/s
n_moli = (n*Volume)/(6.022*10^(23)); %numero di moli
cv = 20.534; %J/mol K at constant volume for deuterium

%energy supplied by the capacitors break out

X = [Volume*n*E n_moli*cv*(150*10^6-300) nb*c*0.25*SurfaceArea*E*6]; %joules

%X(1) energy to ionise the plasma
%X(2) energy to rise the internal energy of the plasma to 12.9 keV
%1 eV = 96,485543 kJ/mol
% X(2) = (12.9*10^3 * 96.485543 *10^3 * 5*10^(21))/ ans
% 
% Q = 0.0083 * 20.534 *(150*10^6 - 300) / (6.022*10^(23))
%X(3) energy to keep the plasma alive for about 6s


%X(4) energy in the capacitor to generate a magnetic field of 5T in the
%magnet

% allow for +- 5% error

pie(X)
labels = {'Energy to ionise the plasma','Energy to bring the internal energy to 12.9keV','Energy to keep the plasma alive for 6 s'};
legend(labels,'Interpreter','Latex','Fontsize',18)
title('Energy stored in the capacitor','Interpreter','Latex','Fontsize',18)