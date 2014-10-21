% Two-channel PPG signals, three-axis acceleration signals, and one-channel ECG signals were simultaneously recorded from
% subjects with age from 18 to 35. For each subject, the PPG signals were recorded from wrist by two pulse oximeters with
% green LEDs (wavelength: 609nm). Their distance (from center to center) was 2 cm. The acceleration signal was also recorded 
% from wrist by a three-axis accelerometer. Both the pulse oximeter and the accelerometer were embedded in a wristband, which 
% was comfortably worn. The ECG signal was recorded simultaneously from the chest of each subject using wet ECG sensors. All
% signals were sampled at 125 Hz.
%
%
% Each dataset with the similar name 'DATA_01_TYPE01' contains a variable 'sig'. It has 6 rows. The first row is a simultaneous 
% recording of ECG, which is recorded from the chest of each subject. The second row and the third row are two channels of PPG, 
% which are recorded from the wrist of each subject. The last three rows are simultaneous recordings of acceleration data (in x-, y-, and z-axis).
%
% During data recording, each subject ran on a treadmill with changing speeds. For datasets with names containing 'TYPE01', the running speeds changed as follows:
% rest(30s) -> 8km/h(1min) -> 15km/h(1min) -> 8km/h(1min) -> 15km/h(1min) -> rest(30s)
% 0~30          30~90         90~150           150~210        210~260
%        
% For datasets with names containing 'TYPE02', the running speeds changed as follows:
%         rest(30s) -> 6km/h(1min) -> 12km/h(1min) -> 6km/h(1min) -> 12km/h(1min) -> rest(30s)
%
%
% % For each dataset with the similar name 'DATA_01_TYPE01', the ground-truth of heart rate can be calculated from the 
% simultaneously recorded ECG signal (i.e. the first row of the variable 'sig'). For convenience, we also provide the calculated 
% ground-truth heart rate, stored in the datasets with the corresponding name, say 'DATA_01_TYPE01_BPMtrace'. In each of this kind of datasets,
% there is a variable 'BPM0', which gives the BPM value in every 8-second time window. Note that two successive time windows overlap
% by 6 seconds. Thus the first value in 'BPM0' gives the calcualted heart rate ground-truth in the first 8 seconds, wh‘ile the second
%     value in 'BPM0' gives the calculated heart rate ground-truth from the 3rd second to the 10th second.


close all %关闭之前的所有figure图
Rawdatagram_8s(sig,0)


Spectrogram(sig(2,:),0,'PPG1')

Spectrogram(sig(1,:),0,'ECG')
accelerometer_Rawdatagram_8s(sig,0,250);
Spectrogram(sig(6,:),0,'x')
Spectrogram(sig(6,:),40,'x')
Spectrogram(sig(6,:),100,'x')