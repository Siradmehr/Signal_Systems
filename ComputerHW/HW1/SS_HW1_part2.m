R=rand(100:100); %% create random matrix
tic %% timer of sum func
s=sum(R,'all')
toc
tic %% timer for sum with loop
s2=0;
for i=1:100
    for j=1:100
        s2=s2+R(i,j);
    end
end
toc