
clear all;
clc;
%% parameter setting
dataset = load('wbc.txt');
dataset = dataset(:,2:end);
label = dataset(:,end);
label(label==2)=1;
label(label==4)=2;
dataset(:,end) = label;

trainNum = 341;

attributeMin = 5;
attributeMax = 20;
desiredSpikeRate1 = 5;  %% spike firing rate for Benign samples(lable:2->1)
desiredSpikeRate2 = 10;  %% spike firing rate for Malignant samples(lable:4->2)

input = size(dataset,2)-1;
synapse = 5;
output = 1;
duration = 50;

weightRange = 1;
delayRange = 10;
weightRate = 0.001;
delayRate = 5;
sigma = 5;

iter1 = 50;  %% maximum number of iterations in each experiment
iter2 = 1;  %% Number of repeated experiments

WBCTrainAccOFFSDK1 = zeros(iter2,1);
WBCTestAccOFFSDK1 = zeros(iter2,1);
WBCTrainAccOFFDDK1 = zeros(iter2,1);
WBCTestAccOFFDDK1 = zeros(iter2,1);
WBCTrainAccONSDK1 = zeros(iter2,1);
WBCTestAccONSDK1 = zeros(iter2,1);
WBCTrainAccONDDK1 = zeros(iter2,1);
WBCTestAccONDDK1 = zeros(iter2,1);

WBCTrainAccOFFSDK5 = zeros(iter2,1);
WBCTestAccOFFSDK5 = zeros(iter2,1);
WBCTrainAccOFFDDK5 = zeros(iter2,1);
WBCTestAccOFFDDK5 = zeros(iter2,1);
WBCTrainAccONSDK5 = zeros(iter2,1);
WBCTestAccONSDK5 = zeros(iter2,1);
WBCTrainAccONDDK5 = zeros(iter2,1);
WBCTestAccONDDK5 = zeros(iter2,1);
%% test


parfor epoch = 1:iter2
    weights1 = weightRange*rand(input,1,output);
    delays1 = randi([0,delayRange],input,1,output);
    weights5 = weightRange*rand(input,5,output);
    delays5 = randi([0,delayRange],input,5,output);
    
    [WBCTrainAccOFFSDK1(epoch),WBCTestAccOFFSDK1(epoch)] = TwoClassTraining('OfflineStaticDelayUCI', weights1, delays1,weightRange,delayRange,weightRate,delayRate,sigma, ...
        duration, iter1, dataset, trainNum, attributeMin, attributeMax, desiredSpikeRate1, desiredSpikeRate2);
    fprintf("epoch==%d  WBCTrainAccOFFSDK1==%f  WBCTestAccOFFSDK1==%f\n",epoch,WBCTrainAccOFFSDK1(epoch),WBCTestAccOFFSDK1(epoch));
    
    [WBCTrainAccOFFSDK5(epoch),WBCTestAccOFFSDK5(epoch)] = TwoClassTraining('OfflineStaticDelayUCI', weights5, delays5,weightRange,delayRange,weightRate,delayRate,sigma, ...
        duration, iter1, dataset, trainNum, attributeMin, attributeMax, desiredSpikeRate1, desiredSpikeRate2);
    fprintf("epoch==%d  WBCTrainAccOFFSDK5==%f  WBCTestAccOFFSDK5==%f\n",epoch,WBCTrainAccOFFSDK5(epoch),WBCTestAccOFFSDK5(epoch));
    
    [WBCTrainAccOFFDDK1(epoch),WBCTestAccOFFDDK1(epoch)] = TwoClassTraining('OfflineDynamicDelayUCI', weights1, delays1,weightRange,delayRange,weightRate,delayRate,sigma, ...
        duration, iter1, dataset, trainNum, attributeMin, attributeMax, desiredSpikeRate1, desiredSpikeRate2);
    fprintf("epoch==%d  WBCTrainAccOFFDDK1==%f  WBCTestAccOFFDDK1==%f\n",epoch,WBCTrainAccOFFDDK1(epoch),WBCTestAccOFFDDK1(epoch));
    
    [WBCTrainAccOFFDDK5(epoch),WBCTestAccOFFDDK5(epoch)] = TwoClassTraining('OfflineDynamicDelayUCI', weights5, delays5,weightRange,delayRange,weightRate,delayRate,sigma, ...
        duration, iter1, dataset, trainNum, attributeMin, attributeMax, desiredSpikeRate1, desiredSpikeRate2);
    fprintf("epoch==%d  WBCTrainAccOFFDDK5==%f  WBCTestAccOFFDDK5==%f\n",epoch,WBCTrainAccOFFDDK5(epoch),WBCTestAccOFFDDK5(epoch));
    
    [WBCTrainAccONSDK1(epoch),WBCTestAccONSDK1(epoch)] = TwoClassTraining('OnlineStaticDelayUCI', weights1, delays1,weightRange,delayRange,weightRate,delayRate,sigma, ...
        duration, iter1, dataset, trainNum, attributeMin, attributeMax, desiredSpikeRate1, desiredSpikeRate2);
    fprintf("epoch==%d  WBCTrainAccONSDK1==%f  WBCTestAccONSDK1==%f\n",epoch,WBCTrainAccONSDK1(epoch),WBCTestAccONSDK1(epoch));
    
    [WBCTrainAccONSDK5(epoch),WBCTestAccONSDK5(epoch)] = TwoClassTraining('OnlineStaticDelayUCI', weights5, delays5,weightRange,delayRange,weightRate,delayRate,sigma, ...
        duration, iter1, dataset, trainNum, attributeMin, attributeMax, desiredSpikeRate1, desiredSpikeRate2);
    fprintf("epoch==%d  WBCTrainAccONSDK5==%f  WBCTestAccONSDK5==%f\n",epoch,WBCTrainAccONSDK5(epoch),WBCTestAccONSDK5(epoch));
    
    [WBCTrainAccONDDK1(epoch),WBCTestAccONDDK1(epoch)] = TwoClassTraining('OnlineDynamicDelayUCI', weights1, delays1,weightRange,delayRange,weightRate,delayRate,sigma, ...
        duration, iter1, dataset, trainNum, attributeMin, attributeMax, desiredSpikeRate1, desiredSpikeRate2);
    fprintf("epoch==%d  WBCTrainAccONDDK1==%f  WBCTestAccONDDK1==%f\n",epoch,WBCTrainAccONDDK1(epoch),WBCTestAccONDDK1(epoch));
    
    [WBCTrainAccONDDK5(epoch),WBCTestAccONDDK5(epoch)] = TwoClassTraining('OnlineDynamicDelayUCI', weights5, delays5,weightRange,delayRange,weightRate,delayRate,sigma, ...
        duration, iter1, dataset, trainNum, attributeMin, attributeMax, desiredSpikeRate1, desiredSpikeRate2);
    fprintf("epoch==%d  WBCTrainAccONDDK5==%f  WBCTestAccONDDK5==%f\n",epoch,WBCTrainAccONDDK5(epoch),WBCTestAccONDDK5(epoch));
    
end

save('TestWBC.mat','trainNum','attributeMin','attributeMax','desiredSpikeRate1','desiredSpikeRate2','duration','weightRange','delayRange','weightRate','delayRate',...
    'WBCTrainAccOFFSDK1','WBCTestAccOFFSDK1','WBCTrainAccOFFDDK1','WBCTestAccOFFDDK1','WBCTrainAccONSDK1','WBCTestAccONSDK1','WBCTrainAccONDDK1','WBCTestAccONDDK1',...
    'WBCTrainAccOFFSDK5','WBCTestAccOFFSDK5','WBCTrainAccOFFDDK5','WBCTestAccOFFDDK5','WBCTrainAccONSDK5','WBCTestAccONSDK5','WBCTrainAccONDDK5','WBCTestAccONDDK5');

%% results

MeanTrainAcc=mean(WBCTrainAccONDDK5);
MeanTestAcc=mean(WBCTestAccONDDK5);
StdTrainAcc=std(WBCTrainAccONDDK5);
StdTestAcc=std(WBCTestAccONDDK5);
