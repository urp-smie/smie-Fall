function accelerometer_Rawdatagram_8s(tar_raw_array,time_start,time_windows)
figure;
TIME_axis=[0:0.008:303.488];
subplot(3,1,1)
plot(TIME_axis,tar_raw_array(4,:))
xlim([0+time_start,time_windows+time_start])  
title('x��') 
subplot(3,1,2)
plot(TIME_axis,tar_raw_array(5,:))
xlim([0+time_start,time_windows+time_start]) 
title('y��') 
subplot(3,1,3)
plot(TIME_axis,tar_raw_array(6,:))
xlim([0+time_start,time_windows+time_start])  %������ʮ��Ĳ���
title('z��') 