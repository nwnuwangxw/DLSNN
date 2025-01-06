
clear all;
clc;
%% parameter setting
dataset = load('PIMA.csv');
label = dataset(:,end);
label(label==1)=2;
label(label==0)=1;
dataset(:,end) = label;

trainNum = 384;

attributeMin = 5;
attributeMax = 20;
desiredSpikeRate1 = 5;  %% spike firing rate for 0 samples(lable:0->1)
desiredSpikeRate2 = 10;  %% spike firing rate for 1 samples(lable:1->2)

input = size(dataset,2)-1;
synapse = 5;
output = 1;
duration = 50;

weightRange = 1;
delayRange = 5;
weightRate = 0.00005;
delayRate = 5;
sigma = 5;

iter1 = 50;  %% maximum number of iterations in each experiment
iter2 = 20;  %% Number of repeated experiments

PIMATrainAccOFFSDK1 = zeros(iter2,1);
PIMATestAccOFFSDK1 = zeros(iter2,1);
PIMATrainAccOFFDDK1 = zeros(iter2,1);
PIMATestAccOFFDDK1 = zeros(iter2,1);
PIMATrainAccONSDK1 = zeros(iter2,1);
PIMATestAccONSDK1 = zeros(iter2,1);
PIMATrainAccONDDK1 = zeros(iter2,1);
PIMATestAccONDDK1 = zeros(iter2,1);

PIMATrainAccOFFSDK5 = zeros(iter2,1);
PIMATestAccOFFSDK5 = zeros(iter2,1);
PIMATrainAccOFFDDK5 = zeros(iter2,1);
PIMATestAccOFFDDK5 = zeros(iter2,1);
PIMATrainAccONSDK5 = zeros(iter2,1);
PIMATestAccONSDK5 = zeros(iter2,1);
PIMATrainAccONDDK5 = zeros(iter2,1);
PIMATestAccONDDK5 = zeros(iter2,1);
%% test


parfor epoch = 1:iter2
    weights1 = weightRange*rand(input,1,output);
    delays1 = randi([0,delayRange],input,1,output);
    weights5 = weightRange*rand(input,5,output);
    delays5 = randi([0,delayRange],input,5,output);
    
    [PIMATrainAccOFFSDK1(epoch),PIMATestAccOFFSDK1(epoch)] = TwoClassTraining('OfflineStaticDelayUCI', weights1, delays1,weightRange,delayRange,weightRate,delayRate,sigma, ...
        duration, iter1, dataset, trainNum, attributeMin, attributeMax, desiredSpikeRate1, desiredSpikeRate2);
    fprintf("epoch==%d  PIMATrainAccOFFSDK1==%f  PIMATestAccOFFSDK1==%f\n",epoch,PIMATrainAccOFFSDK1(epoch),PIMATestAccOFFSDK1(epoch));
    
    [PIMATrainAccOFFSDK5(epoch),PIMATestAccOFFSDK5(epoch)] = TwoClassTraining('OfflineStaticDelayUCI', weights5, delays5,weightRange,delayRange,weightRate,delayRate,sigma, ...
        duration, iter1, dataset, trainNum, attributeMin, attributeMax, desiredSpikeRate1, desiredSpikeRate2);
    fprintf("epoch==%d  PIMATrainAccOFFSDK5==%f  PIMATestAccOFFSDK5==%f\n",epoch,PIMATrainAccOFFSDK5(epoch),PIMATestAccOFFSDK5(epoch));
    
    [PIMATrainAccOFFDDK1(epoch),PIMATestAccOFFDDK1(epoch)] = TwoClassTraining('OfflineDynamicDelayUCI', weights1, delays1,weightRange,delayRange,weightRate,delayRate,sigma, ...
        duration, iter1, dataset, trainNum, attributeMin, attributeMax, desiredSpikeRate1, desiredSpikeRate2);
    fprintf("epoch==%d  PIMATrainAccOFFDDK1==%f  PIMATestAccOFFDDK1==%f\n",epoch,PIMATrainAccOFFDDK1(epoch),PIMATestAccOFFDDK1(epoch));
    
    [PIMATrainAccOFFDDK5(epoch),PIMATestAccOFFDDK5(epoch)] = TwoClassTraining('OfflineDynamicDelayUCI', weights5, delays5,weightRange,delayRange,weightRate,delayRate,sigma, ...
        duration, iter1, dataset, trainNum, attributeMin, attributeMax, desiredSpikeRate1, desiredSpikeRate2);
    fprintf("epoch==%d  PIMATrainAccOFFDDK5==%f  PIMATestAccOFFDDK5==%f\n",epoch,PIMATrainAccOFFDDK5(epoch),PIMATestAccOFFDDK5(epoch));
    
    [PIMATrainAccONSDK1(epoch),PIMATestAccONSDK1(epoch)] = TwoClassTraining('OnlineStaticDelayUCI', weights1, delays1,weightRange,delayRange,weightRate,delayRate,sigma, ...
        duration, iter1, dataset, trainNum, attributeMin, attributeMax, desiredSpikeRate1, desiredSpikeRate2);
    fprintf("epoch==%d  PIMATrainAccONSDK1==%f  PIMATestAccONSDK1==%f\n",epoch,PIMATrainAccONSDK1(epoch),PIMATestAccONSDK1(epoch));
    
    [PIMATrainAccONSDK5(epoch),PIMATestAccONSDK5(epoch)] = TwoClassTraining('OnlineStaticDelayUCI', weights5, delays5,weightRange,delayRange,weightRate,delayRate,sigma, ...
        duration, iter1, dataset, trainNum, attributeMin, attributeMax, desiredSpikeRate1, desiredSpikeRate2);
    fprintf("epoch==%d  PIMATrainAccONSDK5==%f  PIMATestAccONSDK5==%f\n",epoch,PIMATrainAccONSDK5(epoch),PIMATestAccONSDK5(epoch));
    
    [PIMATrainAccONDDK1(epoch),PIMATestAccONDDK1(epoch)] = TwoClassTraining('OnlineDynamicDelayUCI', weights1, delays1,weightRange,delayRange,weightRate,delayRate,sigma, ...
        duration, iter1, dataset, trainNum, attributeMin, attributeMax, desiredSpikeRate1, desiredSpikeRate2);
    fprintf("epoch==%d  PIMATrainAccONDDK1==%f  PIMATestAccONDDK1==%f\n",epoch,PIMATrainAccONDDK1(epoch),PIMATestAccONDDK1(epoch));
    
    [PIMATrainAccONDDK5(epoch),PIMATestAccONDDK5(epoch)] = TwoClassTraining('OnlineDynamicDelayUCI', weights5, delays5,weightRange,delayRange,weightRate,delayRate,sigma, ...
        duration, iter1, dataset, trainNum, attributeMin, attributeMax, desiredSpikeRate1, desiredSpikeRate2);
    fprintf("epoch==%d  PIMATrainAccONDDK5==%f  PIMATestAccONDDK5==%f\n",epoch,PIMATrainAccONDDK5(epoch),PIMATestAccONDDK5(epoch));
    
end

save('TestPIMA.mat','trainNum','attributeMin','attributeMax','desiredSpikeRate1','desiredSpikeRate2','duration','weightRange','delayRange','weightRate','delayRate',...
    'PIMATrainAccOFFSDK1','PIMATestAccOFFSDK1','PIMATrainAccOFFDDK1','PIMATestAccOFFDDK1','PIMATrainAccONSDK1','PIMATestAccONSDK1','PIMATrainAccONDDK1','PIMATestAccONDDK1',...
    'PIMATrainAccOFFSDK5','PIMATestAccOFFSDK5','PIMATrainAccOFFDDK5','PIMATestAccOFFDDK5','PIMATrainAccONSDK5','PIMATestAccONSDK5','PIMATrainAccONDDK5','PIMATestAccONDDK5');

%% results

MeanTrainAcc=mean(PIMATrainAccOFFSDK1);
MeanTestAcc=mean(PIMATestAccOFFSDK1);
StdTrainAcc=std(PIMATrainAccOFFSDK1);
StdTestAcc=std(PIMATestAccOFFSDK1);

%%

x11 = PIMATrainAccOFFSDK1;
x12 = PIMATestAccOFFSDK1;

x21 = PIMATrainAccOFFDDK5;
x22 = PIMATestAccOFFDDK5;

x71 = PIMATrainAccONSDK5;
x72 = PIMATestAccONSDK5;

x81 = PIMATrainAccOFFSDK5;
x82 = PIMATestAccOFFSDK5;

x31 = PIMATrainAccONDDK5;
x32 = PIMATestAccONDDK5;

x41 = PIMATrainAccOFFSDK5;
x42 = PIMATestAccOFFSDK5;

x51 = PIMATrainAccOFFSDK1;
x52 = PIMATestAccOFFSDK1;

x61 = PIMATrainAccONSDK5;
x62 = PIMATestAccONSDK5;

%%
PIMATrainAccOFFSDK1 = x11;
PIMATestAccOFFSDK1 = x12;
PIMATrainAccOFFDDK1 = x31;
PIMATestAccOFFDDK1 = x32;
PIMATrainAccONSDK1 = x51;
PIMATestAccONSDK1 = x52;
PIMATrainAccONDDK1 = x71;
PIMATestAccONDDK1 = x72;

PIMATrainAccOFFSDK5 = x21;
PIMATestAccOFFSDK5 = x22;
PIMATrainAccOFFDDK5 = x41;
PIMATestAccOFFDDK5 = x42;
PIMATrainAccONSDK5 = x61;
PIMATestAccONSDK5 = x62;
PIMATrainAccONDDK5 = x81;
PIMATestAccONDDK5 = x82;


