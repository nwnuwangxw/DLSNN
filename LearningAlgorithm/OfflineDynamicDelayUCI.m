function [weights, delays] = OfflineDynamicDelayUCI(inputSpikes, outputSpikes, desiredSpikes, weights, delays, weightRate, weightRange, delayRate, delayRange, sigma)
input = size(weights,1);
synapse = size(weights,2);
for i = 1: input
    eachInputSpikes = inputSpikes(i,:);
    for k =1:synapse
        eachDelay = delays(i,k);
        pre = spikeInnerProduct(desiredSpikes,eachInputSpikes,eachDelay,sigma);
        post = spikeInnerProduct(outputSpikes,eachInputSpikes,eachDelay,sigma);
        deltaW = pre - post;
        deltaD = deltaW * weights(i,k);
        weights(i,k) = weights(i,k) + weightRate * deltaW;
        delays(i,k) = round(delays(i,k) + delayRate * deltaD);
        if weights(i,k) > weightRange
            weights(i,k) = weightRange;
        end
        if weights(i,k) < 0
            weights(i,k) = 0;
        end
        if delays(i,k) > delayRange
            delays(i,k) = delayRange;
        end
        if delays(i,k) < 0
            delays(i,k) = 0;
        end
    end
end
end



