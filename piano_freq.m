clear all; clc;
[y,Fs]=audioread('tone.wav'); %read file
X=fft(y); %fast fourier transform 
X=abs(X); %absolute of X
[y1,x1]=max(X); %maximum values of X
key=floor(log2(x1/220)*12) %reverse f in piano_generate.m
if key==3
    disp('C4')
  elseif key==4
      disp('Db4')
  elseif key==5
      disp('D4')
  elseif key==6
      disp('Eb4')
  elseif key==7
      disp('E4')
  elseif key==8
      disp('F4')
  elseif key==9
      disp('Gb4')
  elseif key==10
      disp('G4')
  elseif key==11
      disp('Ab4')
  elseif key==12
      disp('A4')
  elseif key==13
      disp('Bb4')
  elseif key==14
      disp('B4')
  elseif key==15
      disp('C5')
end
