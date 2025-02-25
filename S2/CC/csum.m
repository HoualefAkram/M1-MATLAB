function output = csum(input)
    output = [];
    for i = 1:length(input)
        sum = 0;
    for j = 1:i
        sum = sum + input(j);
    end
    output = [output, sum];
    end
end