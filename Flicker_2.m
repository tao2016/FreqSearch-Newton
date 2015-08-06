%用半波有效值计算

n      = 512;                          %采样点数
T      = 0.01;                         %采样周期
ut     = zeros(256,512);               %存放各组离散的电压值（共256组）
U      = zeros(256,1024);              %存放各组电压方均根值（共256组）
Uf     = zeros(256,1024);              %存放各组fft所得值（共256组）
mag    = zeros(256,1024);              %存放各组fft后的幅值（共256组）
Uf_mag = zeros(256,256);               
di     = zeros(256,256);               %存放各组各个频率对应的电压波动（共256组）
U_d    = zeros(256,1);                 %存放各组的直流分量（共256组）
p      = zeros(256,1);                 %存放各组的瞬时闪变（共256组）

for k = 1 : 256
    for N = 1 : 1024
        step     = T/n;
        t        = (N-1)*T : step : (N*T-step);
        ut(k,:)  = 220*sin(2*pi*50*t) + 220*(du(k)/2)/100*sin(2*pi*ff(k)*t).*sin(2*pi*50*t);        %含波动的待测信号
        U(k,N)   = sqrt(sum(ut(k,:).^2)/n);                  %计算电压均方根值（半波有效值）
    end
    Uf(k,:)      = fft(U(k,:));
    mag(k,:)     = 2*abs(Uf(k,:))/1024;                      %计算fft后的幅值
    Uf_mag(k,:)  = mag(k,2:257);
    U_d(k,:)     = Uf(k,1)/1024;                             %计算各个频率对应的直流分量
    di(k,:)      = 2*Uf_mag(k,:)/U_d(k,:);                   %计算各个频率对应的电压波动
    s(k,:)       = 100*di(k,:)./(du);                        %计算各个频率对应的瞬时闪变（每组256个频率点，共256组）
    p(k,:)       = sum((s(k,:)).^2);                         %计算各组瞬时闪变（共256组）
end

plot(ff,p);
grid on;
xlabel('frequent');
ylabel('p');
title('one unit instantaneous perceptibility');

