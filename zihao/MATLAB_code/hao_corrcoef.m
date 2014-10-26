%计算时间窗口内两个信号的相关性
function hao_corrcoef_result=hao_corrcoef(tar_array,tar_array2,time_start,time_windows)
x=tar_array(1+time_start*125:(time_windows+time_start)*125);
y=tar_array2(1+time_start*125:(time_windows+time_start)*125);
temp=corrcoef(x,y);
hao_corrcoef_result=temp(1,2);

