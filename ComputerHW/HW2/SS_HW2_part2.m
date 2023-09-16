clear all;clc; 
syms x  
sum=0;  
y=heaviside(1+x)-heaviside(x-1);   
a0=(1/pi)*int(y,x,-pi,pi); 
for n=1:1     
    an=(1/pi)*int(y*cos(n*x),x,-4,4); 
    bn=(1/pi)*int(y*sin(n*x),x,-4,4);    
    sum=sum+(an*cos(n*x)+bn*sin(n*x));  
end 
ezplot(x,y,[-4,4]); 
grid on;hold on;  
ezplot(x,(sum+a0/2),[-4,4]);
sum=0;
for n=1:5     
    an=(1/pi)*int(y*cos(n*x),x,-4,4); 
    bn=(1/pi)*int(y*sin(n*x),x,-4,4);    
    sum=sum+(an*cos(n*x)+bn*sin(n*x));  
end 
grid on;hold on;  
ezplot(x,(sum+a0/2),[-4,4]);
sum=0;
for n=1:10     
    an=(1/pi)*int(y*cos(n*x),x,-4,4); 
    bn=(1/pi)*int(y*sin(n*x),x,-4,4);    
    sum=sum+(an*cos(n*x)+bn*sin(n*x));  
end 
grid on;hold on;  
ezplot(x,(sum+a0/2),[-4,4]);
sum=0;
for n=1:50     
    an=(1/pi)*int(y*cos(n*x),x,-4,4); 
    bn=(1/pi)*int(y*sin(n*x),x,-4,4);    
    sum=sum+(an*cos(n*x)+bn*sin(n*x));  
end 
grid on;hold on;  
ezplot(x,(sum+a0/2),[-4,4]);
sum=0;
for n=1:20     
    an=(1/pi)*int(y*cos(n*x),x,-4,4); 
    bn=(1/pi)*int(y*sin(n*x),x,-4,4);    
    sum=sum+(an*cos(n*x)+bn*sin(n*x));  
end 
grid on;hold on;  
ezplot(x,(sum+a0/2),[-4,4]);
sum=0;
for n=1:100     
    an=(1/pi)*int(y*cos(n*x),x,-4,4); 
    bn=(1/pi)*int(y*sin(n*x),x,-4,4);    
    sum=sum+(an*cos(n*x)+bn*sin(n*x));  
end 
grid on;hold on;  
ezplot(x,(sum+a0/2),[-4,4]);



