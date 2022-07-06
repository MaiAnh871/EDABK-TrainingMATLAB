% DISCRETE SIGNAL
n = -1:1:3;
x = [1, 0.5, -1, 0, 2];

% PLOT FIGURE 1
stem (n, x);
xlim ([-3,6]);
ylim ([-2,3]);
xlabel ('n');
ylabel ('x(n)');
title ('Discrete signal example');

% PLOT FIGURE 2
f = 5;
t = (0:0.001:1)';
y = cos (2*pi*f*t);
plot (t, y)
xlim ([0,1]);
ylim ([-2,2]);
xlabel ('t(s)');
ylabel ('x(t)');
title ('Sin signal');