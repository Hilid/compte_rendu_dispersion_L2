clear all
clc

%====================================================================

fid = fopen('./freq_corde_50cm/Autospectres.txt');
titre = fgetl(fid);
[donnees , plop ] = fscanf(fid, '%g %g', [2, inf]);


freq = donnees(1,:);
dsp = donnees(2,:);

figure(10)
semilogy(freq, dsp);
title('pas leste');

fclose(fid);

%====================================================================


fid2 = fopen('./freq_cordeleste_50cm/Autospectres.txt');
titre2 = fgetl(fid);
[donnees2 , plop2 ] = fscanf(fid2, '%g %g', [2, inf]);


freq2 = donnees2(1,:);
dsp2 = donnees2(2,:);

figure(11)
semilogy(freq2, dsp2);
title('leste');

fclose(fid2);



