SNR = 50;               
r = awgn(y,SNR);    %add noise to y
plot(t,r);