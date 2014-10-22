function [ ] = plotfrequency( sig, start, tail ,fs)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%t = 0:1/125:(tail-start);



%ECG
cut = 8;
y = sig(1,start*125+1:tail*125+1);
len = length(y);
Y = fft(y,len)/len*2;
df = fs/(len-1);
f = (0:len-1)*df;
subplot(3,1,1);
plot(f(1:len/cut),abs(Y(1:len/cut)));
title('ECG spectrum');
%PPG1
y = sig(2,start*125+1:tail*125+1);
Y = fft(y,len)/len*2;
subplot(3,1,2);
plot(f(1:len/cut),abs(Y(1:len/cut)));
title('PPG1 spectrum');
%PPG2
y = sig(3,start*125+1:tail*125+1);
Y = fft(y,len)/len*2;
subplot(3,1,3);
plot(f(1:len/cut),abs(Y(1:len/cut)));
title('PPG2 spectrum');

end

