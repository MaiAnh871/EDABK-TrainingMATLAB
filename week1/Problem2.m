% CONVOLUTION
% function g = convolution (x, h)
    clc;
    clear all;
    close all;
    x = input ('Enter the input signal');
    h = input ('Enter the filter signal');
    p = length (x);
    q = length (h);
    s = p + q - 1;
    y = zeros (1,s);
    for i = 1:1:p
        for j = 1:1:q
            y(i+j-1) = y(i+j-1) + x(i)*h(j);
        end
    end
% end

% PLOT
subplot (3,1,1);
stem (x);
title ('x(n)');
subplot (3,1,2);
stem (h);
title ('h(n)');
subplot (3,1,3);
stem (y);
title ('y(n)');

% MATRIX