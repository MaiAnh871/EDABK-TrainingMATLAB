clc;
clear all;
close all;

function b = genbits(N)
N = input ('Enter the number of binary bit');
n = randi ([0, 1], 1, N);
end