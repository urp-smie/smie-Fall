function [ ] = plottime( sig, start, tail)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
t = start:1/125:tail;
%ECG
y = sig(1,:);
subplot(3,1,1);
plot(t,y(start*125+1:tail*125+1));
title('ECG');
%PPG1
y = sig(2,:);
subplot(3,1,2);
plot(t,y(start*125+1:tail*125+1));
title('PPG1');
%PPG2
y = sig(3,:);
%y = y-mean(y);
subplot(3,1,3);
plot(t,y(start*125+1:tail*125+1));
title('PPG2');
end

