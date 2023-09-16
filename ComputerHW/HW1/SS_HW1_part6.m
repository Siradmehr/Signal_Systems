x=0:20; %%a domian for func to show them
f=((0.5).^x).*(heaviside(x)-heaviside(x-10)); %%define signal x
f(1)=1; %% cuz we want u[0]=1 so we change that by hand
f(11)=0.5.^10; %% cuz we want u[0]=1 so we change that by hand
a=[1 2]; %%for h1 read doc plz:)
b=[1 3]; %%for h1 read doc plz:)
h1=filter(b,a,f); %%find system answer
stem(x,h1) %% draw system ans
f1=conv(f,h1); %%find x1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a2=[1 3 2]; %%for h2 read doc plz:)
b2=[1 2];%%for h1 read doc plz:)
h2=impz(b2,a2);%% find system delta input answer
f2=conv(f1,h2); %%find x2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h3=[1 -2]; %%delta func simplizd,read doc plz :)
h4=((0.25).^x).*(heaviside(x)-heaviside(x-5)); %% define h4 funcion
h5=[1 -1]; %%delta func simplizd
f3=conv(f1,h3); %% find x3
f4=conv(f3,h4); %%find x4
f2=[f2,zeros(1,length(f4)-length(f2))]; %% read doc plz :)
f5=f2+f4; %%find x5
f6=conv(f5,h5); %%find x6