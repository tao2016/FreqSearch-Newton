close all; clear all; clc;

fs = 4000;
num = 4096;
win = parzenwin(num);
t = (1:num)/fs;  t = t(:);

FL = 8;
FH = 450;
FStep = 0.5;
Fb = FL : FStep : FH;
FError = Fb * 0;
FCalc = Fb * 0; %计算值
ADPresion = 16;
for k = 1 : length(Fb)
    data = (sin(2*pi*Fb(k)*t) + 0.01*randn(num, 1));
    % AD量化，并加窗
    data = round(data .* 2^ADPresion) .* win; % data = round(data .* 2^ADPresion) .* win/2^ADPresion;
    FData = fft(data);
    [~, idx] = max(abs(FData));
    %idx = FindMaxIndex(abs(FData));
    fTemp = (idx-1)*fs/num;
    fLow = fTemp - 1.5;
    fHigh = fTemp + 1.5;

%     freq_test = 40 : 0.01 : 60;
%     [amp, rx, ix] = ddft(data, fs, freq_test);

    %figure('Name','sin-wave');
    % [f1_res, rx1, ix1] = diff1(data, fs, freq_test);
    % [f2_res, rx2, ix2] = diff2(data, fs, freq_test);
    % plot(freq_test, amp.^2, 'r', freq_test, f1_res, 'b', freq_test, f2_res, 'k'); grid on; legend('amp2', 'f1', 'f2'); hold on;
    % [freq, cnt] = NewtonSearch(@diff1, @diff2, 0.0001, 10, 51.5, data, fs);

    %plot(freq_test, amp, 'b'); grid on;  hold on;
    [freq, x1, x2, cnt] = GoldenSection(@ddft, 0.0001, 20, fLow, fHigh, data, fs);

    %[frequent, count] = NewtonSearch(@diff1, @diff2, 0, 2, freq, data, fs);
    FCalc(k) = frequent;
    FError(k) = frequent - Fb(k);
end

figure('Name', 'FreqError');
subplot(2,1,1);
plot(Fb, FError); xlabel('Freq/Hz'); ylabel('FreqError/Hz'); grid on;
subplot(2,1,2);
plot(Fb, FCalc); xlabel('FreqReal/Hz'); ylabel('FreqCalc/Hz'); grid on;