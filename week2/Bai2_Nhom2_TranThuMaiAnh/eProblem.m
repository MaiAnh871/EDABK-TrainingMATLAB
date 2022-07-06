fc = 50;                            %cut frequency
fi = fir1(100,[0.0001 2*fc/fs]);    %LPF
freqz(fi, 1, 512);