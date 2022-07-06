xx = fft(x);                %frequency band of x
yy = fft(y);                %frequency band of y
Ax = abs(xx);               %amplititude of band xx (count from 0)
Ay = abs(yy);               %amplititude of band yy (count from 0)
f = (-250:1:250)';          %frequency dimensions (count from -250)
Axx = fftshift(Ax);         %shift the amplititude of Ax to O
Ayy = fftshift(Ay);         %shift the amplititude of Ay to O
plot (f,Axx);               %create plot of Axx by f
plot (f,Ayy);               %cre ate plot of Ayy by f



