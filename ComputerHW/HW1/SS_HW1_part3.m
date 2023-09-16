mu = 3; %% mean for A
vr = 4; %%var for A
A = mu + sqrt(vr)*randn(100,50); %% like part 1 for change mean to mu from 0 and var from 1 to vr
B= ones(50,10); %% creats matrix filled with one 
mu2 = 0;  %% mean for C
vr2 = 3;  %%var for C
C = mu2 + sqrt(vr2)*randn(100,50); %% like part 1 for change mean to mu2 from 0 and var from 1 to vr2
tic %%timer for * func
D= A*B;
toc
F= A.*C;
tic %%timer for * func with loop
for row = 1 : 100
  for col = 1 : 10
    theSum = 0;
    for k = 1 : 50
      theSum = theSum + A(row, k) * B(k, col);
    end
    E(row, col) = theSum;
  end
end
toc
