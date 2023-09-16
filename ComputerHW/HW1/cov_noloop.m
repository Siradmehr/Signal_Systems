function [convlve]= cov_noloop(x,h)
    L=length(x)+length(h)-1;
    convlve = ifft(fft(x,L).*fft(h,L)); %%read doc plz :)
end