% 
% 
% Two-channel PPG signals, three-axis acceleration signals, and one-channel ECG signals were simultaneously recorded from 
% subjects with age from 18 to 35. For each subject, the PPG signals were recorded from wrist by two pulse oximeters with green LEDs (wavelength: 609nm). Their distance (from center to center) was 2 cm. The acceleration signal was also recorded from wrist by a three-axis accelerometer. Both the pulse oximeter and the accelerometer were embedded in a wristband, which was comfortably worn. The ECG signal was recorded simultaneously from the chest of each subject using wet ECG sensors. All signals were sampled at 125 Hz.
% 
% 
% Each dataset with the similar name 'DATA_01_TYPE01' contains a variable 'sig'. It has 6 rows. The first row is a simultaneous recording of ECG, which is recorded from the chest of each subject. The second row and the third row are two channels of PPG, which are recorded from the wrist of each subject. The last three rows are simultaneous recordings of acceleration data (in x-, y-, and z-axis). 
% 
% During data recording, each subject ran on a treadmill with changing speeds. For datasets with names containing 'TYPE01', the running speeds changed as follows:
%         rest(30s) -> 8km/h(1min) -> 15km/h(1min) -> 8km/h(1min) -> 15km/h(1min) -> rest(30s)
% 
% For datasets with names containing 'TYPE02', the running speeds changed as follows:
%         rest(30s) -> 6km/h(1min) -> 12km/h(1min) -> 6km/h(1min) -> 12km/h(1min) -> rest(30s)
% 
% 
% For each dataset with the similar name 'DATA_01_TYPE01', the ground-truth of heart rate can be calculated from the simultaneously recorded ECG signal (i.e. the first row of the variable 'sig'). For convenience, we also provide the calculated ground-truth heart rate, stored in the datasets with the corresponding name, say 'DATA_01_TYPE01_BPMtrace'. In each of this kind of datasets, there is a variable 'BPM0', which gives the BPM value in every 8-second time window. Note that two successive time windows overlap by 6 seconds. Thus the first value in 'BPM0' gives the calcualted heart rate ground-truth in the first 8 seconds, while the second value in 'BPM0' gives the calculated heart rate ground-truth from the 3rd second to the 10th second. 
% 
% load data from matrix
load DATA_01_TYPE01.mat 'sig'
load DATA_01_TYPE01_BPMtrace.mat 'BPM0'
fs = 125;
start = 0;
tail = 8;
n = fs*(tail-start)+1;
ecg = zeros(1,n);
ppg = zeros(1,n);
dppg = zeros(1,n-1);
duration = 8;
referCycle = 0.85;

%test
% figure(1);
% i = 42;
% referCycle = 0.67;
% [ecg, ppg, dppg, testrate, testcycle] = plotdPPG(sig,i,i+8,referCycle);

%calculate average heart rate
% figure(2);
[m k] = size(sig);
seconds = floor(k/fs);
if mod(seconds,2) ~= 0
    seconds = seconds-1;
end
total = (seconds-8)/2+1;
rate = zeros(total,1);
cycle = zeros(total,1);
difference = zeros(total,1);
j=1;
for i=0:2:seconds-8
    [ecg, ppg, dppg, rate(j), cycle(j)] = plotdPPG(sig,i,i+duration,referCycle);
    difference(j) = abs(rate(j)-BPM0(j));
    j = j+1;
end

maxdif = max(difference);
mindif = min(difference);
average = mean(difference);
%calculate average heart rate


