clear
clc

%NB T is in Joules or eV so it is actually k_B*T[K]

% constants
m = 2.014082*1.6605*10^(-27); %u*1.6605*10^(-27)kg/u ---> kg
q = 1.602*10^(-19); %C=1A*1s
mi_0 = 4*pi*10^(-7);

%formulae
% 12.9 keV = 150 milion K
%T = linspace(10,100,7); %keV
T = [12.9 15 20 30];
T = T .* (10^3*1.602*10^(-19)); %J
B = linspace(0.5,10,100);  %T =kg/As^2
color = ['b','m','k', 'g', 'c', 'r', 'y'];

for i=1:length(T)
    
    v(i) = sqrt((8*T(i))/(pi*m)); 
    rg = (m*v(i)) ./ (q*B); %m radius gyration
    rg = rg*100; %cm
    n(i) = ((2*mi_0*T(i)).^(-1));% * B(end);
    
figure(1)

    plot(rg,B,color(i),'Linewidth',1);
    xlabel('gyroradius $[cm]$','Interpreter','Latex','Fontsize',18);
    ylabel('magnetic field [$T$]','Interpreter','Latex','Fontsize',18);
    grid on
    grid minor
    hold on
    legend(['T = ',num2str(T(1)/(10^3*1.602*10^(-19))),'keV'],['T = ', num2str(T(2)/(10^3*1.602*10^(-19))),'keV'],['T = ', num2str(T(3)/(10^3*1.602*10^(-19))),'keV'], ['T = ', num2str(T(4)/(10^3*1.602*10^(-19))),'keV'],'Interpreter','Latex','Fontsize',18)
    %legend(['T = ',num2str(T(1)/(10^3*1.602*10^(-19))),'keV'],['T = ', num2str(T(2)/(10^3*1.602*10^(-19))),'keV'],['T = ', num2str(T(3)/(10^3*1.602*10^(-19))),'keV'], ['T = ', num2str(T(4)/(10^3*1.602*10^(-19))),'keV'],['T = ', num2str(T(5)/(10^3*1.602*10^(-19))),'keV'], ['T = ', num2str(T(6)/(10^3*1.602*10^(-19))),'keV'], ['T = ', num2str(T(7)/(10^3*1.602*10^(-19))),'keV'],'Interpreter','Latex','Fontsize',18)
end
   title_for_chart=sprintf('B vs $r_g$');
   sgtitle(title_for_chart,'Interpreter','Latex','Fontsize',22); 
   
   
%equation 1.68 pag 20 ESSENTIAL
%Gamow expressions (Hively 1977):

Tev = linspace(10,100,100); %keV

sigma_v = ( (2*10^(-14)) .* ((1 + 0.00577.*Tev.^0.949)./(Tev.^(2/3))) .* exp(-19.31./Tev.^(1/3)) ) .* 10^(-6); %m^3/s   
    figure(2)
    plot( Tev,sigma_v,'k','Linewidth',1);
    hold on
sigmav = [5.99*10^(-25) 5.44*10^(-24) 2.74*10^(-23)]; %from old book
kt = [10 30 100];
sigma_v2 = linspace(5.99*10^(-25), 2.74*10^(-23), 100);
    %plot(Tev, sigma_v2, 'r','Linewidth',1)
    plot(kt,sigmav,'o--b','Markersize', 10, 'Linewidth',1);
    hold on
    plot(Tev, sigma_v2,'r', 'Linewidth',1 )
    %semilogx(sigma_v)
    xlabel('temperature $(keV)$','Interpreter','Latex','Fontsize',18);
    ylabel('$<\sigma v >$ ($m^3/s$)','Interpreter','Latex','Fontsize',18);
    grid on
    grid minor

   legend('Gamow expression 1977','experimental points','experimental linear fit','Interpreter','Latex','Fontsize',18)
   
%if T is of the order 10^8 K --> 1 degree kelvin= 8.621738 * 10-5 eV
%8.6 keV ~ 15 eV
t = linspace(10,20,100); %keV
t = t .* (10^3*1.602*10^(-19)); %J
b = linspace(1,6,6);

%Biettercount page 336
for j=1:length(b)
    n = b(j).^2 * ((2*mi_0.*t).^(-1));
   
    plot((t*6.242*10^(15)),n,color(j),'Linewidth',1);
    hold on
    xlabel('temperature $(keV)$','Interpreter','Latex','Fontsize',18);
    ylabel('electron number density [$m^{-3}$]','Interpreter','Latex','Fontsize',18);
    grid on
    grid minor
    legend(['B = ',num2str(b(1)),'T'],['B = ', num2str(b(2)),'T'],['B = ', num2str(b(3)),'T'], ['B = ', num2str(b(4)), 'T'], ['B = ', num2str(b(5)), 'T'], ['B = ', num2str(b(6)), 'T'],'Interpreter','Latex','Fontsize',18)
    title_for_chart=sprintf('number density vs $T$');
    sgtitle(title_for_chart,'Interpreter','Latex','Fontsize',22);  
end
 
 tau = (12./n) .* (Tev.*10^3)/(4*10^6) .* (sigma_v2).^(-1);
    figure(4)
    plot(Tev,tau,'r','Linewidth',1)
    hold on
   
    xlabel('temperature $(keV)$','Interpreter','Latex','Fontsize',18);
    ylabel('$\tau_E$ ($s$)','Interpreter','Latex','Fontsize',18);
    grid on
    grid minor
    %legend(['B = ',num2str(b(1)),'T'],['B = ', num2str(b(2)),'T'],['B = ', num2str(b(3)),'T'], ['B = ', num2str(b(4)), 'T'],'Interpreter','Latex','Fontsize',18)
    legend('$B=4$','$B=3$','$B=2$','$B=1$','Interpreter','Latex','Fontsize',18)
    title_for_chart=sprintf('lifetime vs temperature in $keV$');
    sgtitle(title_for_chart,'Interpreter','Latex','Fontsize',22); 
  	
%Instead of using sigma_v2 che viene da una approssimazione lineare di punti
%presi da un paper con sigma*v per vari valori di temperature in kev, usa
%una funzione più precisa per v e una per sigma e poin moltiplica
Tev = linspace(10,50,62); %keV
dummy = [0.0001            0
        0.0001            0
        0.0002  4.21875e-41
        0.0004  8.98998e-29
        0.0008  3.83011e-20
         0.001   5.7871e-18
         0.002  1.29576e-12
    0.00237841  1.47767e-11
    0.00270851  7.94797e-11
    0.00274171  9.25057e-11
    0.00275794  9.95266e-11
    0.00277401  1.06934e-10
    0.00278992  1.14738e-10
    0.00280567   1.2295e-10
    0.00282126  1.31581e-10
    0.00284432  1.45316e-10
    0.00286708  1.60086e-10
    0.00288943  1.75845e-10
    0.00291148  1.92706e-10
    0.00293312  2.10606e-10
    0.00295447  2.29666e-10
    0.00297541  2.49807e-10
    0.00299607  2.71157e-10
    0.00301632  2.93619e-10
    0.00303629  3.17328e-10
    0.00305587   3.4217e-10
    0.00307516  3.68286e-10
    0.00310053  4.05254e-10
    0.00312531   4.4442e-10
     0.0031495  4.85784e-10
    0.00317312  5.29336e-10
    0.00319617  5.75055e-10
    0.00321865  6.22915e-10
    0.00324059   6.7288e-10
    0.00326198  7.24905e-10
    0.00328284  7.78939e-10
    0.00330317  8.34924e-10
    0.00333263   9.2218e-10
    0.00336111   1.01391e-9
    0.00338835   1.10888e-9
    0.00341467   1.20781e-9
    0.00343983   1.30935e-9
    0.00346411   1.41425e-9
     0.0034949   1.55758e-9
    0.00352451   1.70699e-9
     0.0035525   1.85934e-9
    0.00357894   2.01383e-9
    0.00360391   2.16965e-9
    0.00362747   2.32608e-9
    0.00366051   2.56156e-9
    0.00369043   2.79215e-9
    0.00371811   3.02092e-9
    0.00375223   3.32483e-9
    0.00378234   3.61432e-9
    0.00380888   3.88706e-9
    0.00384254   4.25785e-9
    0.00387094   4.59368e-9
    0.00390281   4.99714e-9
    0.00393724   5.46653e-9
     0.0039685   5.92438e-9
         0.004   6.41834e-9
    0.00403254   6.96472e-9
      0.004065   7.54849e-9
    0.00409729   8.16981e-9
    0.00412951   8.83201e-9
    0.00416155   9.53509e-9
     0.0041935   1.02827e-8
    0.00422528   1.10745e-8
    0.00425696   1.19145e-8
    0.00429913   1.31151e-8
    0.00434105   1.44078e-8
    0.00438272   1.57968e-8
    0.00442412   1.72867e-8
    0.00446526    1.8882e-8
    0.00450613   2.05869e-8
    0.00454673    2.2406e-8
    0.00458705   2.43436e-8
    0.00462708    2.6404e-8
    0.00466684   2.85917e-8
    0.00470631   3.09108e-8
    0.00474548   3.33654e-8
    0.00478436   3.59597e-8
    0.00482295   3.86975e-8
    0.00486124   4.15829e-8
    0.00489922   4.46195e-8
     0.0049557   4.94724e-8
    0.00501135   5.46722e-8
    0.00506644    6.0257e-8
    0.00512069   6.62076e-8
    0.00517438   7.25644e-8
    0.00522721   7.93025e-8
    0.00527947   8.64644e-8
    0.00533088    9.4019e-8
     0.0053817   1.02011e-7
    0.00543168   1.10403e-7
    0.00548106   1.19243e-7
    0.00551354   1.25365e-7
    0.00557805   1.38285e-7
    0.00564127   1.51978e-7
    0.00570319   1.66441e-7
    0.00576382   1.81666e-7
    0.00582318   1.97646e-7
    0.00588126   2.14366e-7
    0.00593808   2.31811e-7
    0.00599364   2.49964e-7
    0.00604797   2.68803e-7
    0.00612696   2.98217e-7
    0.00620364   3.29196e-7
    0.00627725   3.61316e-7
    0.00634863   3.94813e-7
    0.00641709   4.29226e-7
     0.0064834   4.64805e-7
    0.00656778   5.13443e-7
    0.00664926   5.64164e-7
    0.00672656    6.1589e-7
    0.00679985   6.68334e-7
    0.00686928   7.21222e-7
    0.00693501   7.74293e-7
    0.00702751   8.54133e-7
    0.00711162   9.32238e-7
    0.00718968   1.00965e-6
     0.0072863   1.11235e-6
    0.00737191   1.21002e-6
    0.00748102   1.34407e-6
    0.00757358   1.46663e-6
      0.007678   1.61515e-6
     0.0077872   1.78267e-6
    0.00786254   1.90589e-6
    0.00795392   2.06403e-6
    0.00805598   2.25244e-6
    0.00816556   2.46918e-6
    0.00826965   2.68954e-6
    0.00836843   2.91231e-6
    0.00846211   3.13635e-6
    0.00859418   3.47423e-6
    0.00871454   3.80561e-6
    0.00882645   4.13476e-6
    0.00896526   4.57241e-6
    0.00908851   4.98949e-6
    0.00919774   5.38249e-6
    0.00933699   5.91667e-6
    0.00945516   6.40025e-6
    0.00958853   6.98075e-6
     0.0097335   7.65528e-6
    0.00986585   8.31221e-6
          0.01    9.0197e-6
     0.0101629   9.94157e-6
      0.010325   1.09258e-5
     0.0104854   1.19682e-5
     0.0106449   1.30749e-5
     0.0108026   1.42406e-5
     0.0109592   1.54717e-5
     0.0110627    1.6326e-5
     0.0112694   1.81327e-5
     0.0114732   2.00515e-5
     0.0116742   2.20816e-5
     0.0118723   2.42213e-5
     0.0120673   2.64685e-5
     0.0122594   2.88207e-5
     0.0124483   3.12748e-5
     0.0126341   3.38275e-5
     0.0129062   3.78222e-5
     0.0131725   4.20378e-5
     0.0134302   4.64145e-5
     0.0136819   5.09823e-5
      0.013925   5.56758e-5
      0.014162   6.05272e-5
     0.0144709   6.72646e-5
     0.0147665   7.41684e-5
     0.0150492   8.11955e-5
     0.0153191   8.83039e-5
     0.0156986   9.89757e-5
     0.0160552  0.000109736
     0.0163823  0.000120248
     0.0166883  0.000130648
     0.0170702  0.000144412
     0.0174115  0.000157461
     0.0178596  0.000175681
     0.0183398  0.000196598
     0.0187414  0.000215223
     0.0191816  0.000236822
     0.0197234   0.00026514
      0.020255  0.000294887
     0.0207584  0.000324887
     0.0212417  0.000355299
     0.0219328  0.000401538
     0.0225726  0.000447233
      0.023176  0.000492874
     0.0239359  0.000553845
     0.0246211  0.000612152
      0.025511  0.000692516
     0.0262805  0.000766182
     0.0271647  0.000855535
     0.0278474  0.000927888
     0.0289037   0.00104549
          0.03    0.0011746
     0.0310984   0.00131192
     0.0325374   0.00150208
     0.0337927   0.00167705
     0.0352478   0.00188982
     0.0363801   0.00206235
     0.0381472   0.00234293
          0.04    0.0026508
     0.0422949   0.00305319
      0.044102    0.0033825
     0.0469585   0.00392229
          0.05    0.0045187
     0.0547723   0.00549956
          0.06    0.0066081
          0.07    0.0087999
     0.0848528    0.0120928
     0.0948683    0.0142721
      0.110668    0.0176648
       0.11941    0.0194614
      0.126416    0.0208391
      0.137704    0.0229393
          0.15      0.02506
      0.161185    0.0270615
      0.170119    0.0285679
      0.184455    0.0308202
      0.211474    0.0347382
      0.229932    0.0372409
          0.25     0.039674
           0.3     0.045267
          0.35     0.050048
           0.4     0.054171
          0.45     0.057752
           0.5     0.060878
          0.55     0.063616
           0.6     0.066023
          0.65     0.068143
      0.724569    0.0708377
           0.8     0.073137
           0.9     0.075593
             1     0.077536
           1.1      0.07908
         1.249    0.0808065
           1.5     0.082866
           2.1    0.0868008
           2.4    0.0880739
           2.8    0.0891675
           3.2    0.0897054
           3.4    0.0897995
       3.89872    0.0895922
           4.5    0.0888896
             5     0.088017
           5.5    0.0868432
       7.74597    0.0800995
             9     0.076912
            10     0.074896]; 
temp_MeV = dummy(:,1);
sigma_barns = dummy(:,2);
temp_keV = temp_MeV*1000;
sigma_m2 = sigma_barns * 10^(-28); 
pos1 = find(temp_keV==10);
pos2 = find(temp_keV==50);
%c'è qualcosa di losco con i valori di sigma scaricati da qui
%https://scipython.com/blog/plotting-nuclear-fusion-cross-sections/
temp = temp_keV(pos1:pos2)';
sigma = sigma_m2(pos1:pos2)'; 
sigma_barns_plot = sigma_barns(pos1:pos2)'; 

figure(5)
%plot(temp, sigma_barns_plot,'r','Linewidth',1.5)
hold on
loglog(temp, sigma_barns_plot,'r','Linewidth',1.5)
    xlabel('temperature $(keV)$','Interpreter','Latex','Fontsize',18);
    ylabel('$\sigma$ ($barns$)','Interpreter','Latex','Fontsize',18);
    grid on
    grid minor
figure(6)
%plot(temp, sigma,'r','Linewidth',1.5)
loglog(temp, sigma,'m','Linewidth',1.5)
    xlabel('temperature $(keV)$','Interpreter','Latex','Fontsize',18);
    ylabel('$\sigma$ ($m^2$)','Interpreter','Latex','Fontsize',18);
    grid on
    grid minor

Tev_J = Tev.* (10^3*1.602*10^(-19));
velocity = sqrt( (8.*Tev_J)/(pi*m) );

sv = sigma.*velocity;
plot(Tev, sv)
tau_preciso = (6./n) .* (Tev.*10^3)/(4*10^6) .* (sigma .* velocity).^(-1);
    figure(7)
    plot(Tev,tau_preciso,'k','Linewidth',1.5)
    xlabel('temperature $(keV)$','Interpreter','Latex','Fontsize',18);
    ylabel('$\tau_E$ ($s$)','Interpreter','Latex','Fontsize',18);
    grid on
    grid minor

%Draw a rectangle that has a lower left corner at the point (1,2). 
%Make the width of the rectangle 5 units and the height 6 units. Then, change the axis limits.
% x = logspace(4,9); %(-4,1)
% y = logspace(16,24);
% loglog(x,y, 'w')
% hold on
% u1 = [10^5 10^5 10^8 10^8];%.*(8.617328149741 * 10^(-8));
% u2 = [10^(17) 10^(22) 10^(17) 10^(22)];
% plot(u1,u2, 'dk', 'Markersize', 8, 'Linewidth',2)
% 
% %axis([10^4 10^9 10^(16) 10^(24)])
% xlabel('temperature $(K)$','Interpreter','Latex','Fontsize',18);
% ylabel('electron number density ($m^{-3}$)','Interpreter','Latex','Fontsize',18);
% grid on
% grid minor

%end