function errorRate =  computeErrorRate(regPer)
    errorRate = [];
    for i=1:size(regPer, 2)
        tmp = regPer(:, i);
        n = size(tmp, 1);
        error = single(0);
        for j = 1:n
            corPerson = ceil(j/13);
            if corPerson ~= tmp(j)
                error = error + 1;
            end
        end
        errorRate = [errorRate single(error / n)];
    end
    errorRate = errorRate .* 100;
end