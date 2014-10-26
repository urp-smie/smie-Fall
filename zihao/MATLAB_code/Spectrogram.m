%��Ƶ��ͼ ��򵥵ģ�����Ϊ�����ݺ���������Ŀ����ʱ�䴰��
function Spectrogram(tar_array,time_start,time_windows,gstext)

figure
subplot(3,1,1)
t=0:1/125:time_windows;%�������� 8s
N=length(t); %�������
y=tar_array(1+time_start*125:N+time_start*125);%��time_start��ʼ��8s�ĵ�
y=y-mean(y); %ȥ��ֱ������
plot(t,y);
title(strcat('�ӵ�',num2str(time_start),'s��ʼ��',num2str(time_windows),'sʱ�䴰��',gstext,'ԭʼʱ����')) 
fs=125;%����Ƶ��

df=fs/(N-1);%�ֱ���

f=(0:N-1)*df;%����ÿ���Ƶ��

Y=fft(y)/N*2;%��ʵ�ķ�ֵ

%Y=fftshift(Y);


subplot(3,1,2)

plot(f(1:round(N/2)),abs(Y(1:round(N/2))));
title(strcat(gstext,'Ƶ��ͼ')) 
xlim([0,5]) 
subplot(3,1,3)
plot(f(1:round(N)),abs(Y(1:round(N))));
title(strcat(gstext,'����Ƶ��ͼ'))
