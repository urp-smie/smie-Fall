function Rawdatagram_8s(tar_raw_array,time_start)
figure;
TIME_axis=[0:0.008:303.488];
subplot(3,1,1)
plot(TIME_axis,tar_raw_array(1,:))
xlim([0+time_start,10+time_start])  %现在是十秒的波形
title('ECG') 
subplot(3,1,2)
plot(TIME_axis,tar_raw_array(2,:))
xlim([0+time_start,10+time_start])  %现在是十秒的波形
title('PPG1') 
subplot(3,1,3)
plot(TIME_axis,tar_raw_array(3,:))
xlim([0+time_start,10+time_start])  %现在是十秒的波形
title('PPG2') 