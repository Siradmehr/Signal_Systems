fs=1000;
t=0:1/fs:1;
X1=cos(2*pi*t);
figure, plot(t, abs(X1)), title('Amplitude plot')
figure, plot(t, angle(X1)), title('Phase plot')
A=fft(X1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f1=2;
f2=10;
X2=sin(2*pi*f1*t)+0.1*cos(2*pi*f2*t);
A2=fft(X2);
f=(0:length(A2)-1)*fs/length(A2);
plot(f,abs(A2))
xlabel('Frequency (Hz)')
ylabel('Magnitude')
title('Magnitude')
A2=fftshift(X2);
f = fs/2*linspace(-1,1,fs+1);
figure;
plot(f,abs(A2))
title('magnitude FFT of signal');
xlabel('Frequency (Hz)');
ylabel('magnitude');

