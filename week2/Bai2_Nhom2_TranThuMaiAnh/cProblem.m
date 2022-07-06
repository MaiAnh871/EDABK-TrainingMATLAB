SNR = 10;               
r = awgn(y,SNR);    %add noise to y
plot(t,r);