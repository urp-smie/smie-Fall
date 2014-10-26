% During data recording, each subject ran on a treadmill with changing speeds. For datasets with names containing 'TYPE01', the running speeds changed as follows:
% rest(30s) -> 8km/h(1min) -> 15km/h(1min) -> 8km/h(1min) -> 15km/h(1min) -> rest(30s)
% 0~30          30~90         90~150           150~210        210~260
%        
% For datasets with names containing 'TYPE02', the running speeds changed as follows:
%         rest(30s) -> 6km/h(1min) -> 12km/h(1min) -> 6km/h(1min) -> 12km/h(1min) -> rest(30s)
%从hao_corr_dataset里面直接读数据画图
figure
xtemp=[1:0.008:301-0.008];
subplot(5,1,1)
plot(xtemp,sig1temp);
subplot(5,1,2)
plot(xtemp,sig2temp);
subplot(5,1,3)
plot(xtemp,sig3temp);
subplot(5,1,4)
plot(xtemp,sig4temp);
subplot(5,1,5)
plot(xtemp,sig5temp);
