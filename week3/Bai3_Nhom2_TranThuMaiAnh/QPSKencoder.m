%% QPSK ENCODER
function [xI, xQ] = QPSKencoder(bitIN)
    xI = [];                                %create empty array
    xQ = [];
for i = 1:2:length(bitIN)                   %consider 2 bit/time
    if bitIN(i) == 0 && bitIN(i+1) == 0     %create constella diagram
        x = 1;                              %output of constella diagram
        y = 1;                              %output of constella diagram
    elseif bitIN(i) == 0 && bitIN(i+1) == 1
        x = -1;
        y = 1;
    elseif bitIN(i) == 1 && bitIN(i+1) == 1
        x = -1;
        y = -1;
    elseif bitIN(i) == 1 && bitIN(i+1) == 0
        x = 1;
        y = -1;
    end
    xI = [xI x];                            %output
    xQ = [xQ y];
end
end