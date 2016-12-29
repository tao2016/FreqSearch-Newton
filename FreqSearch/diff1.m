function [result1, rx1, ix1] = diff1(x, fs, freq)
%rx1 Êµ²¿
%ix1 Ðé²¿
N = length(x);
[~, ~, rx, ix] = ddft(x, fs, freq); 

for i = 1 : N
    x(i) = i/fs * x(i);
end

[~, ~, rx1, ix1] = ddft(x, fs, freq);

result1 = 2*pi*(2*rx.*ix1 + 2*ix.*(-rx1));