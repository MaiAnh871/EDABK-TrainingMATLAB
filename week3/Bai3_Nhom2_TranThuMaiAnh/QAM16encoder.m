%% 16QAM ENCODER
function [xI, xQ] = QAM16encoder(bit_in)
    xI = [];                                %create empty array
    xQ = [];
    M = 16;
for i = 1:4:length(bit_in)                  %consider 4 bit/time
    signal = bit_in(i: i+3);
    de_signal = bi2de(signal);
    constellation_point = qammod(de_signal, M);
    xi = real(constellation_point);
    xq = imag(constellation_point);
    xI = [xI xi];                            %output
    xQ = [xQ xq];
end
end