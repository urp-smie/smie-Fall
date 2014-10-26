function Rawdatagram(tar_raw_array,time_start,time_windows)
figure;
TIME_axis=[0:0.008:303.488];
subplot(3,1,1)
plot(TIME_axis,tar_raw_array(1,:))
xlim([0+time_start,time_windows+time_start])  %������ʮ��Ĳ���
title('ECG') 
subplot(3,1,2)
plot(TIME_axis,tar_raw_array(2,:))
xlim([0+time_start,time_windows+time_start])  %������ʮ��Ĳ���
title('PPG1') 
subplot(3,1,3)
plot(TIME_axis,tar_raw_array(3,:))
xlim([0+time_start,time_windows+time_start])  %������ʮ��Ĳ���
title('PPG2') 