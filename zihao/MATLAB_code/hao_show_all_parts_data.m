% During data recording, each subject ran on a treadmill with changing speeds. For datasets with names containing 'TYPE01', the running speeds changed as follows:
% rest(30s) -> 8km/h(1min) -> 15km/h(1min) ->8km/h(1min) ->15km/h(1min)->rest(30s)
% 0~30          30~90         90~150           150~210     210~270 270-300
      
% For datasets with names containing 'TYPE02', the running speeds changed as follows:
%         rest(30s) -> 6km/h(1min) -> 12km/h(1min) -> 6km/h(1min) -> 12km/h(1min) -> rest(30s)

%展示所有的ecg ppg1 pgg2 x y z的时域频域图

close all %关闭之前的所有figure图


for i=1:14
figure
set(gcf,'outerposition',get(0,'screensize'));
haostart=280-20*i;
sig1_butter=hao_butter_band_pass(sig(1,:),haostart,8,1,3,6,0);
sig2_butter=hao_butter_band_pass(sig(2,:),haostart,8,1,3,6,0);
sig3_butter=hao_butter_band_pass(sig(3,:),haostart,8,1,3,6,0);
sig4_butter=hao_butter_band_pass(sig(4,:),haostart,8,1,3,6,0);
sig5_butter=hao_butter_band_pass(sig(5,:),haostart,8,1,3,6,0);
sig6_butter=hao_butter_band_pass(sig(6,:),haostart,8,1,3,6,0);
Spectrogram_horizontal(sig1_butter,haostart,8,'ECG',6,1)
Spectrogram_horizontal(sig2_butter,haostart,8,'PPG1',6,2)
Spectrogram_horizontal(sig3_butter,haostart,8,'PPG2',6,3)
Spectrogram_horizontal(sig4_butter,haostart,8,'x',6,4)
Spectrogram_horizontal(sig5_butter,haostart,8,'y',6,5)
Spectrogram_horizontal(sig6_butter,haostart,8,'z',6,6)

% Spectrogram_horizontal(sig(1,:),haostart,8,'ECG',6,1)
% Spectrogram_horizontal(sig(2,:),haostart,8,'PPG1',6,2)
% Spectrogram_horizontal(sig(3,:),haostart,8,'PPG2',6,3)
% Spectrogram_horizontal(sig(4,:),haostart,8,'x',6,4)
% Spectrogram_horizontal(sig(5,:),haostart,8,'y',6,5)
% Spectrogram_horizontal(sig(6,:),haostart,8,'z',6,6)
end
