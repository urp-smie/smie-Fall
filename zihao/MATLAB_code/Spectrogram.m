function Spectrogram(tar_array,time_start,gstext)

figure
subplot(3,1,1)

t=0:1/125:8;%采样窗口 8s
N=length(t); %样点个数
y=tar_array(1+time_start*125:N+time_start*125);%从time_start开始的10s的点
y=y-mean(y); %去除直流分量
plot(t,y);
title(strcat('从第',num2str(time_start),'s开始的8s时间窗口',gstext,'原始时域波形')) 
fs=125;%采样频率

df=fs/(N-1);%分辨率

f=(0:N-1)*df;%其中每点的频率

Y=fft(y)/N*2;%真实的幅值

%Y=fftshift(Y);


subplot(3,1,2)

plot(f(1:round(N/2)),abs(Y(1:round(N/2))));
title(strcat(gstext,'频域图')) 
xlim([0,5]) 
subplot(3,1,3)
plot(f(1:round(N)),abs(Y(1:round(N))));
title(strcat(gstext,'完整频域图'))
