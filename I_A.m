x = 1:12;
y1 = [1.917 2.352 2.619 3.025 3.217 3.459 3.690 4.000 4.228 4.647 4.866 5.142];           %  34410��׼ֵ
y2 = [1.932 2.360 2.623 3.032 3.228 3.469 3.707 3.967 4.241 4.690 4.906 5.163];           %  ��Զ���ֵ
y3 = [1.907 2.355 2.631 3.032 3.210 3.519 3.753 4.074 4.314 4.646 4.891 5.140];           %  �������ֵ
y4 = y2 - y1;           
y5 = y3 - y1;
y6 = y4./y1
y7 = y5./y1
subplot(1,2,1);
plot(x,y6);
ylabel('��Զ���');
subplot(1,2,2);
plot(x,y7);
ylabel('�������');

