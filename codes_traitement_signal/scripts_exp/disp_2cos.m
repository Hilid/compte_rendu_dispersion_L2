clc
clear all
close all
set(0, 'defaultfigurevisible', 'off');

%paramètres des 2 cosinus a additionner
c1 = 343;
c2 = c1/2;
f_0 = 10000;
delta_f = f_0 / 10;

w1 = 2*pi*f_0;
w2 = 2*pi*(f_0+delta_f);

k1 = w1 / c1;
k2 = w2 / c2;

%forme des cosinus
F1 = @(x,y) cos(w1 *y -k1*x);
F2 = @(x,y) cos(w2 *y -k2*x);



%plot somme de cosinus
N = 0.0005;                           %nb de seconde du signal
N2 = 5;                         %nb sec de la video
frame = 24;                    %taux img par sec de la video
t = linspace(0,N,frame*N2);       %vec temporelle

x = linspace(0,0.7,500);

for a = t                        %boucle de création de tout les .png
F = F1(x,a) + F2(x,a);
plot(F);
print ('-dpng',  ['./img/cosinus/figure' num2str(a) '.png'] );
end
