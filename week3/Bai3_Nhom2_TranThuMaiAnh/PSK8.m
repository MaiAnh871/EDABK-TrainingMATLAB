%% 8PSK
%% CREATE
N2 = 90;                                    %length of b(n) signal
fs = 10000;                                 %sample frequency (Hz)
Rm = 1000;                                  %bit rate (bps)
f0 = 1000;                                  %carrier frequency (Hz)
L = fs/f0;                                  %L = 10
bit_in = randi ([0, 1], 1, N2);             %generate b(n) signal

%% CREATE CONSTELLA DIAGRAM USING GRAY CODING
[wave_after_encoder] = PSK8encoder(bit_in, f0, fs);

%% GAUSS
snr = 10;                                   %signal to noise ratio
wave_after_gauss = awgn(wave_after_encoder, snr);          %add noise

%% DECODER
[bit_out] = PSK8decoder(wave_after_gauss, f0, fs); %bit_out signal