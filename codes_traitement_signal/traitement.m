clear all; clc;

%==================================================================
% Chargement des données
%==================================================================
[donnees Fs] = wavread('./corde_seul_50cm_2/temporelles_Voie1.wav');
donnees_masses = wavread('./corde_lestee_temp50cm_3/temporelles_Voie1.wav');

%==================================================================
% Traitement
%==================================================================
fft_1 = fft(donnees);
fft_2 = fft(donnees_masses);

%==================================================================
% Affichage
%==================================================================

%figure(1)
%subplot(1,2,1);
%plot(donnees, '-r');
%title('Corde seul temporelle');
%subplot(1,2,2)
%plot(donnees_masses);
%title('corde avec masses, temporelle');

%-------------------------------------------

%figure(2)
%specgram(donnees);
%title('spectrogramme sans masses');

%figure(7)
%specgram(donnees_masses);
%title('spectrogramme avec masses');

%--------------------------------------------

figure(3)
semilogy(abs(fft_1))
xlim([0 100000]);
title('fft sans masses');

figure(4)
semilogy(abs(fft_2));
xlim([0 100000]);
title('fft avec masses');

%===============================================================

figure(5)
x = donnees_masses;
    step = fix(5*Fs/1000);     # one spectral slice every 0.5 ms
    window = fix(40*Fs/1000);  # 40 ms data window
    fftn = 2^nextpow2(window); # next highest power of 2
    specgram(x, fftn, Fs, window,  window-step);
    ylim([0 7000]);
    %[S, f, t] = specgram(x, fftn, Fs, window,  window-step);
    %S = abs(S(2:fftn*2000/Fs,:)); # magnitude in range 0<f<=4000 Hz.
    %S = S/max(S(:));           # normalize magnitude so that max is 0 dB.
    %S = max(S, 10^(-40/10));   # clip below -40 dB.
    %S = min(S, 10^(-1/10));    # clip above -3 dB.
    %imagesc(t,  f, log(S));   # display in log scale
%flipud(log(S))

%===============================================================

figure(6)
x = donnees;
    step = fix(5*Fs/1000);     # one spectral slice every 0.5 ms
    window = fix(40*Fs/1000);  # 40 ms data window
    fftn = 2^nextpow2(window); # next highest power of 2
    specgram(x, fftn, Fs, window,  window-step);
    ylim([0 7000]);
    %[S, f, t] = specgram(x, fftn, Fs, window,  window-step);
    %S = abs(S(2:fftn*4000/Fs,:)); # magnitude in range 0<f<=4000 Hz.
    %S = S/max(S(:));           # normalize magnitude so that max is 0 dB.
    %S = max(S, 10^(-40/10));   # clip below -40 dB.
    %S = min(S, 10^(-3/10));    # clip above -3 dB.
    %imagesc(t,  f, log(S));   # display in log scale
%flipud(log(S))




