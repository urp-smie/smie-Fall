%�����н���һ����ͨ�˲��������ֱ�û��������ʼʱ�䡢ʱ�䴰�ڡ����Ƶ�ʡ����Ƶ�ʡ��˲����������Ƿ�ͼ
function [band_pass_out]=hao_butter_band_pass(tar_array,time_start,time_windows,f_set_low,f_set_high,orders,figure_out)

f1=f_set_low;
f2=f_set_high;
Fs=125;
N=orders;


[B,A] = butter(N,2*f2/Fs,'low');%N����Ҫ����ż������
Temp=tar_array(1,1+time_start*125:1+(time_windows+time_start)*125);

Temp2=filter(B,A,Temp);
[B,A] = butter(N,2*f1/Fs,'high');
Temp3=filter(B,A,Temp2);
    
    Temp11(1,1+time_start*125:1+(time_windows+time_start)*125)=Temp;
    Temp12(1,1+time_start*125:1+(time_windows+time_start)*125)=Temp2;
    Temp13(1,1+time_start*125:1+(time_windows+time_start)*125)=Temp3;
if figure_out==1
    
    Spectrogram(Temp11,time_start,time_windows,'ԭʼ�����˲���');
    Spectrogram(Temp12,time_start,time_windows,'��ͨ�˲���');
    Spectrogram(Temp13,time_start,time_windows,'��ͨ�����˲���');
end
  band_pass_out=Temp13;

