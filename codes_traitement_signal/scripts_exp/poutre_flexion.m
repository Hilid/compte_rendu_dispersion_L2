%Script pour vibration poutre en flexion
%   =>Observation de la dispersion
%   =>Creation du support video

clear all
close all
clc

%Caractéristiques de la poutre
L = 3;                             %poutre de 10m
epaisseur = 2e-2;                   %epaisseur 2cm
largeur = 10e-2;                    %largeur  10cm
E = 210e9;                          %Module d'Young, ici de l'acier en Pascal       alu:69GPa/ fer:196GPa
rho = 7800;                         %Masse volumique en Kg/m^3                      alu:2700 / fer:7860

S = epaisseur * largeur;            % Section
i = largeur * epaisseur^3 / 12;     %moment quadratique de la poutre

%axes
t = linspace(0,10,1000);
x = linspace(0,40,1000);
f = linspace(0,20000,1000);

%==============================================================================================================================

%Relation de dispersion
C_f = (E*I /(rho*S))^(1/4) * sqrt(2*pi*f);

figure(1)
plot(f,C_f);
xlabel('frequence en Hz');
ylabel('Vitesse de phase en m/s');
title('relation de dispersion pour une poutre en flexion encastree-libre');
print -dpng poutre_dispersion.png





        
