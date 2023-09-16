figure
x1=-30:30; %% set x for use
Y1=((0.8).^x1).*cos(0.3.*pi.*x1+pi/6); %% find function values
stem(x1,Y1,'filled') %%draw function 
title("((0.8).^x1).*cos(0.3.*pi.*x1+pi/6)");
ylabel('Y[n]');
xlabel('----->n');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure 
x2=-5:5;  %% set x for use
for i=-5:1:5
    if(mod(i,2)==0) %% set value for y[n] if n=2k
        Y2(6+i)=ceil(exp(-i).*sin(20.*i));
    end
    if(mod(i,2)==1) %% set value for y[n] if n=2k+1
        Y2(6+i)=floor(exp(-i).*cos(20.*i));
    end
end
stem(x2,Y2) %% draw y[n]
title("ceil(exp(-i).*sin(20.*i) or floor(exp(-i).*cos(20.*i)");
ylabel('Y[n]');
xlabel('----->n');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
x3=1:100;
Y3=log2(sqrt(x3));
stem(x3,Y3)
title("log2(sqrt(x3))");
ylabel('Y[n]');
xlabel('----->n');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
x4= -5:5;
for ii=1:11 %% sigma summation
    YY4(ii)=Y2(ii).*Y1(37-ii); %% set function value notice that y[5] in array equals to Y1[37]
end
stem(x4,YY4)
title("sum(Y2(i).*Y1(5-i)");
ylabel('Y[n]');
xlabel('----->n');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A=1;   %% mean
x5=1:1000; %% to set array of random 
B=sqrt(5); %% sqrt of var
Y5=B.*randn(1000,1)+A; %%%% plus A for change mean to A and *B for set var
figure
plot(x5,Y5)
title("random points with mean=1 and var=5");
ylabel('Y[n]');
xlabel('each point in n ');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Y6= @(t) sin(t).*heaviside(t).*exp(-t); %% define function y(t) by t parameter
t=linspace(-10,10,3001); %% sampling t in [-10,10] (3000 points)
figure
plot(t,Y6(t))
title("sin(t).*heaviside(t).*exp(-t)");
ylabel('Y[n]');
xlabel('----->n');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Y7= @(t2) sin(3.*t2)+0.1.*cos(100.*t2); %%define function y(t) by t
t2=linspace(-20,20,1001); %% sampling t in [-20,20] (1000 points)
figure
plot(t2,Y7(t2))
title("sin(3.*t)+0.1.*cos(100.*t)");
ylabel('Y[n]');
xlabel('----->n');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
t3=linspace(-0.4,0.4,1001);
Y8=cos(10.*t3)+1i*sin(10.*pi.*t3);
Y18=real(Y8); %% find real part of function 
Y28=imag(Y8); %% find imaginary part of function
subplot(2,1,1) %% to draw two plots in one figure
plot(t3,Y18)
title("cos(10.*t3)");
ylabel('Y[n]');
xlabel('----->n');
subplot(2,1,2) %% to draw two plots in one figure
plot(t3,Y28)
title("sin(10.*pi.*t3)");
ylabel('Y[n]');
xlabel('----->n');
figure 
Y38=phase(Y8); %% phase function on complex funtion
Y48=angle(Y8); %% phase function on complex funtion
subplot(2,1,1)
plot(t3,Y38)
title("cos(10.*t3)+i*sin(10.*pi.*t3))");
ylabel('phase');
xlabel('----->n');
subplot(2,1,2)
plot(t3,Y48)
title("cos(10.*t3)+i*sin(10.*pi.*t3)");
ylabel('angel');
xlabel('----->n');



















