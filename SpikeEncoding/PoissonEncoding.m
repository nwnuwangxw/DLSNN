function SpikeTrain = PoissonEncoding(input, duration, rate)
SpikeTrain = zeros(input,duration);
for i = 1: input
    if length(rate)>1
        r = 1000/rate(i);
    else
        r = 1000/rate;
    end
    t = -r*log(1-rand());
    while t >= duration
        t = -r*log(1-rand());
    end
    while t < duration
        idx = roundn(t,0);
        if idx > 0
            SpikeTrain(i,idx) = idx;
        end
        t = t-r*log(1-rand());
    end
end
end