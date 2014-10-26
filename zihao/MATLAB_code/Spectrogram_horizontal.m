%用于水平放置的原波形、频谱图，参数分别是一个一维横向量，开始频谱计算的初始位置，项目名，时间窗口，绘图的函数，绘图窗口的纵向位置

function Spectrogram_horizontal(tar_array,time_start,time_windows,gstext,plot_rows,plot_rows_rank)

subplot(plot_rows,3,[(plot_rows_rank-1)*3+1 (plot_rows_rank-1)*3+2])
t=0:1/125:time_windows;%采样窗口 8s
N=length(t); %样点个数
y=tar_array(1+time_start*125:N+time_start*125);%从time_start开始的time_windows时间的点
y=y-mean(y); %去除直流分量
plot(t,y);

if strcmp(gstext,'x')||strcmp(gstext,'y')||strcmp(gstext,'z')
ylim([0 2])
end

title(strcat('从第',num2str(time_start),'s开始的',num2str(time_windows),'s时间窗口',gstext,'原始时域波形')) 
fs=125;%采样频率

df=fs/(N-1);%分辨率

f=(0:N-1)*df;%其中每点的频率

Y=fft(y)/N*2;%真实的幅值

%Y=fftshift(Y);


subplot(plot_rows,3,(plot_rows_rank-1)*3+3)

plot(f(1:round(N/2)),abs(Y(1:round(N/2))));

if strcmp(gstext,'x')||strcmp(gstext,'y')||strcmp(gstext,'z')
ylim([0 0.5])
end

if strcmp(gstext,'ECG')||strcmp(gstext,'PPG1')||strcmp(gstext,'PPG2')
hold on
%load('F:\2014\search\competition data\trunk\dustbin\DATA_01_TYPE01_BPMtrace.mat')
global BPM0                                  %Attempted to access BPM0(131); index out of bounds because numel(BPM0)=0.
heart_rate=BPM0(time_start/2+1)/60;          %在命令行载入心跳数据 然后运行global BMP0 把它设置成全局

line([heart_rate heart_rate],[0 30],'color','r');
end
title(strcat(gstext,'频域图')) 
xlim([0,5]) 
