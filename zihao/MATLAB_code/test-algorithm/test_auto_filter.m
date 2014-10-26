clear;
clc;
N=150;
length=10000;
t=0:1/(N+length):1-1/(N+length);
s=sin(4*pi*t);
n=randn(size(t));%随机数用于产生噪声
x=s+n;
w=zeros(1,N);
e=zeros(1,length);
E=zeros(1,length);
u=0.00174;
for i=1:length
    y(i)=x(i:i+N-1)*w';
    e(i)=s(i)-y(i);
    w=w+2*u*e(i)*x(i:i+N-1);
    E(i)=e(i)*e(i);
end
figure(1);
subplot(3,1,1);
plot(t,x);
axis([0 1 -5 5]);
title('带噪声信号');
subplot(3,1,2);
plot(t,s);
axis([0 1 -1.1 1.1]);
title('期望信号');
subplot(3,1,3);
plot(0:1/(N+length):(length-1)/(N+length),y);
axis([0 1 -1.1 1.1]);
title('滤波后信号');
figure(2);
plot((1:length),E);
axis([0 10000 0 0.1]);
title('误差')
