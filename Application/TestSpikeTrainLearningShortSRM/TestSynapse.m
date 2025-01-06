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



%%input: 50:500:50
OfflineStaticDelaySynapse1 = zeros(iter2,iter1);
OfflineStaticDelaySynapse2 = zeros(iter2,iter1);
OfflineStaticDelaySynapse3 = zeros(iter2,iter1);
OfflineStaticDelaySynapse4 = zeros(iter2,iter1);
OfflineStaticDelaySynapse5 = zeros(iter2,iter1);
OfflineStaticDelaySynapse6 = zeros(iter2,iter1);
OfflineStaticDelaySynapse7 = zeros(iter2,iter1);
OfflineStaticDelaySynapse8 = zeros(iter2,iter1);
OfflineStaticDelaySynapse9 = zeros(iter2,iter1);
OfflineStaticDelaySynapse10 = zeros(iter2,iter1);


OfflineDynamicDelaySynapse1 = zeros(iter2,iter1);
OfflineDynamicDelaySynapse2 = zeros(iter2,iter1);
OfflineDynamicDelaySynapse3 = zeros(iter2,iter1);
OfflineDynamicDelaySynapse4 = zeros(iter2,iter1);
OfflineDynamicDelaySynapse5 = zeros(iter2,iter1);
OfflineDynamicDelaySynapse6 = zeros(iter2,iter1);
OfflineDynamicDelaySynapse7 = zeros(iter2,iter1);
OfflineDynamicDelaySynapse8 = zeros(iter2,iter1);
OfflineDynamicDelaySynapse9 = zeros(iter2,iter1);
OfflineDynamicDelaySynapse10 = zeros(iter2,iter1);

OnlineStaticDelaySynapse1 = zeros(iter2,iter1);
OnlineStaticDelaySynapse2 = zeros(iter2,iter1);
OnlineStaticDelaySynapse3 = zeros(iter2,iter1);
OnlineStaticDelaySynapse4 = zeros(iter2,iter1);
OnlineStaticDelaySynapse5 = zeros(iter2,iter1);
OnlineStaticDelaySynapse6 = zeros(iter2,iter1);
OnlineStaticDelaySynapse7 = zeros(iter2,iter1);
OnlineStaticDelaySynapse8 = zeros(iter2,iter1);
OnlineStaticDelaySynapse9 = zeros(iter2,iter1);
OnlineStaticDelaySynapse10 = zeros(iter2,iter1);

OnlineDynamicDelaySynapse1 = zeros(iter2,iter1);
OnlineDynamicDelaySynapse2 = zeros(iter2,iter1);
OnlineDynamicDelaySynapse3 = zeros(iter2,iter1);
OnlineDynamicDelaySynapse4 = zeros(iter2,iter1);
OnlineDynamicDelaySynapse5 = zeros(iter2,iter1);
OnlineDynamicDelaySynapse6 = zeros(iter2,iter1);
OnlineDynamicDelaySynapse7 = zeros(iter2,iter1);
OnlineDynamicDelaySynapse8 = zeros(iter2,iter1);
OnlineDynamicDelaySynapse9 = zeros(iter2,iter1);
OnlineDynamicDelaySynapse10 = zeros(iter2,iter1);


%%  learning process
% if isempty(gcp('nocreate')) %如果并行未开启
%     parpool(12); %开启16个并行工作池
% end
parfor iter = 1:iter2    
    
    inputSpikes = PoissonEncoding(input,duration,spikeRate);
    desiredSpikes = PoissonEncoding(output,duration,spikeRate);
    
    weights1 = weightRange*rand(input,1,output);
    weights2 = weightRange*rand(input,2,output);
    weights3 = weightRange*rand(input,3,output);
    weights4 = weightRange*rand(input,4,output);
    weights5 = weightRange*rand(input,5,output);
    weights6 = weightRange*rand(input,6,output);
    weights7 = weightRange*rand(input,7,output);
    weights8 = weightRange*rand(input,8,output);
    weights9 = weightRange*rand(input,9,output);
    weights10 = weightRange*rand(input,10,output);
    
    delays1 = randi([0,delayRange],input,1,output);
    delays2 = randi([0,delayRange],input,2,output);
    delays3 = randi([0,delayRange],input,3,output);
    delays4 = randi([0,delayRange],input,4,output);
    delays5 = randi([0,delayRange],input,5,output);
    delays6 = randi([0,delayRange],input,6,output);
    delays7 = randi([0,delayRange],input,7,output);
    delays8 = randi([0,delayRange],input,8,output);
    delays9 = randi([0,delayRange],input,9,output);
    delays10 = randi([0,delayRange],input,10,output);
    
    OfflineStaticDelaySynapse1(iter,:) = OfflineStaticDelay(inputSpikes, desiredSpikes, weights1, weightRange, 0.01, delays1, iter1);
    fprintf("OfflineStaticDelaySynapse1 iter==%d  C==%f\n",iter,max(OfflineStaticDelaySynapse1(iter,:)));
    OfflineStaticDelaySynapse2(iter,:) = OfflineStaticDelay(inputSpikes, desiredSpikes, weights2, weightRange, 0.01, delays2, iter1);
    fprintf("OfflineStaticDelaySynapse2 iter==%d  C==%f\n",iter,max(OfflineStaticDelaySynapse2(iter,:)));
    OfflineStaticDelaySynapse3(iter,:) = OfflineStaticDelay(inputSpikes, desiredSpikes, weights3, weightRange, 0.01, delays3, iter1);
    fprintf("OfflineStaticDelaySynapse3 iter==%d  C==%f\n",iter,max(OfflineStaticDelaySynapse3(iter,:)));
    OfflineStaticDelaySynapse4(iter,:) = OfflineStaticDelay(inputSpikes, desiredSpikes, weights4, weightRange, 0.01, delays4, iter1);
    fprintf("OfflineStaticDelaySynapse4 iter==%d  C==%f\n",iter,max(OfflineStaticDelaySynapse4(iter,:)));
    OfflineStaticDelaySynapse5(iter,:) = OfflineStaticDelay(inputSpikes, desiredSpikes, weights5, weightRange, 0.01, delays5, iter1);
    fprintf("OfflineStaticDelaySynapse5 iter==%d  C==%f\n",iter,max(OfflineStaticDelaySynapse5(iter,:)));
    OfflineStaticDelaySynapse6(iter,:) = OfflineStaticDelay(inputSpikes, desiredSpikes, weights6, weightRange, 0.01, delays6, iter1);
    fprintf("OfflineStaticDelaySynapse6 iter==%d  C==%f\n",iter,max(OfflineStaticDelaySynapse6(iter,:)));
    OfflineStaticDelaySynapse7(iter,:) = OfflineStaticDelay(inputSpikes, desiredSpikes, weights7, weightRange, 0.01, delays7, iter1);
    fprintf("OfflineStaticDelaySynapse7 iter==%d  C==%f\n",iter,max(OfflineStaticDelaySynapse7(iter,:)));
    OfflineStaticDelaySynapse8(iter,:) = OfflineStaticDelay(inputSpikes, desiredSpikes, weights8, weightRange, 0.01, delays8, iter1);
    fprintf("OfflineStaticDelaySynapse8 iter==%d  C==%f\n",iter,max(OfflineStaticDelaySynapse8(iter,:)));
    OfflineStaticDelaySynapse9(iter,:) = OfflineStaticDelay(inputSpikes, desiredSpikes, weights9, weightRange, 0.01, delays9, iter1);
    fprintf("OfflineStaticDelaySynapse9 iter==%d  C==%f\n",iter,max(OfflineStaticDelaySynapse9(iter,:)));
    OfflineStaticDelaySynapse10(iter,:) = OfflineStaticDelay(inputSpikes, desiredSpikes, weights10, weightRange, 0.01, delays10, iter1);
    fprintf("OfflineStaticDelaySynapse10 iter==%d  C==%f\n",iter,max(OfflineStaticDelaySynapse10(iter,:)));
    
    OfflineDynamicDelaySynapse1(iter,:) = OfflineDynamicDelay(inputSpikes, desiredSpikes, weights1, weightRange, 0.01, delays1, delayRange, 5, iter1);
    fprintf("OfflineDynamicDelaySynapse1 iter==%d  C==%f\n",iter,max(OfflineDynamicDelaySynapse1(iter,:)));
    OfflineDynamicDelaySynapse2(iter,:) = OfflineDynamicDelay(inputSpikes, desiredSpikes, weights2, weightRange, 0.01, delays2, delayRange, 5, iter1);
    fprintf("OfflineDynamicDelaySynapse2 iter==%d  C==%f\n",iter,max(OfflineDynamicDelaySynapse2(iter,:)));
    OfflineDynamicDelaySynapse3(iter,:) = OfflineDynamicDelay(inputSpikes, desiredSpikes, weights3, weightRange, 0.01, delays3, delayRange, 5, iter1);
    fprintf("OfflineDynamicDelaySynapse3 iter==%d  C==%f\n",iter,max(OfflineDynamicDelaySynapse3(iter,:)));
    OfflineDynamicDelaySynapse4(iter,:) = OfflineDynamicDelay(inputSpikes, desiredSpikes, weights4, weightRange, 0.01, delays4, delayRange, 5, iter1);
    fprintf("OfflineDynamicDelaySynapse4 iter==%d  C==%f\n",iter,max(OfflineDynamicDelaySynapse4(iter,:)));
    OfflineDynamicDelaySynapse5(iter,:) = OfflineDynamicDelay(inputSpikes, desiredSpikes, weights5, weightRange, 0.01, delays5, delayRange, 5, iter1);
    fprintf("OfflineDynamicDelaySynapse5 iter==%d  C==%f\n",iter,max(OfflineDynamicDelaySynapse5(iter,:)));
    OfflineDynamicDelaySynapse6(iter,:) = OfflineDynamicDelay(inputSpikes, desiredSpikes, weights6, weightRange, 0.01, delays6, delayRange, 5, iter1);
    fprintf("OfflineDynamicDelaySynapse6 iter==%d  C==%f\n",iter,max(OfflineDynamicDelaySynapse6(iter,:)));
    OfflineDynamicDelaySynapse7(iter,:) = OfflineDynamicDelay(inputSpikes, desiredSpikes, weights7, weightRange, 0.01, delays7, delayRange, 5, iter1);
    fprintf("OfflineDynamicDelaySynapse7 iter==%d  C==%f\n",iter,max(OfflineDynamicDelaySynapse7(iter,:)));
    OfflineDynamicDelaySynapse8(iter,:) = OfflineDynamicDelay(inputSpikes, desiredSpikes, weights8, weightRange, 0.01, delays8, delayRange, 5, iter1);
    fprintf("OfflineDynamicDelaySynapse8 iter==%d  C==%f\n",iter,max(OfflineDynamicDelaySynapse8(iter,:)));
    OfflineDynamicDelaySynapse9(iter,:) = OfflineDynamicDelay(inputSpikes, desiredSpikes, weights9, weightRange, 0.01, delays9, delayRange, 5, iter1);
    fprintf("OfflineDynamicDelaySynapse9 iter==%d  C==%f\n",iter,max(OfflineDynamicDelaySynapse9(iter,:)));
    OfflineDynamicDelaySynapse10(iter,:) = OfflineDynamicDelay(inputSpikes, desiredSpikes, weights10, weightRange, 0.01, delays10, delayRange, 5, iter1);
    fprintf("OfflineDynamicDelaySynapse10 iter==%d  C==%f\n",iter,max(OfflineDynamicDelaySynapse10(iter,:)));
    
    OnlineStaticDelaySynapse1(iter,:) = OnlineStaticDelay(inputSpikes, desiredSpikes, weights1, weightRange, 0.05, delays1, iter1);
    fprintf("OnlineStaticDelaySynapse1 iter==%d  C==%f\n",iter,max(OnlineStaticDelaySynapse1(iter,:)));
    OnlineStaticDelaySynapse2(iter,:) = OnlineStaticDelay(inputSpikes, desiredSpikes, weights2, weightRange, 0.05, delays2, iter1);
    fprintf("OnlineStaticDelaySynapse2 iter==%d  C==%f\n",iter,max(OnlineStaticDelaySynapse2(iter,:)));
    OnlineStaticDelaySynapse3(iter,:) = OnlineStaticDelay(inputSpikes, desiredSpikes, weights3, weightRange, 0.05, delays3, iter1);
    fprintf("OnlineStaticDelaySynapse3 iter==%d  C==%f\n",iter,max(OnlineStaticDelaySynapse3(iter,:)));
    OnlineStaticDelaySynapse4(iter,:) = OnlineStaticDelay(inputSpikes, desiredSpikes, weights4, weightRange, 0.05, delays4, iter1);
    fprintf("OnlineStaticDelaySynapse4 iter==%d  C==%f\n",iter,max(OnlineStaticDelaySynapse4(iter,:)));
    OnlineStaticDelaySynapse5(iter,:) = OnlineStaticDelay(inputSpikes, desiredSpikes, weights5, weightRange, 0.05, delays5, iter1);
    fprintf("OnlineStaticDelaySynapse5 iter==%d  C==%f\n",iter,max(OnlineStaticDelaySynapse5(iter,:)));
    OnlineStaticDelaySynapse6(iter,:) = OnlineStaticDelay(inputSpikes, desiredSpikes, weights6, weightRange, 0.05, delays6, iter1);
    fprintf("OnlineStaticDelaySynapse6 iter==%d  C==%f\n",iter,max(OnlineStaticDelaySynapse6(iter,:)));
    OnlineStaticDelaySynapse7(iter,:) = OnlineStaticDelay(inputSpikes, desiredSpikes, weights7, weightRange, 0.05, delays7, iter1);
    fprintf("OnlineStaticDelaySynapse7 iter==%d  C==%f\n",iter,max(OnlineStaticDelaySynapse7(iter,:)));
    OnlineStaticDelaySynapse8(iter,:) = OnlineStaticDelay(inputSpikes, desiredSpikes, weights8, weightRange, 0.05, delays8, iter1);
    fprintf("OnlineStaticDelaySynapse8 iter==%d  C==%f\n",iter,max(OnlineStaticDelaySynapse8(iter,:)));
    OnlineStaticDelaySynapse9(iter,:) = OnlineStaticDelay(inputSpikes, desiredSpikes, weights9, weightRange, 0.05, delays9, iter1);
    fprintf("OnlineStaticDelaySynapse9 iter==%d  C==%f\n",iter,max(OnlineStaticDelaySynapse9(iter,:)));
    OnlineStaticDelaySynapse10(iter,:) = OnlineStaticDelay(inputSpikes, desiredSpikes, weights10, weightRange, 0.05, delays10, iter1);
    fprintf("OnlineStaticDelaySynapse10 iter==%d  C==%f\n",iter,max(OnlineStaticDelaySynapse10(iter,:)));
    
    OnlineDynamicDelaySynapse1(iter,:) = OnlineDynamicDelay(inputSpikes, desiredSpikes, weights1, weightRange, 0.01, delays1, delayRange, 5, iter1);
    fprintf("OnlineDynamicDelaySynapse1 iter==%d  C==%f\n",iter,max(OnlineDynamicDelaySynapse1(iter,:)));
    OnlineDynamicDelaySynapse2(iter,:) = OnlineDynamicDelay(inputSpikes, desiredSpikes, weights2, weightRange, 0.01, delays2, delayRange, 5, iter1);
    fprintf("OnlineDynamicDelaySynapse2 iter==%d  C==%f\n",iter,max(OnlineDynamicDelaySynapse2(iter,:)));
    OnlineDynamicDelaySynapse3(iter,:) = OnlineDynamicDelay(inputSpikes, desiredSpikes, weights3, weightRange, 0.01, delays3, delayRange, 5, iter1);
    fprintf("OnlineDynamicDelaySynapse3 iter==%d  C==%f\n",iter,max(OnlineDynamicDelaySynapse3(iter,:)));
    OnlineDynamicDelaySynapse4(iter,:) = OnlineDynamicDelay(inputSpikes, desiredSpikes, weights4, weightRange, 0.01, delays4, delayRange, 5, iter1);
    fprintf("OnlineDynamicDelaySynapse4 iter==%d  C==%f\n",iter,max(OnlineDynamicDelaySynapse4(iter,:)));
    OnlineDynamicDelaySynapse5(iter,:) = OnlineDynamicDelay(inputSpikes, desiredSpikes, weights5, weightRange, 0.01, delays5, delayRange, 5, iter1);
    fprintf("OnlineDynamicDelaySynapse5 iter==%d  C==%f\n",iter,max(OnlineDynamicDelaySynapse5(iter,:)));
    OnlineDynamicDelaySynapse6(iter,:) = OnlineDynamicDelay(inputSpikes, desiredSpikes, weights6, weightRange, 0.01, delays6, delayRange, 5, iter1);
    fprintf("OnlineDynamicDelaySynapse6 iter==%d  C==%f\n",iter,max(OnlineDynamicDelaySynapse6(iter,:)));
    OnlineDynamicDelaySynapse7(iter,:) = OnlineDynamicDelay(inputSpikes, desiredSpikes, weights7, weightRange, 0.01, delays7, delayRange, 5, iter1);
    fprintf("OnlineDynamicDelaySynapse7 iter==%d  C==%f\n",iter,max(OnlineDynamicDelaySynapse7(iter,:)));
    OnlineDynamicDelaySynapse8(iter,:) = OnlineDynamicDelay(inputSpikes, desiredSpikes, weights8, weightRange, 0.01, delays8, delayRange, 5, iter1);
    fprintf("OnlineDynamicDelaySynapse8 iter==%d  C==%f\n",iter,max(OnlineDynamicDelaySynapse8(iter,:)));
    OnlineDynamicDelaySynapse9(iter,:) = OnlineDynamicDelay(inputSpikes, desiredSpikes, weights9, weightRange, 0.01, delays9, delayRange, 5, iter1);
    fprintf("OnlineDynamicDelaySynapse9 iter==%d  C==%f\n",iter,max(OnlineDynamicDelaySynapse9(iter,:)));
    OnlineDynamicDelaySynapse10(iter,:) = OnlineDynamicDelay(inputSpikes, desiredSpikes, weights10, weightRange, 0.01, delays10, delayRange, 5, iter1);
    fprintf("OnlineDynamicDelaySynapse10 iter==%d  C==%f\n",iter,max(OnlineDynamicDelaySynapse10(iter,:)));
    
    
end

save('TestSynapse.mat','input','duration','spikeRate','weightRange','delayRange',...
    'OfflineStaticDelaySynapse1','OfflineStaticDelaySynapse2','OfflineStaticDelaySynapse3','OfflineStaticDelaySynapse4','OfflineStaticDelaySynapse5',...
    'OfflineStaticDelaySynapse6','OfflineStaticDelaySynapse7','OfflineStaticDelaySynapse8','OfflineStaticDelaySynapse9','OfflineStaticDelaySynapse10',...
    'OfflineDynamicDelaySynapse1','OfflineDynamicDelaySynapse2','OfflineDynamicDelaySynapse3','OfflineDynamicDelaySynapse4','OfflineDynamicDelaySynapse5',...
    'OfflineDynamicDelaySynapse6','OfflineDynamicDelaySynapse7','OfflineDynamicDelaySynapse8','OfflineDynamicDelaySynapse9','OfflineDynamicDelaySynapse10',...
    'OnlineStaticDelaySynapse1','OnlineStaticDelaySynapse2','OnlineStaticDelaySynapse3','OnlineStaticDelaySynapse4','OnlineStaticDelaySynapse5',...
    'OnlineStaticDelaySynapse6','OnlineStaticDelaySynapse7','OnlineStaticDelaySynapse8','OnlineStaticDelaySynapse9','OnlineStaticDelaySynapse10',...
    'OnlineDynamicDelaySynapse1','OnlineDynamicDelaySynapse2','OnlineDynamicDelaySynapse3','OnlineDynamicDelaySynapse4','OnlineDynamicDelaySynapse5',...
    'OnlineDynamicDelaySynapse6','OnlineDynamicDelaySynapse7','OnlineDynamicDelaySynapse8','OnlineDynamicDelaySynapse9','OnlineDynamicDelaySynapse10');






