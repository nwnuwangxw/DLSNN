function C = OfflineDynamicDelay(inputSpikes, desiredSpikes, weights, weightRange, weightRate, delays, delayRange, delayRate, iter)
C = zeros(1,iter);
sigma = 5;
input = size(weights,1);
synapse = size(weights,2);
output = size(weights,3);
duration = size(inputSpikes,2);

for epoch = 1:iter
    outputSpikes = zeros(output,duration);
    for t = 1:duration
        outputSpikes = ShortSRM(inputSpikes, weights, delays, outputSpikes, t);
    end
    C(epoch) = CauchySchwarzDistance(outputSpikes,desiredSpikes);
    %fprintf("OfflineStaticDelay iter==%d  C==%f\n",epoch,C(epoch));
    if C(epoch)==1
        C(epoch:end) = 1;
        break;
    end
    for i = 1: input
        eachInputSpikes = inputSpikes(i,:);
        for o = 1: output
            eachOutputSpikes = outputSpikes(o,:);
            eachDesiredSpikes = desiredSpikes(o,:);
            for k =1:synapse
                eachDelay = delays(i,k,o);
                pre = spikeInnerProduct(eachDesiredSpikes,eachInputSpikes,eachDelay,sigma);
                post = spikeInnerProduct(eachOutputSpikes,eachInputSpikes,eachDelay,sigma);
                deltaW = pre - post;
                deltaD = deltaW * weights(i,k,o);
                weights(i,k,o) = weights(i,k,o) + weightRate * deltaW;
                delays(i,k,o) = round(delays(i,k,o) + delayRate * deltaD);
                if weights(i,k,o) > weightRange
                    weights(i,k,o) = weightRange;
                end
                if weights(i,k,o) < 0
                    weights(i,k,o) = 0;
                end
                if delays(i,k,o) > delayRange
                    delays(i,k,o) = delayRange;
                end
                if delays(i,k,o) < 0
                    delays(i,k,o) = 0;
                end
            end
        end
    end
end
end

function ip = spikeInnerProduct(SpikeTrain1,SpikeTrain2,delay,sigma)
SpikeTrain1 = find(SpikeTrain1);
SpikeTrain2 = find(SpikeTrain2);
s = abs(SpikeTrain1 - SpikeTrain2' - delay);
ip = exp(-s.*s./(2*sigma*sigma));
ip = sum(ip(:));
end


