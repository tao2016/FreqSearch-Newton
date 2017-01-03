close all; clear all; clc;

fs = 4000;
num = 4096;
win = parzenwin(num);
t = (1:num)/fs;  t = t(:);

data = 220 * sin(2*pi*51*t) .* win;
FData = fft(data);
idx = FindMaxIndex(FData);
fTemp = (idx-1)*fs/num;
fLow = fTemp - 1.5;
fHigh = fTemp + 1.5;

freq_test = 40 : 0.01 : 60;
[amp, rx, ix] = ddft(data, fs, freq_test);

%figure('Name','sin-wave');
% [f1_res, rx1, ix1] = diff1(data, fs, freq_test);
% [f2_res, rx2, ix2] = diff2(data, fs, freq_test);
% plot(freq_test, amp.^2, 'r', freq_test, f1_res, 'b', freq_test, f2_res, 'k'); grid on; legend('amp2', 'f1', 'f2'); hold on;
% [freq, cnt] = NewtonSearch(@diff1, @diff2, 0.0001, 10, 51.5, data, fs);

plot(freq_test, amp, 'b'); grid on;  hold on;
[freq, x1, x2, cnt] = GoldenSection(@ddft, 1, 20, fLow, fHigh, data, fs);

[frequent, count] = NewtonSearch(@diff1, @diff2, 0.0001, 10, freq, data, fs);