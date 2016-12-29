function [result2, rx2, ix2] = diff2(x, fs, freq)

[~, ~, rx, ix] = ddft(x, fs, freq);
[~, rx1, ix1] = diff1(x, fs, freq);

N = length(x);
for i = 1 : N
    x(i) = i/fs * i/fs * x(i);
end

[~, ~, rx2, ix2] = ddft(x, fs, freq);

result2 = 4*pi*pi*(2*ix1.*ix1 + 2*rx.*(-rx2) + 2*rx1.*rx1 + 2*ix.*(-ix2));