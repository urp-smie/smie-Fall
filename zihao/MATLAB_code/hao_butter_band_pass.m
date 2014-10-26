%对序列进行一个带通滤波，参数分别没向量、开始时间、时间窗口、最低频率、最高频率、滤波器阶数、是否画图
function [band_pass_out]=hao_butter_band_pass(tar_array,time_start,time_windows,f_set_low,f_set_high,orders,figure_out)

f1=f_set_low;
f2=f_set_high;
Fs=125;
N=orders;


[B,A] = butter(N,2*f2/Fs,'low');%N阶数要求是偶数这里
Temp=tar_array(1,1+time_start*125:1+(time_windows+time_start)*125);

Temp2=filter(B,A,Temp);
[B,A] = butter(N,2*f1/Fs,'high');
Temp3=filter(B,A,Temp2);
    
    Temp11(1,1+time_start*125:1+(time_windows+time_start)*125)=Temp;
    Temp12(1,1+time_start*125:1+(time_windows+time_start)*125)=Temp2;
    Temp13(1,1+time_start*125:1+(time_windows+time_start)*125)=Temp3;
if figure_out==1
    
    Spectrogram(Temp11,time_start,time_windows,'原始巴特滤波器');
    Spectrogram(Temp12,time_start,time_windows,'低通滤波器');
    Spectrogram(Temp13,time_start,time_windows,'带通巴特滤波器');
end
  band_pass_out=Temp13;

