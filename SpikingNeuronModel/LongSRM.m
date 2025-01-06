function [outputSpikes,potential] = LongSRM(inputSpikes, weights, delays, outputSpikes, currentTime)
decayT = 2;
decayR = 30;
refraP = 1;
thresh = 1;

output = size(weights,3);
potential = zeros(output, 1);

for o = 1:output
    lastSpikes = find(outputSpikes(o,:));
    lastSpikes = lastSpikes(lastSpikes <= currentTime);
    if ~isempty(lastSpikes)
        lastSpikeTime = lastSpikes(end);
    else
        lastSpikeTime = 0;
    end
    sp = spikeResponsePotential(inputSpikes,lastSpikeTime, weights, delays, decayT, refraP, o, currentTime);
    rp = refractoryPeriodPotential(lastSpikes, decayR, thresh, currentTime);
    potential(o) = sp + rp;
    if potential(o) >= thresh
        outputSpikes(o,currentTime) = currentTime;
    end
end

end

function sp = spikeResponsePotential(inputSpikes,lastSpikeTime, weights, delays, decayT, refraP, target, simTime)
sp = 0;
for i = 1:size(inputSpikes,1)
    spikes = find(inputSpikes(i,:));
    for f = 1:length(spikes)
        spikeTime = spikes(f);
        if spikeTime >= lastSpikeTime + refraP   %% absolute refractory period
            for k = 1:size(weights,2)
                weight = weights(i,k,target);
                delay = delays(i,k,target);
                s = simTime - spikeTime - delay;
                if s>0
                    srf = (s / decayT) * exp(1 - s / decayT);
                else
                    srf = 0;
                end
                sp = sp + weight * srf;
            end
        end
    end
end
end

function rp = refractoryPeriodPotential(lastSpikes, decayR, thresh, simTime)
rp = 0;
if ~isempty(lastSpikes)
    spikes = find(lastSpikes(:));
    for f = 1:length(spikes)
        spikeTime = spikes(f);
        s = simTime - spikeTime;
        rp = rp+ (-thresh) * exp(-s / decayR);
    end
end
end



