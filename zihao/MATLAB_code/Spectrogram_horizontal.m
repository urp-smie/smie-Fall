%����ˮƽ���õ�ԭ���Ρ�Ƶ��ͼ�������ֱ���һ��һά����������ʼƵ�׼���ĳ�ʼλ�ã���Ŀ����ʱ�䴰�ڣ���ͼ�ĺ�������ͼ���ڵ�����λ��

function Spectrogram_horizontal(tar_array,time_start,time_windows,gstext,plot_rows,plot_rows_rank)

subplot(plot_rows,3,[(plot_rows_rank-1)*3+1 (plot_rows_rank-1)*3+2])
t=0:1/125:time_windows;%�������� 8s
N=length(t); %�������
y=tar_array(1+time_start*125:N+time_start*125);%��time_start��ʼ��time_windowsʱ��ĵ�
y=y-mean(y); %ȥ��ֱ������
plot(t,y);

if strcmp(gstext,'x')||strcmp(gstext,'y')||strcmp(gstext,'z')
ylim([0 2])
end

title(strcat('�ӵ�',num2str(time_start),'s��ʼ��',num2str(time_windows),'sʱ�䴰��',gstext,'ԭʼʱ����')) 
fs=125;%����Ƶ��

df=fs/(N-1);%�ֱ���

f=(0:N-1)*df;%����ÿ���Ƶ��

Y=fft(y)/N*2;%��ʵ�ķ�ֵ

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
heart_rate=BPM0(time_start/2+1)/60;          %�������������������� Ȼ������global BMP0 �������ó�ȫ��

line([heart_rate heart_rate],[0 30],'color','r');
end
title(strcat(gstext,'Ƶ��ͼ')) 
xlim([0,5]) 
