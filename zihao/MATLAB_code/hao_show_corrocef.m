% During data recording, each subject ran on a treadmill with changing speeds. For datasets with names containing 'TYPE01', the running speeds changed as follows:
% rest(30s) -> 8km/h(1min) -> 15km/h(1min) -> 8km/h(1min) -> 15km/h(1min) -> rest(30s)
% 0~30          30~90         90~150           150~210        210~260
%        
% For datasets with names containing 'TYPE02', the running speeds changed as follows:
%         rest(30s) -> 6km/h(1min) -> 12km/h(1min) -> 6km/h(1min) -> 12km/h(1min) -> rest(30s)
%计算每个的各部分相关性，时常为1s
close all;
xtemp=[1:37500];
sig1temp=zeros(1,37500);
sig2temp=zeros(1,37500);
sig3temp=zeros(1,37500);
sig4temp=zeros(1,37500);
sig5temp=zeros(1,37500);
for i=1:37500
sig1temp(i)=hao_corrcoef(sig(1,:),sig(2,:),i/125,1);
sig2temp(i)=hao_corrcoef(sig(3,:),sig(2,:),i/125,1);
sig3temp(i)=hao_corrcoef(sig(4,:),sig(2,:),i/125,1);
sig4temp(i)=hao_corrcoef(sig(5,:),sig(2,:),i/125,1);
sig5temp(i)=hao_corrcoef(sig(6,:),sig(2,:),i/125,1);
end
figure
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
