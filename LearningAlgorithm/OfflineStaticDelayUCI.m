function [weights, delays] = OfflineStaticDelayUCI(inputSpikes, outputSpikes, desiredSpikes, weights, delays, weightRate, weightRange, delayRate, delayRange, sigma)
input = size(weights,1);
synapse = size(weights,2);
for i = 1: input
    eachInputSpikes = inputSpikes(i,:);
    for k =1:synapse
        eachDelay = delays(i,k);
        pre = spikeInnerProduct(desiredSpikes,eachInputSpikes,eachDelay,sigma);
        post = spikeInnerProduct(outputSpikes,eachInputSpikes,eachDelay,sigma);
        deltaW = pre - post;
        weights(i,k) = weights(i,k) + weightRate * deltaW;
        if weights(i,k) > weightRange
            weights(i,k) = weightRange;
        end
        if weights(i,k) < 0
            weights(i,k) = 0;
        end
    end
end

end



