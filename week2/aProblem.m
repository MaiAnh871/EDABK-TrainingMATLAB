f = 10;                                  %input signal frequency
fs = 500;                                %sample frequency
t = (0:1/fs:1)';                         %time dimensons
x = cos (2*pi*f*t);                      %input signal
f0 = 40;                                 %carrier signal frequency
c = cos (2*pi*f0*t);                     %carrier signal
y = x.*c;                                %output signal
plot (t,y);
