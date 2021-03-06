clear;
clc;

x = 1:19;
[num] = xlsread('V_2_rms');
V1 = num(:,1);
V2 = num(:,2);
V3 = num(:,3);
V_A_err_1 = (V1 - V3)./V3;
V_A_err_2 = (V2 - V3)./V3;
V_A_div_1 = V1./V3;
V_A_div_2 = V2./V3;
figure(1);
subplot(2,2,1);
plot(x,V_A_div_1);
ylabel('A相电压样机与标准值比值');
grid on;
subplot(2,2,2);
plot(x,V_A_div_2);
ylabel('A相电压致远与标准值比值');
grid on;
subplot(2,2,3);
plot(x,V_A_err_1);
ylabel('A相电压样机误差');
grid on;
subplot(2,2,4);
plot(x,V_A_err_2);
ylabel('A相电压致远误差');
grid on;

V4 = num(:,4);
V5 = num(:,5);
V6 = num(:,6);
V_B_err_1 = (V4 - V6)./V6;
V_B_err_2 = (V5 - V6)./V6;
V_B_div_1 = V4./V6;
V_B_div_2 = V5./V6;
figure(2);
subplot(2,2,1);
plot(x,V_B_div_1);
ylabel('B相电压样机与标准值比值');
grid on;
subplot(2,2,2);
plot(x,V_B_div_2);
ylabel('B相电压致远与标准值比值');
grid on;
subplot(2,2,3);
plot(x,V_B_err_1);
ylabel('B相电压样机误差');
grid on;
subplot(2,2,4);
plot(x,V_B_err_2);
ylabel('B相电压致远误差');
grid on;

V7 = num(:,7);
V8 = num(:,8);
V9 = num(:,9);
V_C_err_1 = (V7 - V9)./V9;
V_C_err_2 = (V8 - V9)./V9;
V_C_div_1 = V7./V9;
V_C_div_2 = V8./V9;
figure(3);
subplot(2,2,1);
plot(x,V_C_div_1);
ylabel('C相电压样机与标准值比值');
grid on;
subplot(2,2,2);
plot(x,V_C_div_2);
ylabel('C相电压致远与标准值比值');
grid on;
subplot(2,2,3);
plot(x,V_C_err_1);
ylabel('C相电压样机误差');
grid on;
subplot(2,2,4);
plot(x,V_C_err_2);
ylabel('C相电压致远误差');
grid on;

%M = [V_A_err_1 V_A_err_2 V_A_div_1 V_A_div_2 V_B_err_1 V_B_err_2 V_B_div_1 V_B_div_2 V_C_err_1 V_C_err_2 V_C_div_1 V_C_div_2];
%xlswrite('V_2.xlsx',M);