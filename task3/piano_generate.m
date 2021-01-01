clear all; clc;
fs=8000; %given frequency
word=input('','s'); %input notes separated by space, i.e.: 'C4 Db4 C4 E4'
ts=1/fs
t=0:ts:1
y=0
A = 220 %given frequency for A3
letter = strsplit(word) %split given string at whitespace char
for i=1:length(letter) %loop over given notes
  ltr=[letter(i){:}] %to compare each input note
  if strcmp(ltr, 'C4')
    f=A*2^(3/12);
  elseif strcmp(ltr, 'Db4')
      f=A*2^(4/12);
  elseif strcmp(ltr, 'D4')
      f=A*2^(5/12);
  elseif strcmp(ltr, 'Eb4')
      f=A*2^(6/12);
  elseif strcmp(ltr, 'E4')
      f=A*2^(7/12);
  elseif strcmp(ltr, 'F4')
      f=A*2^(8/12);
  elseif strcmp(ltr, 'Gb4')
      f=A*2^(9/12);
  elseif strcmp(ltr, 'G4')
      f=A*2^(10/12);
  elseif strcmp(ltr, 'Ab4')
      f=A*2^(11/12);
  elseif strcmp(ltr, 'A4')
      f=A*2^(12/12);
  elseif strcmp(ltr, 'Bb4')
      f=A*2^(13/12);
  elseif strcmp(ltr, 'B4')
      f=A*2^(14/12);
  elseif strcmp(ltr, 'C5')
      f=A*2^(15/12);
  end
  y= cat(2,y,sin(2*pi*f*t)); %given signal model
end

sound(y,fs); %play sound
audiowrite('tone.wav',y,fs); %save file
