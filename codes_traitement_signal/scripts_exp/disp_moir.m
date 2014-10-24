clear all
close all
clc
set(0, 'defaultfigurevisible', 'off');


x= linspace(1,100,100);
y= ones(1, length(x));

x2 = linspace(1,100,80);
y2 = ones(1,length(x2));



frame = 24;
N = 16;
t = linspace(0,20,N*frame);

b=0;
for a = t

bar(x, y, 0.3);
hold on
bar(x2+a, y2,0.3);
hold off
xlim([85 100]);
coucou = sprintf('./img/moire/moir%05d.png', b);
print ('-dpng', coucou);
b = b+1;
end
