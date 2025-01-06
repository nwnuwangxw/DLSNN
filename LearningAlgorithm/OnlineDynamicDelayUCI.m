function [weights, delays] = OnlineDynamicDelayUCI(inputSpikes, outputSpikes, desiredSpikes, weights, delays, weightRate, weightRange, delayRate, delayRange, sigma)
input = size(weights,1);
synapse = size(weights,2);
output = size(weights,3);
duration = size(inputSpikes,2);
outputSpikes = zeros(output,duration);
for t = 1:duration
    outputSpikes = ShortSRM(inputSpikes, weights, delays, outputSpikes, t);
    if outputSpikes(t)~=0 && desiredSpikes(t)==0
        for i = 1: input
            eachInputSpikes = inputSpikes(i,:);
            for k =1:synapse
                eachDelay = delays(i,k);
                deltaW = spikeInnerProduct(outputSpikes(1:t),eachInputSpikes(1:t),eachDelay,sigma);
                deltaD = deltaW * weights(i,k);
                weights(i,k) = weights(i,k) - weightRate * deltaW;
                delays(i,k) = round(delays(i,k) - delayRate * deltaD);
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
    
    if outputSpikes(t)==0 && desiredSpikes(t)~=0
        for i = 1: input
            eachInputSpikes = inputSpikes(i,:);
            for k =1:synapse
                eachDelay = delays(i,k);
                deltaW = spikeInnerProduct(desiredSpikes(1:t),eachInputSpikes(1:t),eachDelay,sigma);
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
end
end





