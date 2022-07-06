fxI = 10;                           %xI input signal frequency
xI = cos(2*pi*fxI*t);               %xI input signal

fxQ = 15;                           %xQ input signal frequency
xQ = cos(2*pi*fxQ*t);               %xQ input signal

f0 = 40;                            %carrier signal frequency
cI = cos(2*pi*f0*t);                %carrier signal towards xI
cQ = cos(2*pi*f0*t - pi/2);         %carrier signal towards xQ

yI = xI.*cI;                        %output signal towards xI
yQ = xQ.*cQ;                        %output signal towards xQ
y2 = yI + yQ;                       %output signal

Ay2 = speDr(y2);                    %draw spectrum for y2
plot(f,Ay2);

SNR = 10;  
sigma = 10^(-SNR/20);
r2 = y2 + sigma*randn(1,length(y2));%add noise to y
plot(t,r2);

YI = y2.*cI;                        
YQ = y2.*cQ;

fc2 = 40;                           %cut frequency
fi2 = fir1(100,[0.0001 2*fc/fs]);   %LPF

xhatI = 2*conv(fi2,YI);             %output signal
xhatQ = 2*conv(fi2,YQ);             %output signal

