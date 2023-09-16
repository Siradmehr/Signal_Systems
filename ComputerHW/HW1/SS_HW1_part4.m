close all
clear all
x=input('Enter x(with[]):   '); %% get first signal
h=input('Enter h(with[]):   '); %% get second signal
tic %% timer for conv_loop func
Y=conv_loop(x,h);
toc
tic %% timer for conv func
Y2=conv(x,h);
toc
tic %% timer for cov_nolopp func
Y3=cov_noloop(x,h);
toc
stem(Y); %% show conv on figure
ylabel('Y[n]');
xlabel('----->n');
title('Convolution of Two Signals ');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n=-40:40; %% set n for 2 signals
x1=heaviside(n+8)-heaviside(n-8); %% define signal x1
x2=heaviside(n+24)-heaviside(n-24); %% define signal x2
x3=conv(x1,x2); %% find conv with conv func
x4=conv_loop(x1,x2); %%find conv with conv_loop func
x5=cov_noloop(x1,x2); %%find conv with cov_noloop func
