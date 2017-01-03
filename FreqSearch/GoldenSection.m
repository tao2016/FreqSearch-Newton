function [x, x1, x2, cnt] = GoldenSection(f, delta, n, a, b, data, fs)
%对于单峰函数f(x)，用黄金分割法求[a, b]内的极大值，返回极大值点对于的x

GoldenRatio = 0.618033988749895;
x1 = b - GoldenRatio*(b-a);
x2 = a + GoldenRatio*(b-a);
y1 = f(data, fs, x1);
y2 = f(data, fs, x2);

for k = 1 : n
    if (b - a < delta)
        break;
    end
    
    if (y1 > y2)
        b = x2;
        x2 = x1;
        y2 = y1;
        plot(x2, y2, '*r');
        x1 = b - GoldenRatio*(b-a);
        y1 = f(data, fs, x1);
    else
        a = x1;
        x1 = x2;
        y1 = y2;
        plot(x1, y1, '*r');
        x2 = a + GoldenRatio*(b-a);
        y2 = f(data, fs, x2);
    end
end

x1 = a;
x2 = b;
cnt = k;
x = (a + b)/2;
plot(x, f(data, fs, x), '*r');