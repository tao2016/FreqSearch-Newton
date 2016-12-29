% detail digital fourier transform
function [ampx,angx,rx,ix] = ddft(x,fs,f)
% ampx: 幅值
% angx: 角度
% rx: 实部
% ix: 虚部

N = length(x);

rx = zeros(size(f));
ix = zeros(size(f));
%细化公式
for k = 1:N
    rx = rx + x(k)*cos(-2*pi*(k-1)*f/fs);
    ix = ix + x(k)*sin(-2*pi*(k-1)*f/fs);
end

rx = rx * 2/N;
ix = ix * 2/N;
ampx = sqrt(rx.^2+ix.^2);
angx = angle(rx+1j*ix)*180/pi;

