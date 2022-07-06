%% 8PSK ENCODER
function [wave_after_encoder] = PSK16encoder(bit_in, f0, fs)
    wave_after_encoder = [];                            %output
    t = [0: 1/fs: 1/f0 - 1/fs];                         %time dimensions
    for i = 1:4:length(bit_in)                          %create constellation
        if bit_in(i) == 0 && bit_in(i+1) == 0 && bit_in(i+2) == 0 && bit_in(i+3) == 0
            theta = 0;
        elseif bit_in(i) == 0 && bit_in(i+1) == 0 && bit_in(i+2) == 0 && bit_in(i+3) == 1
            theta = pi/8;
        elseif bit_in(i) == 0 && bit_in(i+1) == 0 && bit_in(i+2) == 1 && bit_in(i+3) == 1
            theta = pi/4;
        elseif bit_in(i) == 0 && bit_in(i+1) == 0 && bit_in(i+2) == 1 && bit_in(i+3) == 0
            theta = 3*pi/8;
        elseif bit_in(i) == 0 && bit_in(i+1) == 1 && bit_in(i+2) == 1 && bit_in(i+3) == 0
            theta = pi/2;
        elseif bit_in(i) == 0 && bit_in(i+1) == 1 && bit_in(i+2) == 1 && bit_in(i+3) == 1
            theta = 5*pi/8;
        elseif bit_in(i) == 0 && bit_in(i+1) == 1 && bit_in(i+2) == 0 && bit_in(i+3) == 1
            theta = 3*pi/4;
        elseif bit_in(i) == 0 && bit_in(i+1) == 1 && bit_in(i+2) == 0 && bit_in(i+3) == 0
            theta = 7*pi/8;
        elseif bit_in(i) == 1 && bit_in(i+1) == 1 && bit_in(i+2) == 0 && bit_in(i+3) == 0
            theta = pi;
        elseif bit_in(i) == 1 && bit_in(i+1) == 1 && bit_in(i+2) == 0 && bit_in(i+3) == 1
            theta = 9*pi/8;
        elseif bit_in(i) == 1 && bit_in(i+1) == 1 && bit_in(i+2) == 1 && bit_in(i+3) == 1
            theta = 5*pi/4;
        elseif bit_in(i) == 1 && bit_in(i+1) == 1 && bit_in(i+2) == 1 && bit_in(i+3) == 0
            theta = 11*pi/8;
        elseif bit_in(i) == 1 && bit_in(i+1) == 0 && bit_in(i+2) == 1 && bit_in(i+3) == 0
            theta = 3*pi/2; 
        elseif bit_in(i) == 1 && bit_in(i+1) == 0 && bit_in(i+2) == 1 && bit_in(i+3) == 1
            theta = 13*pi/8;
        elseif bit_in(i) == 1 && bit_in(i+1) == 0 && bit_in(i+2) == 0 && bit_in(i+3) == 1
            theta = 7*pi/4;
        elseif bit_in(i) == 1 && bit_in(i+1) == 0 && bit_in(i+2) == 0 && bit_in(i+3) == 0
            theta = 15*pi/8;
        end
        carrier_wave = cos(2*pi*f0*t + theta);          %carrier wave
        wave_after_encoder = [wave_after_encoder carrier_wave]; 
    end
end