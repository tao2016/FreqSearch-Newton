close all; clear all; clc;

fs = 4000;
num = 4096;
win = parzenwin(num);
t = (1:num)/fs;  t = t(:);


data = 220 * sin(2*pi*51*t) .* win;

figure('Name','sin-wave');
%subplot(4,1,1);  plot(t, data);  grid on;  xlabel('t');  ylabel('data(t)');

freq_test = 40 : 0.01 : 60;
[amp, rx, ix] = ddft(data, fs, freq_test);
%subplot(3,1,1); plot(freq_test, amp.^2);  grid on;  xlabel('f');  ylabel('amp2');

[f1_res, rx1, ix1] = diff1(data, fs, freq_test);
%subplot(3,1,2); plot(freq_test, f1_res); grid on; xlabel('f');  ylabel('f1');

[f2_res, rx2, ix2] = diff2(data, fs, freq_test);
%subplot(3,1,3); plot(freq_test, f2_res); grid on; xlabel('f');  ylabel('f2');

%plot(freq_test, amp.^2, 'r', freq_test, f1_res, 'b', freq_test, f2_res, 'k'); grid on; legend('amp2', 'f1', 'f2'); hold on;
%freq = NewtonSearch(@diff1, @diff2, 0.01, 5, 51.5, data, fs);

plot(freq_test, amp, 'b'); grid on;  hold on;
[freq, x1, x2] = GoldenSection(@ddft, 0.001, 20, 49, 52, data, fs);