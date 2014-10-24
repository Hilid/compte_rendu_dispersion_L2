%avril 2014 
%diagramme de dispersion, impédance, ... pour la corde avec N masses


clear all; close all; %clc;

%	CONSTANTES
%=========================

d = 1.5*10^(-2); %longueur de la corde entre 2 masses en m
T = 100; %tension de la corde en N
u = 0.020; %masse linéique en kg/m
M = 2*10^(-3); %masse d'un plomb en kg

c = sqrt(T/u);
Zc = sqrt(u*T) ; %impédance caractéristique
Ze(1,1,:) = 0; %impedance d'entrée

freq = 0:5.1:5000;
f = zeros(1,1,length(freq));
f(1,1,:) = freq;
w = 2*pi*f;
k = w/c;

siz = length(f);


%	MATRICES DE TRANSFERT
%==================================

%POUR LE FIL
transfert_fil=[ cos(k*d/2) i*Zc*sin(k*d/2) ; i/Zc*sin(k*d/2) cos(k*d/2)];


%POUR LA DISCONTINUITE (MASSE)
transfert_masse = [1*ones(1,1,siz) i*w.*M ; zeros(1,1,siz) ones(1,1,siz)];

%FIL + DISCONTINUTÉ + FIL (symetrie et reciprocite)

for z = 1:siz
transfert_cellule(:,:,z) = transfert_fil(:,:,z)*transfert_masse(:,:,z)*transfert_fil(:,:,z);
end

%	RELATION DE DISPERSION
%==================================

for z = 1:siz
COS_GAMMAD(1,1,z) = (transfert_cellule(1,1,z)+transfert_cellule(2,2,z))./2;
end

y(1,:) = COS_GAMMAD(1,1,:);
x(1,:) = k(1,1,:).*d;

fct1 = @(x) 1;
fct2 = @(x) -1;

plot(x,y,'-');
hold on
fplot(fct1,[0 7], '-r');
hold on
fplot(fct2,[0 7], '-r');

legend('cos( \Gamma d )','y=1','y=-1');
xlabel('kd');
ylabel('cos( \Gamma d)');
title("Repre	sentation graphique de l'equation de dispersion");
print -dpng coucou.png


%~ %figure(2)
%~ 
%~ COS_GAMMAD_2 = cos(k*d) - (w.*M./Zc).*0.5.*sin(k*d) ;
%~ y(1,:) = COS_GAMMAD_2(1,1,:); 
%~ %plot(x,y,'-');
%~ 
%~ 
%~ res = c/(2*d)
%~ res2 = 2*res
%~ 
%~ figure(4)
%~ GAMMAD = acos(COS_GAMMAD);
%~ x(1,:) = real(GAMMAD);
%~ y(1,:) = k(1,1,:).*d;
%~ plot(x,y);
%~ %axis([0 3 0 3]);
%~ xlabel("Re(Kd)");
%~ ylabel("kd")
%~ 
%~ 
%~ figure(5)
%~ x(1,:) = imag(GAMMAD);
%~ plot(x,y);
%~ %axis([-0.003 0 0 7]);
%~ xlabel("Im(Kd)");
%~ ylabel("kd")

%admittance
%figure(3)
%x(1,:) = w(1,1,:);
%ye(1,:) = 1./Ze(1,1,:);


%plot(x(1,:),abs(ye(1,:)),'-');
%res = (1/sqrt(L*C))
%title('admittance')
























