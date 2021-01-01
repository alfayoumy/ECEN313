clear all;  
% Audio Input  
 [x,Fs] = audioread('main_audio.wav');  
 sound(x,Fs)
 
delay = 0.5; % 0.5s delay  
alpha = 0.65; % echo strength  
D = delay*Fs;  

% Echoed Signal
y = zeros(size(x));  
y(1:D) = x(1:D);  
   
 for i=D+1:length(x)  
   y(i) = x(i) + alpha*x(i-D);
 end
% echoed audio signal
 sound(y,Fs); 
 audiowrite('Echoed.wav',y,Fs);

res = zeros(size(y));
res(1:D) = y(1:D);

%Echo cancellation
 for i=D+1:length(y)  
   res(i) = y(i) - alpha*x(i-D);
 end
%Regenerated Sound from Echoed Sound
sound(res,Fs);
audiowrite('Regenerated.wav',res,Fs)

%Plots
%Original Signal
subplot(3,1,1); plot(x);
title('Original Signal');
xlabel('Time'); ylabel('Signal Value');

%Echoed Signal
subplot(3,1,2); plot(y);
title('Echoed Signal');
xlabel('Time'); ylabel('Signal Value');

%Regenerated Signal
subplot(3,1,3); plot(res);
title('Regenerated Signal');
xlabel('Time'); ylabel('Signal Value');

