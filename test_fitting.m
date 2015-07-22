clear;
clc;

[num] = xlsread('V_rms');
V1 = num(:,1);
V2 = num(:,2);
V3 = num(:,3);

figure(1);
subplot(1,2,1);
plot(V3,V1);
ylabel('A���ѹ�������׼ֵ');
grid on;
subplot(1,2,2);
plot(V3,V2);
ylabel('A���ѹ��Զ���׼ֵ');
grid on;

V4 = num(:,4);
V5 = num(:,5);
V6 = num(:,6);

figure(2);
subplot(1,2,1);
plot(V6,V4);
ylabel('B���ѹ�������׼ֵ');
grid on;
subplot(1,2,2);
plot(V6,V5);
ylabel('B���ѹ��Զ���׼ֵ');
grid on;

V7 = num(:,7);
V8 = num(:,8);
V9 = num(:,9);

figure(3);
subplot(1,2,1);
plot(V9,V7);
ylabel('C���ѹ�������׼ֵ');
grid on;
subplot(1,2,2);
plot(V9,V8);
ylabel('C���ѹ��Զ���׼ֵ');
grid on;


