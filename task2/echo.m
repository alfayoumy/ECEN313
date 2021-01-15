clear all;
% Audio Input  
 [x,Fs] = audioread('main_audio.wav');  
 sound(x,Fs) % Play original sound
 
delay = 2; % 2s delay
alpha = 0.7; % echo strength = 0.7
D = delay*Fs;

% Echoed Signal
y = zeros(size(x));
y(1:D) = x(1:D);
   
 for i=D+1:length(x)
   y(i) = x(i) + alpha*x(i-D);
 end

% Echoed audio signal
 sound(y,Fs); % Play echoed sound
 audiowrite('Echoed.wav',y,Fs) % Save echoed audio

res = zeros(size(y));
res(1:D) = y(1:D);

% Echo removal
 for i=D+1:length(y)  
   res(i) = y(i) - alpha*x(i-D);
 end

% Regenerating Original Sound from Echoed Sound
sound(res,Fs); % Play regenerated audio
audiowrite('Regenerated.wav',res,Fs) % Save regenerated audio

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
