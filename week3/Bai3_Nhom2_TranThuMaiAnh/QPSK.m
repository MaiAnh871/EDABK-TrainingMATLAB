%% QPSK
%% CREATE
N1 = 100;                                   %length of b(n) signal
fs = 10000;                                 %sample frequency (Hz)
Rm = 1000;                                  %bit rate (bps)
L = fs/Rm;                                  %L = 10
bitIN = randi ([0, 1], 1, N1);              %generate b(n) signal

%% CREATE CONSTELLA DIAGRAM USING GRAY CODING
[xI, xQ] = QPSKencoder(bitIN);

%% PULSE SHAPE
Xf = kron (xI, ones (1, L));                %stretch 1 point to L points
Yf = kron (xQ, ones (1, L));

%% CARRIER
f0 = fs/L;                                  %fs = 10000, 10 sample/circle, 1000 circle/s, f = 1000.
t = (0: 1/fs: N1*L/(2*fs) - 1/fs);                   %time dimension
cX = sin(2*pi*f0*t);                        %carrier wave
cY = sin(2*pi*f0*t - pi/2);

Xs = Xf .* cX;                              %X wave after + carrier
Ys = Yf .* cY;                              %Y wave after + carrier
F = Xs + Ys;                                %signal at transmitter

%% GAUSS
snr = 10;                                   %signal to noise ratio
r = awgn(F, snr);                           %add noise to F
rX = r .* cX;                               %X wave after + carrier
rY = r .* cY;                               %Y wave after + carrier

%% LPF
f = [-fs/2: 2*Rm/N1: fs/2 - 2*Rm/N1];       %reset frequency dimensions
fc = 1000;                                  %cut frequency
[b, a] = butter (10, 2*fc/fs);              %LPF
Xhat = 2 * filter (b,a,rX);                 %output signal
Yhat = 2 * filter (b,a,rY);                 %output signal

%% Ts
%Convert x and y to 1 or -1
Xdec = [];                                  %create empty array
Ydec = [];
for j = 10 + L/2: L: N1*fs/(2*Rm)           %j starts from 10 because of the level of the filter
    if Xhat(j) > 0                          %converting
        xnew = 1;
    elseif Xhat(j) < 0
        xnew = -1;
    end
    if Yhat(j) > 0
        ynew = 1;
    elseif Yhat(j) < 0
        ynew = -1;
    end
    Xdec = [Xdec xnew];                     %array of x after being converted
    Ydec = [Ydec ynew];                     %array of y after being converted
end

%% DECODER
[bitOUT] = QPSKdecoder(Xdec, Ydec);

delta = bitOUT - bitIN(1:length(bitOUT));   %comparison between input and putput signal


    