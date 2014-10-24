clc
clear all
close all
set(0, 'defaultfigurevisible', 'off');

L = 0.05 ; %diamètre du guide
c = 340;   %célérité dans le guide

%expression des nombre d'onde, vitesse de phase, fontion propre
kx = @(n,w) sqrt( (w/c)^2 - (n*pi/L)^2 );
cph = @(w,kx) w/kx ;
front = @(y,n) 0.2*cos(n*pi*y./L)-4;

%paramètres des 2 signaux
f1 = 4000;
w1 = 2*pi*f1;
kx1 = kx(1,w1);    %mode 1 considéré
cph1 = cph(w1,kx1);

f2 = 6500;
w2 = 2*pi*f2;
kx2 = kx(1,w2);
cph2 = cph(w2,kx2);

%x = linspace(0,1,2^15);
y = linspace(0,L,2^7);


%pour f = f1

l1 = c/f1;   % longueur d'onde

x1 = front(y,1);
y1 = y;

for j= l1:l1:8
	x1 = [x1 front(y,1)+j];
	y1 = [y1 y];
end

%pour f = f2

l2 = c/f2;   % longueur d'onde

x2 = front(y,1);	
y2 = y;

for j= l2:l2:8
	x2 = [x2 front(y,1)+j];
	y2 = [y2 y];
end

%plot somme des signaux
N = 0.0062;                           %nb de seconde du signal
N2 = 12;                         %nb sec de la video
frame = 24;                    %taux img par sec de la video
vec_temps = linspace(0,N,frame*N2);       %vec temporel

a=0; %pour la numerotation des figures		
for t = vec_temps
	X1 = x1+t*cph1;  %à f1, le signal avance à la vitesse cph1
	X2 = x2 +t*cph2; %à f2, le signal avance à la vitesse cph2
	plot(X1,y1,'.r');
	hold on
	plot(X2,y2,'.b');
	axis([0 4 0 0.05]);
	hold off
	
	coucou = sprintf('img/figure_2/%05d.png',a);
	print ('-dpng', '-S1100,200', coucou  );
	a = a+1 ; 
end

%plot somme des signaux
%N = 0.1;                           %nb de seconde du signal
%N2 = 3;                         %nb sec de la video
%frame = 24;                    %taux img par sec de la video
%vec_temps = linspace(0,N,frame*N2);       %vec temporel

%x = linspace(0,1,10);
%y = linspace(0,L,10);

%for t=vec_temps
%pression_tot = pression(x,y,t,1,w1,kx1) + pression(x,y,t,1,w2,kx2);
%plot(pression_tot,y);
%print ('-dpng',  ['./img/figure' num2str(a) '.png'] );
%end
