clear all;
clc

%%  parameters

input = 200;       %%  number of input neurons,benchmark==200
synapse = 5;       %%  number of synapse between pre-post synaptic neurons,benchmark==5
output = 1;        %%  number of output neurons
duration = 300;     %%  length of simulation duration, benchmark==300
spikeRate = 20;    %%  firing rate of input and desired output spike trains,benchmark==20
weightRange = 1; %%  weights are distributed in [0,weightRange]
%%weightRate = 0.005; %%  learning rate of weights
%%%%  OtherWeightRate = 0.01;
%%%%  OnlineStaticDelayWeightRate = 0.05;
delayRange = 10;    %%  delays are distributed in [0,delayRange]
delayRate = 5;     %%  learning rate of delays

iter1 = 100;       %%  learning epochs
iter2 = 50;         %%  number of repetitions of the experiment



%%SpikeRate: 10:100:10
OfflineStaticDelaySpikeRate10 = zeros(iter2,iter1);
OfflineStaticDelaySpikeRate20 = zeros(iter2,iter1);
OfflineStaticDelaySpikeRate30 = zeros(iter2,iter1);
OfflineStaticDelaySpikeRate40 = zeros(iter2,iter1);
OfflineStaticDelaySpikeRate50 = zeros(iter2,iter1);
OfflineStaticDelaySpikeRate60 = zeros(iter2,iter1);
OfflineStaticDelaySpikeRate70 = zeros(iter2,iter1);
OfflineStaticDelaySpikeRate80 = zeros(iter2,iter1);
OfflineStaticDelaySpikeRate90 = zeros(iter2,iter1);
OfflineStaticDelaySpikeRate100 = zeros(iter2,iter1);


OfflineDynamicDelaySpikeRate10 = zeros(iter2,iter1);
OfflineDynamicDelaySpikeRate20 = zeros(iter2,iter1);
OfflineDynamicDelaySpikeRate30 = zeros(iter2,iter1);
OfflineDynamicDelaySpikeRate40 = zeros(iter2,iter1);
OfflineDynamicDelaySpikeRate50 = zeros(iter2,iter1);
OfflineDynamicDelaySpikeRate60 = zeros(iter2,iter1);
OfflineDynamicDelaySpikeRate70 = zeros(iter2,iter1);
OfflineDynamicDelaySpikeRate80 = zeros(iter2,iter1);
OfflineDynamicDelaySpikeRate90 = zeros(iter2,iter1);
OfflineDynamicDelaySpikeRate100 = zeros(iter2,iter1);

OnlineStaticDelaySpikeRate10 = zeros(iter2,iter1);
OnlineStaticDelaySpikeRate20 = zeros(iter2,iter1);
OnlineStaticDelaySpikeRate30 = zeros(iter2,iter1);
OnlineStaticDelaySpikeRate40 = zeros(iter2,iter1);
OnlineStaticDelaySpikeRate50 = zeros(iter2,iter1);
OnlineStaticDelaySpikeRate60 = zeros(iter2,iter1);
OnlineStaticDelaySpikeRate70 = zeros(iter2,iter1);
OnlineStaticDelaySpikeRate80 = zeros(iter2,iter1);
OnlineStaticDelaySpikeRate90 = zeros(iter2,iter1);
OnlineStaticDelaySpikeRate100 = zeros(iter2,iter1);

OnlineDynamicDelaySpikeRate10 = zeros(iter2,iter1);
OnlineDynamicDelaySpikeRate20 = zeros(iter2,iter1);
OnlineDynamicDelaySpikeRate30 = zeros(iter2,iter1);
OnlineDynamicDelaySpikeRate40 = zeros(iter2,iter1);
OnlineDynamicDelaySpikeRate50 = zeros(iter2,iter1);
OnlineDynamicDelaySpikeRate60 = zeros(iter2,iter1);
OnlineDynamicDelaySpikeRate70 = zeros(iter2,iter1);
OnlineDynamicDelaySpikeRate80 = zeros(iter2,iter1);
OnlineDynamicDelaySpikeRate90 = zeros(iter2,iter1);
OnlineDynamicDelaySpikeRate100 = zeros(iter2,iter1);


%%  learning process
% if isempty(gcp('nocreate')) %如果并行未开启
%     parpool(12); %开启16个并行工作池
% end
parfor iter = 1:iter2
    
    weights = weightRange*rand(input,synapse,output);
    delays = randi([0,delayRange],input,synapse,output);
    
    inputSpikes10 = PoissonEncoding(input,duration,10);
    inputSpikes20 = PoissonEncoding(input,duration,20);
    inputSpikes30 = PoissonEncoding(input,duration,30);
    inputSpikes40 = PoissonEncoding(input,duration,40);
    inputSpikes50 = PoissonEncoding(input,duration,50);
    inputSpikes60 = PoissonEncoding(input,duration,60);
    inputSpikes70 = PoissonEncoding(input,duration,70);
    inputSpikes80 = PoissonEncoding(input,duration,80);
    inputSpikes90 = PoissonEncoding(input,duration,90);
    inputSpikes100 = PoissonEncoding(input,duration,100);
    
    desiredSpikes10 = PoissonEncoding(output,duration,10);
    desiredSpikes20 = PoissonEncoding(output,duration,20);
    desiredSpikes30 = PoissonEncoding(output,duration,30);
    desiredSpikes40 = PoissonEncoding(output,duration,40);
    desiredSpikes50 = PoissonEncoding(output,duration,50);
    desiredSpikes60 = PoissonEncoding(output,duration,60);
    desiredSpikes70 = PoissonEncoding(output,duration,70);
    desiredSpikes80 = PoissonEncoding(output,duration,80);
    desiredSpikes90 = PoissonEncoding(output,duration,90);
    desiredSpikes100 = PoissonEncoding(output,duration,100);
    
    
    
    OfflineStaticDelaySpikeRate10(iter,:) = OfflineStaticDelay(inputSpikes10, desiredSpikes10, weights, weightRange, 0.01, delays, iter1);
    fprintf("OfflineStaticDelaySpikeRate10 iter==%d  C==%f\n",iter,max(OfflineStaticDelaySpikeRate10(iter,:)));
    OfflineStaticDelaySpikeRate20(iter,:) = OfflineStaticDelay(inputSpikes20, desiredSpikes20, weights, weightRange, 0.01, delays, iter1);
    fprintf("OfflineStaticDelaySpikeRate20 iter==%d  C==%f\n",iter,max(OfflineStaticDelaySpikeRate20(iter,:)));
    OfflineStaticDelaySpikeRate30(iter,:) = OfflineStaticDelay(inputSpikes30, desiredSpikes30, weights, weightRange, 0.01, delays, iter1);
    fprintf("OfflineStaticDelaySpikeRate30 iter==%d  C==%f\n",iter,max(OfflineStaticDelaySpikeRate30(iter,:)));
    OfflineStaticDelaySpikeRate40(iter,:) = OfflineStaticDelay(inputSpikes40, desiredSpikes40, weights, weightRange, 0.01, delays, iter1);
    fprintf("OfflineStaticDelaySpikeRate40 iter==%d  C==%f\n",iter,max(OfflineStaticDelaySpikeRate40(iter,:)));
    OfflineStaticDelaySpikeRate50(iter,:) = OfflineStaticDelay(inputSpikes50, desiredSpikes50, weights, weightRange, 0.01, delays, iter1);
    fprintf("OfflineStaticDelaySpikeRate50 iter==%d  C==%f\n",iter,max(OfflineStaticDelaySpikeRate50(iter,:)));
    OfflineStaticDelaySpikeRate60(iter,:) = OfflineStaticDelay(inputSpikes60, desiredSpikes60, weights, weightRange, 0.01, delays, iter1);
    fprintf("OfflineStaticDelaySpikeRate60 iter==%d  C==%f\n",iter,max(OfflineStaticDelaySpikeRate60(iter,:)));
    OfflineStaticDelaySpikeRate70(iter,:) = OfflineStaticDelay(inputSpikes70, desiredSpikes70, weights, weightRange, 0.01, delays, iter1);
    fprintf("OfflineStaticDelaySpikeRate70 iter==%d  C==%f\n",iter,max(OfflineStaticDelaySpikeRate70(iter,:)));
    OfflineStaticDelaySpikeRate80(iter,:) = OfflineStaticDelay(inputSpikes80, desiredSpikes80, weights, weightRange, 0.01, delays, iter1);
    fprintf("OfflineStaticDelaySpikeRate80 iter==%d  C==%f\n",iter,max(OfflineStaticDelaySpikeRate80(iter,:)));
    OfflineStaticDelaySpikeRate90(iter,:) = OfflineStaticDelay(inputSpikes90, desiredSpikes90, weights, weightRange, 0.01, delays, iter1);
    fprintf("OfflineStaticDelaySpikeRate90 iter==%d  C==%f\n",iter,max(OfflineStaticDelaySpikeRate90(iter,:)));
    OfflineStaticDelaySpikeRate100(iter,:) = OfflineStaticDelay(inputSpikes100, desiredSpikes100, weights, weightRange, 0.01, delays, iter1);
    fprintf("OfflineStaticDelaySpikeRate100 iter==%d  C==%f\n",iter,max(OfflineStaticDelaySpikeRate100(iter,:)));
    
    OfflineDynamicDelaySpikeRate10(iter,:) = OfflineDynamicDelay(inputSpikes10, desiredSpikes10, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OfflineDynamicDelaySpikeRate10 iter==%d  C==%f\n",iter,max(OfflineDynamicDelaySpikeRate10(iter,:)));
    OfflineDynamicDelaySpikeRate20(iter,:) = OfflineDynamicDelay(inputSpikes20, desiredSpikes20, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OfflineDynamicDelaySpikeRate20 iter==%d  C==%f\n",iter,max(OfflineDynamicDelaySpikeRate20(iter,:)));
    OfflineDynamicDelaySpikeRate30(iter,:) = OfflineDynamicDelay(inputSpikes30, desiredSpikes30, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OfflineDynamicDelaySpikeRate30 iter==%d  C==%f\n",iter,max(OfflineDynamicDelaySpikeRate30(iter,:)));
    OfflineDynamicDelaySpikeRate40(iter,:) = OfflineDynamicDelay(inputSpikes40, desiredSpikes40, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OfflineDynamicDelaySpikeRate40 iter==%d  C==%f\n",iter,max(OfflineDynamicDelaySpikeRate40(iter,:)));
    OfflineDynamicDelaySpikeRate50(iter,:) = OfflineDynamicDelay(inputSpikes50, desiredSpikes50, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OfflineDynamicDelaySpikeRate50 iter==%d  C==%f\n",iter,max(OfflineDynamicDelaySpikeRate50(iter,:)));
    OfflineDynamicDelaySpikeRate60(iter,:) = OfflineDynamicDelay(inputSpikes60, desiredSpikes60, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OfflineDynamicDelayDSpikeRate60 iter==%d  C==%f\n",iter,max(OfflineDynamicDelaySpikeRate60(iter,:)));
    OfflineDynamicDelaySpikeRate70(iter,:) = OfflineDynamicDelay(inputSpikes70, desiredSpikes70, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OfflineDynamicDelaySpikeRate70 iter==%d  C==%f\n",iter,max(OfflineDynamicDelaySpikeRate70(iter,:)));
    OfflineDynamicDelaySpikeRate80(iter,:) = OfflineDynamicDelay(inputSpikes80, desiredSpikes80, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OfflineDynamicDelaySpikeRate80 iter==%d  C==%f\n",iter,max(OfflineDynamicDelaySpikeRate80(iter,:)));
    OfflineDynamicDelaySpikeRate90(iter,:) = OfflineDynamicDelay(inputSpikes90, desiredSpikes90, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OfflineDynamicDelaySpikeRate90 iter==%d  C==%f\n",iter,max(OfflineDynamicDelaySpikeRate90(iter,:)));
    OfflineDynamicDelaySpikeRate100(iter,:) = OfflineDynamicDelay(inputSpikes100, desiredSpikes100, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OfflineDynamicDelaySpikeRate100 iter==%d  C==%f\n",iter,max(OfflineDynamicDelaySpikeRate100(iter,:)));
    
    OnlineStaticDelaySpikeRate10(iter,:) = OnlineStaticDelay(inputSpikes10, desiredSpikes10, weights, weightRange, 0.05, delays, iter1);
    fprintf("OnlineStaticDelaySpikeRate10 iter==%d  C==%f\n",iter,max(OnlineStaticDelaySpikeRate10(iter,:)));
    OnlineStaticDelaySpikeRate20(iter,:) = OnlineStaticDelay(inputSpikes20, desiredSpikes20, weights, weightRange, 0.05, delays, iter1);
    fprintf("OnlineStaticDelaySpikeRate20 iter==%d  C==%f\n",iter,max(OnlineStaticDelaySpikeRate20(iter,:)));
    OnlineStaticDelaySpikeRate30(iter,:) = OnlineStaticDelay(inputSpikes30, desiredSpikes30, weights, weightRange, 0.05, delays, iter1);
    fprintf("OnlineStaticDelaySpikeRate30 iter==%d  C==%f\n",iter,max(OnlineStaticDelaySpikeRate30(iter,:)));
    OnlineStaticDelaySpikeRate40(iter,:) = OnlineStaticDelay(inputSpikes40, desiredSpikes40, weights, weightRange, 0.05, delays, iter1);
    fprintf("OnlineStaticDelaySpikeRate40 iter==%d  C==%f\n",iter,max(OnlineStaticDelaySpikeRate40(iter,:)));
    OnlineStaticDelaySpikeRate50(iter,:) = OnlineStaticDelay(inputSpikes50, desiredSpikes50, weights, weightRange, 0.05, delays, iter1);
    fprintf("OnlineStaticDelaySpikeRate50 iter==%d  C==%f\n",iter,max(OnlineStaticDelaySpikeRate50(iter,:)));
    OnlineStaticDelaySpikeRate60(iter,:) = OnlineStaticDelay(inputSpikes60, desiredSpikes60, weights, weightRange, 0.05, delays, iter1);
    fprintf("OnlineStaticDelaySpikeRate60 iter==%d  C==%f\n",iter,max(OnlineStaticDelaySpikeRate60(iter,:)));
    OnlineStaticDelaySpikeRate70(iter,:) = OnlineStaticDelay(inputSpikes70, desiredSpikes70, weights, weightRange, 0.05, delays, iter1);
    fprintf("OnlineStaticDelaySpikeRate70 iter==%d  C==%f\n",iter,max(OnlineStaticDelaySpikeRate70(iter,:)));
    OnlineStaticDelaySpikeRate80(iter,:) = OnlineStaticDelay(inputSpikes80, desiredSpikes80, weights, weightRange, 0.05, delays, iter1);
    fprintf("OnlineStaticDelaySpikeRate80 iter==%d  C==%f\n",iter,max(OnlineStaticDelaySpikeRate80(iter,:)));
    OnlineStaticDelaySpikeRate90(iter,:) = OnlineStaticDelay(inputSpikes90, desiredSpikes90, weights, weightRange, 0.05, delays, iter1);
    fprintf("OnlineStaticDelaySpikeRate90 iter==%d  C==%f\n",iter,max(OnlineStaticDelaySpikeRate90(iter,:)));
    OnlineStaticDelaySpikeRate100(iter,:) = OnlineStaticDelay(inputSpikes100, desiredSpikes100, weights, weightRange, 0.05, delays, iter1);
    fprintf("OnlineStaticDelaySpikeRate100 iter==%d  C==%f\n",iter,max(OnlineStaticDelaySpikeRate100(iter,:)));
    
    OnlineDynamicDelaySpikeRate10(iter,:) = OnlineDynamicDelay(inputSpikes10, desiredSpikes10, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OnlineDynamicDelaySpikeRate10 iter==%d  C==%f\n",iter,max(OnlineDynamicDelaySpikeRate10(iter,:)));
    OnlineDynamicDelaySpikeRate20(iter,:) = OnlineDynamicDelay(inputSpikes20, desiredSpikes20, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OnlineDynamicDelaySpikeRate20 iter==%d  C==%f\n",iter,max(OnlineDynamicDelaySpikeRate20(iter,:)));
    OnlineDynamicDelaySpikeRate30(iter,:) = OnlineDynamicDelay(inputSpikes30, desiredSpikes30, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OnlineDynamicDelaySpikeRate30 iter==%d  C==%f\n",iter,max(OnlineDynamicDelaySpikeRate30(iter,:)));
    OnlineDynamicDelaySpikeRate40(iter,:) = OnlineDynamicDelay(inputSpikes40, desiredSpikes40, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OnlineDynamicDelaySpikeRate40 iter==%d  C==%f\n",iter,max(OnlineDynamicDelaySpikeRate40(iter,:)));
    OnlineDynamicDelaySpikeRate50(iter,:) = OnlineDynamicDelay(inputSpikes50, desiredSpikes50, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OnlineDynamicDelaySpikeRate50 iter==%d  C==%f\n",iter,max(OnlineDynamicDelaySpikeRate50(iter,:)));
    OnlineDynamicDelaySpikeRate60(iter,:) = OnlineDynamicDelay(inputSpikes60, desiredSpikes60, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OnlineDynamicDelaySpikeRate60 iter==%d  C==%f\n",iter,max(OnlineDynamicDelaySpikeRate60(iter,:)));
    OnlineDynamicDelaySpikeRate70(iter,:) = OnlineDynamicDelay(inputSpikes70, desiredSpikes70, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OnlineDynamicDelaySpikeRate70 iter==%d  C==%f\n",iter,max(OnlineDynamicDelaySpikeRate70(iter,:)));
    OnlineDynamicDelaySpikeRate80(iter,:) = OnlineDynamicDelay(inputSpikes80, desiredSpikes80, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OnlineDynamicDelaySpikeRate80 iter==%d  C==%f\n",iter,max(OnlineDynamicDelaySpikeRate80(iter,:)));
    OnlineDynamicDelaySpikeRate90(iter,:) = OnlineDynamicDelay(inputSpikes90, desiredSpikes90, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OnlineDynamicDelaySpikeRate90 iter==%d  C==%f\n",iter,max(OnlineDynamicDelaySpikeRate90(iter,:)));
    OnlineDynamicDelaySpikeRate100(iter,:) = OnlineDynamicDelay(inputSpikes100, desiredSpikes100, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OnlineDynamicDelaySpikeRate100 iter==%d  C==%f\n",iter,max(OnlineDynamicDelaySpikeRate100(iter,:)));
    
    
end

save('TestSpikeRate.mat','input','synapse','duration','weightRange','delayRange',...
    'OfflineStaticDelaySpikeRate10','OfflineStaticDelaySpikeRate20','OfflineStaticDelaySpikeRate30','OfflineStaticDelaySpikeRate40','OfflineStaticDelaySpikeRate50',...
    'OfflineStaticDelaySpikeRate60','OfflineStaticDelaySpikeRate70','OfflineStaticDelaySpikeRate80','OfflineStaticDelaySpikeRate90','OfflineStaticDelaySpikeRate100',...
    'OfflineDynamicDelaySpikeRate10','OfflineDynamicDelaySpikeRate20','OfflineDynamicDelaySpikeRate30','OfflineDynamicDelaySpikeRate40','OfflineDynamicDelaySpikeRate50',...
    'OfflineDynamicDelaySpikeRate60','OfflineDynamicDelaySpikeRate70','OfflineDynamicDelaySpikeRate80','OfflineDynamicDelaySpikeRate90','OfflineDynamicDelaySpikeRate100',...
    'OnlineStaticDelaySpikeRate10','OnlineStaticDelaySpikeRate20','OnlineStaticDelaySpikeRate30','OnlineStaticDelaySpikeRate40','OnlineStaticDelaySpikeRate50',...
    'OnlineStaticDelaySpikeRate60','OnlineStaticDelaySpikeRate70','OnlineStaticDelaySpikeRate80','OnlineStaticDelaySpikeRate90','OnlineStaticDelaySpikeRate100',...
    'OnlineDynamicDelaySpikeRate10','OnlineDynamicDelaySpikeRate20','OnlineDynamicDelaySpikeRate30','OnlineDynamicDelaySpikeRate40','OnlineDynamicDelaySpikeRate50',...
    'OnlineDynamicDelaySpikeRate60','OnlineDynamicDelaySpikeRate70','OnlineDynamicDelaySpikeRate80','OnlineDynamicDelaySpikeRate90','OnlineDynamicDelaySpikeRate100');






