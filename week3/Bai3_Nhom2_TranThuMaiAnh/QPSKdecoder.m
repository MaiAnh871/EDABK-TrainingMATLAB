%% QPSK DECODER
function [bitOUT] = QPSKdecoder(Xdec, Ydec)
bitOUT = [];                                %create empty array
for k = 1: 1: length(Xdec) - 1              %lose 1 bit at the end because of the lever of the filter
   if Xdec(k) == 1 && Ydec(k) == 1          %reverse to constella diagram
       bit1 = [0 0];
   elseif Xdec(k) == -1 && Ydec(k) == 1
       bit1 = [0 1];
   elseif Xdec(k) == -1 && Ydec(k) == -1
       bit1 = [1 1];
   elseif Xdec(k) == 1 && Ydec(k) == -1
       bit1 = [1 0];
   end
   bitOUT = [bitOUT bit1];                   %output signal
end
end