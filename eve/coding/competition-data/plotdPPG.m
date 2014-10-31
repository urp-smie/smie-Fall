function [ecg, ppg, dppg, rate, averageCycle] = plotdPPG( sig, start, tail, referCycle )
%   process PPG wave
%   the higest heart rate is 166.8432
%   the lowest heart rate is 69.5160
fs = 125;   
t = start:1/fs:tail;
len = length(t);
total = 3;
peakbound = 2;
excess = 1.1;
mincycle = 0.35;
%maxcycle = 0.9;
% fs = fs;
% gap = 15/fs;
%ECG
y = sig(1,start*fs+1:tail*fs+1);
ecg = y;
%y = smooth(y);
subplot(total,1,1);
plot(t,y);
title('ECG');

%PPG1
y = sig(2,start*fs+1:tail*fs+1);
y = smooth(y)';
ppg = y;

%dPPG1
dy = diff(y);
sy = smooth(dy);
sy = smooth(sy);
sy = smooth(sy)';
dppg = sy;

%find peak position
j=1;
for i=2:len-2
    if dppg(i)>=dppg(i-1) && dppg(i)>=dppg(i+1) && dppg(i)>=peakbound
        peak(j) = (i-1)/fs + start;
        peakinteger(j) = i;
        j = j+1;
    end
end

%plot PPG
subplot(total,1,2);
plot(t,y);
title('PPG1-smooth1');hold on;
maxpoint = max(y);
minipoint = min(y);
n=1;
%find start points
for k=1:j-1
    for m=peakinteger(k):-1:2
        if y(m)<=y(m+1) && y(m)<=y(m-1)
            if n>1 && (m==startpointinteger(n-1))
               break;
            end
            startpoint(n) = (m-1)/fs + start;
            startpointinteger(n) = m;
            n = n+1;
            break;
        end
    end
end
%plot lines
for k=1:n-1
    plot([startpoint(k),startpoint(k)],[minipoint*excess,maxpoint*excess]);hold on;
end

%merge some small cycle
%bpm<100, 0.6<rate
%100<bpm<120, 0.5<rate<0.6
%120<bpm, rate<0.5
control=[0.8,0.7,0.6];
cycle = zeros(1,n-2);
small = 0;
k = 2;
count = 2;
cyclecount = 2;
final(1) = startpoint(1);
if referCycle>0.6
    mincycle = referCycle*control(1);
else if referCycle>0.5
        mincycle = referCycle*control(2);
    else
        mincycle = referCycle*control(3);
    end
end

cycle(1) = referCycle;
while k<=n-1
    current = startpoint(k)-startpoint(k-1);
    if current<mincycle
        if small==0
            small = 1;
            temp = current;
        else
            small = 0;
            cycle(cyclecount) = temp+current;
            final(count) = startpoint(k);
            count = count+1;
            cyclecount = cyclecount+1;
        end
    else
        cycle(cyclecount) = current;
        final(count) = startpoint(k);
        count = count+1;
        cyclecount = cyclecount+1;
        small = 0;
    end   
    k = k+1;
    ave = mean(cycle(1:cyclecount-1));
    if ave>0.6
        mincycle = ave*control(1);
    else if ave>0.5
            mincycle = ave*control(2);
        else
            mincycle = ave*control(3);
    end
end
end

%plot new PPG 
for k=1:count-1
    plot([final(k),final(k)],[minipoint*excess,maxpoint*excess],'r');hold on;
end
hold off;

%plot dPPG
subplot(total,1,3);
plot(t(1:len-1),dppg);hold on;
title('dPPG1-smooth3');
maxpoint = max(dppg);
minipoint = min(dppg);
for k=1:j-1
    plot([peak(k),peak(k)],[minipoint*excess,maxpoint*excess]);hold on;
end

%calculate average cycle time
averageCycle = mean(cycle(2:cyclecount-1));
rate = 60/averageCycle;

hold off;
end

