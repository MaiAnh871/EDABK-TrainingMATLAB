%% 8PSK DECODER
function [bit_out] = PSK16decoder(wave_after_gauss, f0, fs)
    n = 16;                                             %number of constellation point types
    t = 0: 1/fs: 1/f0 - 1/fs;                           %time dimensions
    big_array = [];                                     %array of each carrier wave
    output_angle = [];
    bit_out = [];
%Create array of each carrier
    for i = 1:1:n                                       %j from 1 to 8 (types)
        s = cos(2*pi*f0*t + (i-1)*pi/(n/2));             %carrier wave
        big_array = [big_array; s];                     %add carrier wave to array
    end
        
%Use correlation
    for j = 1: fs/f0: length(wave_after_gauss)          %k from 1 to 300, with the jump value = 10
        signal = wave_after_gauss(j: j + fs/f0 - 1);    %devide each signal
        for k = 1: 1: n                                 %consider each sample signal
            value = xcorr (signal, big_array(k,:));     %use correlation
            for m = 1: 1: 2*fs/f0 - 1                   %consider wave band
                if value(m) == max(value) && m == fs/f0 %if the middle value is max
                    new_theta = (k-1)*pi/(n/2);             %then it's the wave we need to find out
                end
            end
        end
        output_angle = [output_angle; new_theta];       %array of angle
    end
    
%inverse mapping
    for u = 1: 1: length(output_angle)                  %reverse to constella diagram
       if output_angle(u) == 0
           bit3 = [0 0 0 0];
       elseif output_angle(u) == pi/8
           bit3 = [0 0 0 1];
       elseif output_angle(u) == pi/4
           bit3 = [0 0 1 1];
       elseif output_angle(u) == 3*pi/8
           bit3 = [0 0 1 0];
       elseif output_angle(u) == pi/2
           bit3 = [0 1 1 0];
       elseif output_angle(u) == 5*pi/8
           bit3 = [0 1 1 1];
       elseif output_angle(u) == 3*pi/4
           bit3 = [0 1 0 1];
       elseif output_angle(u) == 7*pi/8
           bit3 = [0 1 0 0];
       elseif output_angle(u) == pi
           bit3 = [1 1 0 0];
       elseif output_angle(u) == 9*pi/8
           bit3 = [1 1 0 1];
       elseif output_angle(u) == 5*pi/4
           bit3 = [1 1 1 1];
       elseif output_angle(u) == 11*pi/8
           bit3 = [1 1 1 0];
       elseif output_angle(u) == 3*pi/2
           bit3 = [1 0 1 0];
       elseif output_angle(u) == 13*pi/8
           bit3 = [1 0 1 1];
       elseif output_angle(u) == 7*pi/4
           bit3 = [1 0 0 1];
       elseif output_angle(u) == 15*pi/8
           bit3 = [1 0 0 0];
       end
       bit_out = [bit_out bit3];                        %output signal
    end
end