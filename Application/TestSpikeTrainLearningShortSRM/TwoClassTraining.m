function [MaxTrainAcc,MaxTestAcc] = TwoClassTraining(learningRule, weights, delays,weightRange,delayRange,weightRate,delayRate,sigma, ...
    duration, iter, dataset, trainNum, attributeMin, attributeMax, desiredSpikeRate1, desiredSpikeRate2)

learningRule = str2func(learningRule);
output = size(weights,3);
trainacc = zeros(iter,3);
testacc = zeros(iter,3);

datasetUtils = DatasetUtils();
dataset = datasetUtils.normalize(dataset);
[trainset, testset] = datasetUtils.dataRandomPart(dataset,trainNum);

desiredSpikes1 = LinearEncoding(1, duration, desiredSpikeRate1);
desiredSpikes2 = LinearEncoding(1, duration, desiredSpikeRate2);

for epoch =1:iter
    for num = 1:size(trainset,1)
        sample = trainset(num,:);
        inputSpikes = datasetUtils.sampleEncoding(sample(1:end-1), duration, attributeMin, attributeMax);
        
        outputSpikes = zeros(output,duration);
        for t = 1:duration
            outputSpikes = ShortSRM(inputSpikes, weights, delays, outputSpikes, t);
        end
        C = [CauchySchwarzDistance(outputSpikes,desiredSpikes1),CauchySchwarzDistance(outputSpikes,desiredSpikes2)];
        PredictedLabel = find(C==max(C));
        TrueLabel = sample(end);
        
        if isempty(PredictedLabel)
            continue;
        end
        
        if (PredictedLabel==1 && TrueLabel==1)
            trainacc(epoch,1) = trainacc(epoch,1) + 1;
        end
        if (PredictedLabel==2 && TrueLabel==2)
            trainacc(epoch,2) = trainacc(epoch,2) + 1;
        end
        trainacc(epoch,end) = sum(trainacc(epoch,1:end-1));
        
        if (PredictedLabel==2 && TrueLabel==1)
            desiredSpikes = desiredSpikes1;
            [weights, delays] = learningRule(inputSpikes, outputSpikes, desiredSpikes, weights, delays, weightRate, weightRange, delayRate, delayRange, sigma);
        end
        
        if (PredictedLabel==1 && TrueLabel==2)
            desiredSpikes = desiredSpikes2;
            [weights, delays] = learningRule(inputSpikes, outputSpikes, desiredSpikes, weights, delays, weightRate, weightRange, delayRate, delayRange, sigma);
        end
    end
    
    for num = 1:size(testset,1)
        sample = testset(num,:);
        inputSpikes = datasetUtils.sampleEncoding(sample(1:end-1), duration, attributeMin, attributeMax);
        
        outputSpikes = zeros(output,duration);
        for t = 1:duration
            outputSpikes = ShortSRM(inputSpikes, weights, delays, outputSpikes, t);
        end
        C = [CauchySchwarzDistance(outputSpikes,desiredSpikes1),CauchySchwarzDistance(outputSpikes,desiredSpikes2)];
        PredictedLabel = find(C==max(C));
        TrueLabel = sample(end);
        
        if isempty(PredictedLabel)
            continue;
        end
        
        if (PredictedLabel==1 && TrueLabel==1)
            testacc(epoch,1) = testacc(epoch,1) + 1;
        end
        if (PredictedLabel==2 && TrueLabel==2)
            testacc(epoch,2) = testacc(epoch,2) + 1;
        end
        testacc(epoch,end) = sum(testacc(epoch,1:end-1));
    end
%     fprintf("epoch==%d  TrainAcc==%f  TestAcc==%f\n",epoch,trainacc(epoch,end)*100/(size(trainset,1)),testacc(epoch,end)*100/(size(testset,1)));
    
end
MaxTrainAcc = max(trainacc(:,end))*100/(size(trainset,1));
MaxTestAcc = max(testacc(:,end))*100/(size(testset,1));
end

