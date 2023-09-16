x=-5:5; %% domain to define signals
Y1=exp(x).*(heaviside(x+5)-heaviside(x-5)) %%signal1
Y2=(heaviside(x+5)-heaviside(x-5)) %%signal2
Y3=2.*(heaviside(x+5)-heaviside(x-5)) %%signal3
C1=conv(Y1,Y2) %%conv signal1 & signal2 equals to:
C2=conv(Y2,Y1) %%conv signal2 & signal1
Y4=Y2+Y3; %%new signal4 for part 2
C3=conv(Y1,Y4) %%conv signal1 & signal4 equals to:
C4=conv(Y1,Y2)+conv(Y1,Y3); %%conv apart then sum them
y = dirac(x-1);
idx = y == Inf; % find Inf
y(idx) = 1; %% change inf with 1
C5=conv(Y1,y) %%conv with delta dirac
Y5=Y1.*(heaviside(x)) %%new signal for part 4
C6=conv(Y5,Y2) %% conv for part4 (isn't equal to C1 or C2) 