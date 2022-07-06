clc;
clear all;
close all;

x = input ('Enter the input signal: ');
n = input ('Enter the time sample: ');
N = input ('Enter the finite length: ');

if (N > length(x))
    for i=1:(N - length(x))
        x=[x 0];
    end
end

X = [];
