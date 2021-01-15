% plot the ECG signal from the sample
signal=load('ecg.txt');
plot(signal)
xlabel('Samples', 'FontSize', 15)
ylabel('Signal Amplitude', 'FontSize', 15)
title('ECG signal (@ 100Hz)', 'FontSize', 15)
% calculate BPM of an ECG signal
% count of samples greater than their two nearest neighbours
beats=0; 
for k=2:length(signal)-1
    if(signal(k)>signal(k-1) && signal(k)>signal(k+1) && signal(k) > 1)
        beats=beats+1;
    end
end
%divide the beats counted by the signal duration (in minutes)
fs=100;
time_in_sec=length(signal)/fs;
time_in_min=time_in_sec/60;
BPM=beats/time_in_min;
printf('BPM is  %d\n', BPM)
