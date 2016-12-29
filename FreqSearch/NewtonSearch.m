function [x] = NewtonSearch(f1, f2, delta, n, x0, data, fs)

for i = 1 : n
    if (abs(f1(data, fs, x0)) < delta)
        break;
    end
    temp1 = f1(data, fs, x0);
    plot(x0,temp1, '*r');
    temp2 = f2(data, fs, x0);
    x1 = x0 - temp1/temp2;
    x0 = x1;
    
end

x = x0;