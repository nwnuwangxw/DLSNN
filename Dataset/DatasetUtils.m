function dataset = DatasetUtils()
dataset.dataRandomPart = @dataRandomPart;
dataset.normalize = @normalize;
dataset.sampleEncoding = @sampleEncoding;
end

function [trainset, testset] = dataRandomPart(dataset,trainNum)
idx=randperm(size(dataset,1));
idx=idx(1:trainNum);
trainset = dataset(idx,:);
testset = dataset;
testset(idx,:)=[];
end


function dataset = normalize(dataset)
data = dataset(:,1:end-1);
data = (data-min(data(:)))/(max(data(:))-min(data(:)));
dataset(:,1:end-1) = data;
end


function inputSpikes = sampleEncoding(sample, duration, attributeMin, attributeMax)
sampledim = length(sample);
rate = round(attributeMin + (attributeMax - attributeMin) .* sample);
inputSpikes = LinearEncoding(sampledim, duration, rate);
end

