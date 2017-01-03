function [index] = FindMaxIndex(array)

size = length(array);
max = array(1);
index = 1;

for k = 1 : size
    if (max < array(k))
        index = k;
        max = array(k);
    end
end