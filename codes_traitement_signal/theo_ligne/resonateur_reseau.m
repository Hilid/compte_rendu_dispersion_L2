%avril 2014 
%diagramme de dispersion, impédance, ... pour la corde avec N masses


clear all; close all; %clc;

%	CONSTANTES
%=========================

d = 14*10^(-2); %longueur de la corde entre 2 masses en m
V = (10*10^(-2))^3 ; %volume du resonanteur (50 cm cube)
l = 0.10; %longueur du col
s = pi*(2*10^(-2))^2; %section du col
s_tube = pi*(20*10^(-2))^2; %section du tube avant la discontinuite
rho = 1.2;
c = 340;
C = V/(rho*c*c);
L = rho*l/s ;

freq = 0:0.55:9000;
f = zeros(1,1,length(freq));
f(1,1,:) = freq;
w = 2*pi*f;
k = w/c;

Zc = rho*c/s_tube ; %impédance caractéristique
Ze(1,1,:) = 1./(i*w*C) + i*w*L; %impedance d'entrée

siz = length(f);


%	MATRICES DE TRANSFERT
%==================================

%POUR LE tube
transfert_tube=[ cos(k*d) i*Zc*sin(k*d) ; i/Zc*sin(k*d) cos(k*d)];


%POUR LA DISCONTINUITE 
transfert_masse = [1*ones(1,1,siz) zeros(1,1,siz) ; 1./Ze ones(1,1,siz)];

%tube + DISCONTINUTÉ + tube (symetrie et reciprocite)

for z = 1:siz
transfert_cellule(:,:,z) = transfert_tube(:,:,z)*transfert_masse(:,:,z);%*transfert_tube(:,:,z);
end

%	RELATION DE DISPERSION
%==================================

for z = 1:siz
COS_GAMMAD(1,1,z) = (transfert_cellule(1,1,z)+transfert_cellule(2,2,z))./2;
end

y(1,:) = COS_GAMMAD(1,1,:);
x(1,:) = k(1,1,:).*d;

plot(x,y,'-');
axis([0 4 -1 1.3]);

figure(2)

COS_GAMMAD_2 = cos(k*d) + (i*(1./Ze).*Zc.*sin(k*d))./2;
y(1,:) = COS_GAMMAD_2(1,1,:); 
plot(x,y,'-');
axis([0 4 -1 1.3]);
xlabel("cos(Kd)");
ylabel("kd");

%admittance
figure(3)
x(1,:) = w(1,1,:);
ye(1,:) = 1./Ze(1,1,:);

%subplot(1,2,1);
%figure(3)
plot(x(1,:),abs(ye(1,:)),'-');
res = (1/sqrt(L*C))
title('admittance')
axis([0 2000 0 0.0004]);
title(["Admittance du resonateur (resonance a f=",num2str(res)]);
xlabel("Pulsation en rad/s");
ylabel("Admitance du resonateur");


figure(4)
GAMMAD = acos(COS_GAMMAD);
x(1,:) = real(GAMMAD);
y(1,:) = k(1,1,:).*d;
plot(x,y);
axis([0 3 0 7]);
xlabel("Re(Kd)");
ylabel("kd")


figure(5)
x(1,:) = imag(GAMMAD);
plot(x,y);
axis([-0.003 0 0 7]);
xlabel("Im(Kd)");
ylabel("kd")




%ze(1,:) = Ze(1,1,:);
%subplot(1,2,2);
%plot(x(1,:),imag(ze(1,:)),'-o');





















