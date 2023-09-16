function ans_conv_loop = conv_loop(x,h)
m=length(x);
n=length(h);
X=[x,zeros(1,n)]; %%make x and h same length
H=[h,zeros(1,m)]; %%make x and h same length
for i=1:n+m-1
    ans_conv_loop(i)=0;
    for j=1:m
    if(i-j+1>0)
            ans_conv_loop(i)=ans_conv_loop(i)+X(j)*H(i-j+1); %% calculate with conv defintion
    end
    end
end
end