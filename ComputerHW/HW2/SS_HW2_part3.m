fs=100;
t=-100:1/fs:100;
t2=-200:1/fs:200;
x = dirac(t);
idx = x == Inf; % find Inf
x(idx) = 1;     % set Inf to finite value
X=fft(x);
f = fs/2*linspace(-1,1,20000+1);
X=abs(fftshift(X));
plot(f,X);
h1=exp(-10*t).*heaviside(t);
h2=exp(-1*t).*heaviside(t);
h3=exp(-0.1*t).*heaviside(t);
h1(isnan(h1))=0;
h2(isnan(h2))=0;
h3(isnan(h3))=0;
figure;
plot(t,h1)
title('h1 filter');
xlabel('time');
ylabel('value');
figure;
plot(t,h2)
title('h2 filter');
xlabel('time');
ylabel('value');
figure;
plot(t,h3)
title('h3 filter');
xlabel('time');
ylabel('value');
y3=conv(x,h3);
plot(t2,y3)
title('h3*x');
xlabel('time');
ylabel('value');
Y3=fft(y3);
plot(t2,abs(Y3))
plot(t2,fftshift(abs(Y3)))
H3=fft(h3);
plot(t,abs(X.*H3))
plot(t,fftshift(abs(X.*H3)))
H3_2=(0.1-2.*pi.*t.*1i)/(0.01-4.*pi.*pi.*t.*t);
