function [ ] = plottime( sig, start, tail)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
t = start:1/125:tail;
total = 6;
head = start*125+1;
endl = tail*125+1;
%ECG
y = sig(1,:);
subplot(toal,1,1);
plot(t,y(head:endl));
title('ECG');
%PPG1
y = sig(2,:);
subplot(total,1,2);
plot(t,y(head:endl));
title('PPG1');
%PPG2
y = sig(3,:);
%y = y-mean(y);
subplot(total,1,3);
plot(t,y(head:endl));
title('PPG2');
%x
y = sig(4,:);
subplot(total,1,4);
plot(t,y(head:endl));
title('x accelerator');
%y
y = sig(5,:);
subplot(total,1,5);
plot(t,y(head:endl));
title('y accelerator');
%z
y = sig(6,:);
subplot(total,1,6);
plot(t,y(head:endl));
title('z accelerator');
end

