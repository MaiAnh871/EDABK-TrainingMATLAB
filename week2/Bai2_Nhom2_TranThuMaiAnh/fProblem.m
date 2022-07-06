sNr = [0 10 20];
r = zeros(3, length(y));
w = zeros(3, length(y));
xhat = zeros(3, length(y) + length(fi) - 1);
for i = 1:3
   r(i,:) = awgn(y,sNr(i));
   w(i,:) = r(i,:).*c;
   xhat(i,:) = conv(fi,w(i,:));
end
plot(xhat(3,:));


