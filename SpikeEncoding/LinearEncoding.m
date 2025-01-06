function SpikeTrain = LinearEncoding(input, duration, rate)
SpikeTrain = zeros(input,duration);
for i = 1: input
    if length(rate)>1
        r = 100/rate(i);
    else
        r = 100/rate;
    end
    t=r;
    while t < duration
        idx = roundn(t,0);
        if idx~=0
            SpikeTrain(i,idx) = idx;
        end
        t = t+r;
    end
end
end