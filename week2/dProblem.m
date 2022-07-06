w = r.*c;                   %w signal
rr = fft(r);                %frequency band of r 
ww = fft(w);                %frequency band of w
Ar = abs(rr);               %amplititude of band rr (count from 0)
Aw = abs(ww);               %amplititude of band ww (count from 0)
Arr = fftshift(Ar);         %shift the amplititude of Ar to O
Aww = fftshift(Aw);         %shift the amplititude of Aw to O
plot(f,Arr);
plot(f,Aww);   
