close all
time_start=0;
time_windows=303;
% x  = sig(5,1+time_start*125:1+(time_windows+time_start)*125);     % Input to the filter(相当于我们的噪声 y轴加速度)
% 
% % b  = fir1(31,0.5);     % FIR system to be identified
% % n  = 0.1*randn(1,500); % Observation noise signal
% d  = sig(2,1+time_start*125:1+(time_windows+time_start)*125);;  % Desired signal（相当于我们的原始PPG信号）
sig2_butter=hao_butter_band_pass(sig(2,:),time_start,time_windows,1,3,6,0);
sig5_butter=hao_butter_band_pass(sig(5,:),time_start,time_windows,1,3,6,0);
x  = sig5_butter(1+time_start*125:1+(time_windows+time_start)*125); 
d  = sig2_butter(1+time_start*125:1+(time_windows+time_start)*125);

mu = 1;                % NLMS step size
offset = 50;           % NLMS offset
ha = adaptfilt.nlms(32,mu,1,offset);
[y,e] = filter(ha,x,d);
subplot(2,1,1);
plot(linspace(time_start,time_start+time_windows,time_windows*125+1),[d;y;e]);
legend('Desired(原始PPG)','Output（滤波器输出）','Error（滤波后PPG）');
title('System Identification of FIR Filter');
xlabel('Time Index'); ylabel('Signal Value');
subplot(2,1,2);
plot(linspace(time_start,time_start+time_windows,time_windows*125+1),e);
legend('Error（滤波后PPG）');
xlabel('Time Index'); ylabel('Signal Value');


sig2_adaptive(1+time_start*125:1+(time_windows+time_start)*125)=e;
for i=1:14
figure
set(gcf,'outerposition',get(0,'screensize'));
haostart=280-20*i;
sig1_butter=hao_butter_band_pass(sig(1,:),haostart,8,1,3,6,0);
sig2_butter=hao_butter_band_pass(sig(2,:),haostart,8,1,3,6,0);
sig2_adaptive_butter=hao_butter_band_pass(sig2_adaptive,haostart,8,1,3,6,0);
sig4_butter=hao_butter_band_pass(sig(4,:),haostart,8,1,3,6,0);
sig5_butter=hao_butter_band_pass(sig(5,:),haostart,8,1,3,6,0);
sig6_butter=hao_butter_band_pass(sig(6,:),haostart,8,1,3,6,0);

% Spectrogram_horizontal(sig1_butter,haostart,8,'ECG',6,1)
Spectrogram_horizontal(sig(1,:),haostart,8,'ECG',6,1)
Spectrogram_horizontal(sig2_butter,haostart,8,'PPG1',6,2)
Spectrogram_horizontal(sig2_adaptive_butter,haostart,8,'Ada',6,3)


Spectrogram_horizontal(sig(4,:),haostart,8,'x',6,4)
Spectrogram_horizontal(sig(5,:),haostart,8,'y',6,5)
Spectrogram_horizontal(sig(6,:),haostart,8,'z',6,6)
end