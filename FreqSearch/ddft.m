% detail digital fourier transform
function [ampx,angx,rx,ix] = ddft(x,fs,f)
% ampx: ��ֵ
% angx: �Ƕ�
% rx: ʵ��
% ix: �鲿

N = length(x);

rx = zeros(size(f));
ix = zeros(size(f));
%ϸ����ʽ
for k = 1:N
    rx = rx + x(k)*cos(-2*pi*(k-1)*f/fs);
    ix = ix + x(k)*sin(-2*pi*(k-1)*f/fs);
end

rx = rx * 2/N;
ix = ix * 2/N;
ampx = sqrt(rx.^2+ix.^2);
angx = angle(rx+1j*ix)*180/pi;

