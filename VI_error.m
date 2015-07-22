clear all;
close all;
clc;

V = xlsread('V_3_rms.xls');
I = xlsread('I_3_rms.xls');

x_V = 1:length(V(:,1));
x_I = 1:length(I(:,1));

V_test = V(:,1:3:end);
V_zhy  = V(:,2:3:end);
V_std  = V(:,3:3:end);
I_test = I(:,1:3:end);
I_zhy  = I(:,2:3:end);
I_std  = I(:,3:3:end);

V_err_test = (V_test - V_std)./V_std;
V_err_zhy  = (V_zhy - V_std)./V_std;
I_err_test = (I_test - I_std)./I_std;
I_err_zhy  = (I_zhy - I_std)./I_std;

figure('name','��ѹ���');

for k = 1:3;
    subplot(3,1,k);
    plot(x_V,V_err_test(:,k),'-r*',x_V,V_err_zhy(:,k),'-.b+');
    legend('����','��ԶE6000');
    grid on;
    ylabel('���');
    titlename = [char('A'+k-1),'���ѹ'];
    title(titlename);
end

figure('name','�������');

for k = 1:3;
    subplot(3,1,k);
    plot(x_I,I_err_test(:,k),'-r*',x_I,I_err_zhy(:,k),'-.b+');
    legend('����','��ԶE6000');
    grid on;
    ylabel('���');
    titlename = [char('A'+k-1),'�����'];
    title(titlename);
end

