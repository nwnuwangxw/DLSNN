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
iter2 = 1;         %%  number of repetitions of the experiment



%%Duration: 50:500:50
OfflineStaticDelayDuration50 = zeros(iter2,iter1);
OfflineStaticDelayDuration100 = zeros(iter2,iter1);
OfflineStaticDelayDuration150 = zeros(iter2,iter1);
OfflineStaticDelayDuration200 = zeros(iter2,iter1);
OfflineStaticDelayDuration250 = zeros(iter2,iter1);
OfflineStaticDelayDuration300 = zeros(iter2,iter1);
OfflineStaticDelayDuration350 = zeros(iter2,iter1);
OfflineStaticDelayDuration400 = zeros(iter2,iter1);
OfflineStaticDelayDuration450 = zeros(iter2,iter1);
OfflineStaticDelayDuration500 = zeros(iter2,iter1);


OfflineDynamicDelayDuration50 = zeros(iter2,iter1);
OfflineDynamicDelayDuration100 = zeros(iter2,iter1);
OfflineDynamicDelayDuration150 = zeros(iter2,iter1);
OfflineDynamicDelayDuration200 = zeros(iter2,iter1);
OfflineDynamicDelayDuration250 = zeros(iter2,iter1);
OfflineDynamicDelayDuration300 = zeros(iter2,iter1);
OfflineDynamicDelayDuration350 = zeros(iter2,iter1);
OfflineDynamicDelayDuration400 = zeros(iter2,iter1);
OfflineDynamicDelayDuration450 = zeros(iter2,iter1);
OfflineDynamicDelayDuration500 = zeros(iter2,iter1);

OnlineStaticDelayDuration50 = zeros(iter2,iter1);
OnlineStaticDelayDuration100 = zeros(iter2,iter1);
OnlineStaticDelayDuration150 = zeros(iter2,iter1);
OnlineStaticDelayDuration200 = zeros(iter2,iter1);
OnlineStaticDelayDuration250 = zeros(iter2,iter1);
OnlineStaticDelayDuration300 = zeros(iter2,iter1);
OnlineStaticDelayDuration350 = zeros(iter2,iter1);
OnlineStaticDelayDuration400 = zeros(iter2,iter1);
OnlineStaticDelayDuration450 = zeros(iter2,iter1);
OnlineStaticDelayDuration500 = zeros(iter2,iter1);

OnlineDynamicDelayDuration50 = zeros(iter2,iter1);
OnlineDynamicDelayDuration100 = zeros(iter2,iter1);
OnlineDynamicDelayDuration150 = zeros(iter2,iter1);
OnlineDynamicDelayDuration200 = zeros(iter2,iter1);
OnlineDynamicDelayDuration250 = zeros(iter2,iter1);
OnlineDynamicDelayDuration300 = zeros(iter2,iter1);
OnlineDynamicDelayDuration350 = zeros(iter2,iter1);
OnlineDynamicDelayDuration400 = zeros(iter2,iter1);
OnlineDynamicDelayDuration450 = zeros(iter2,iter1);
OnlineDynamicDelayDuration500 = zeros(iter2,iter1);


%%  learning process
% if isempty(gcp('nocreate')) %如果并行未开启
%     parpool(12); %开启16个并行工作池
% end
parfor iter = 1:iter2
    
    weights = weightRange*rand(input,synapse,output);
    delays = randi([0,delayRange],input,synapse,output);
    
    inputSpikes50 = PoissonEncoding(input,50,spikeRate);
    inputSpikes100 = PoissonEncoding(input,100,spikeRate);
    inputSpikes150 = PoissonEncoding(input,150,spikeRate);
    inputSpikes200 = PoissonEncoding(input,200,spikeRate);
    inputSpikes250 = PoissonEncoding(input,250,spikeRate);
    inputSpikes300 = PoissonEncoding(input,300,spikeRate);
    inputSpikes350 = PoissonEncoding(input,350,spikeRate);
    inputSpikes400 = PoissonEncoding(input,400,spikeRate);
    inputSpikes450 = PoissonEncoding(input,450,spikeRate);
    inputSpikes500 = PoissonEncoding(input,500,spikeRate);
    
    desiredSpikes50 = PoissonEncoding(output,50,spikeRate);
    desiredSpikes100 = PoissonEncoding(output,100,spikeRate);
    desiredSpikes150 = PoissonEncoding(output,150,spikeRate);
    desiredSpikes200 = PoissonEncoding(output,200,spikeRate);
    desiredSpikes250 = PoissonEncoding(output,250,spikeRate);
    desiredSpikes300 = PoissonEncoding(output,300,spikeRate);
    desiredSpikes350 = PoissonEncoding(output,350,spikeRate);
    desiredSpikes400 = PoissonEncoding(output,400,spikeRate);
    desiredSpikes450 = PoissonEncoding(output,450,spikeRate);
    desiredSpikes500 = PoissonEncoding(output,500,spikeRate);
    
    
    
    OfflineStaticDelayDuration50(iter,:) = OfflineStaticDelay(inputSpikes50, desiredSpikes50, weights, weightRange, 0.01, delays, iter1);
    fprintf("OfflineStaticDelayDuration50 iter==%d  C==%f\n",iter,max(OfflineStaticDelayDuration50(iter,:)));
    OfflineStaticDelayDuration100(iter,:) = OfflineStaticDelay(inputSpikes100, desiredSpikes100, weights, weightRange, 0.01, delays, iter1);
    fprintf("OfflineStaticDelayDuration100 iter==%d  C==%f\n",iter,max(OfflineStaticDelayDuration100(iter,:)));
    OfflineStaticDelayDuration150(iter,:) = OfflineStaticDelay(inputSpikes150, desiredSpikes150, weights, weightRange, 0.01, delays, iter1);
    fprintf("OfflineStaticDelayDuration150 iter==%d  C==%f\n",iter,max(OfflineStaticDelayDuration150(iter,:)));
    OfflineStaticDelayDuration200(iter,:) = OfflineStaticDelay(inputSpikes200, desiredSpikes200, weights, weightRange, 0.01, delays, iter1);
    fprintf("OfflineStaticDelayDuration200 iter==%d  C==%f\n",iter,max(OfflineStaticDelayDuration200(iter,:)));
    OfflineStaticDelayDuration250(iter,:) = OfflineStaticDelay(inputSpikes250, desiredSpikes250, weights, weightRange, 0.01, delays, iter1);
    fprintf("OfflineStaticDelayDuration250 iter==%d  C==%f\n",iter,max(OfflineStaticDelayDuration250(iter,:)));
    OfflineStaticDelayDuration300(iter,:) = OfflineStaticDelay(inputSpikes300, desiredSpikes300, weights, weightRange, 0.01, delays, iter1);
    fprintf("OfflineStaticDelayDuration300 iter==%d  C==%f\n",iter,max(OfflineStaticDelayDuration300(iter,:)));
    OfflineStaticDelayDuration350(iter,:) = OfflineStaticDelay(inputSpikes350, desiredSpikes350, weights, weightRange, 0.01, delays, iter1);
    fprintf("OfflineStaticDelayDuration350 iter==%d  C==%f\n",iter,max(OfflineStaticDelayDuration350(iter,:)));
    OfflineStaticDelayDuration400(iter,:) = OfflineStaticDelay(inputSpikes400, desiredSpikes400, weights, weightRange, 0.01, delays, iter1);
    fprintf("OfflineStaticDelayDuration400 iter==%d  C==%f\n",iter,max(OfflineStaticDelayDuration400(iter,:)));
    OfflineStaticDelayDuration450(iter,:) = OfflineStaticDelay(inputSpikes450, desiredSpikes450, weights, weightRange, 0.01, delays, iter1);
    fprintf("OfflineStaticDelayDuration450 iter==%d  C==%f\n",iter,max(OfflineStaticDelayDuration450(iter,:)));
    OfflineStaticDelayDuration500(iter,:) = OfflineStaticDelay(inputSpikes500, desiredSpikes500, weights, weightRange, 0.01, delays, iter1);
    fprintf("OfflineStaticDelayDuration500 iter==%d  C==%f\n",iter,max(OfflineStaticDelayDuration500(iter,:)));
    
    OfflineDynamicDelayDuration50(iter,:) = OfflineDynamicDelay(inputSpikes50, desiredSpikes50, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OfflineDynamicDelayDuration50 iter==%d  C==%f\n",iter,max(OfflineDynamicDelayDuration50(iter,:)));
    OfflineDynamicDelayDuration100(iter,:) = OfflineDynamicDelay(inputSpikes100, desiredSpikes100, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OfflineDynamicDelayDuration100 iter==%d  C==%f\n",iter,max(OfflineDynamicDelayDuration100(iter,:)));
    OfflineDynamicDelayDuration150(iter,:) = OfflineDynamicDelay(inputSpikes150, desiredSpikes150, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OfflineDynamicDelayDuration150 iter==%d  C==%f\n",iter,max(OfflineDynamicDelayDuration150(iter,:)));
    OfflineDynamicDelayDuration200(iter,:) = OfflineDynamicDelay(inputSpikes200, desiredSpikes200, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OfflineDynamicDelayDuration200 iter==%d  C==%f\n",iter,max(OfflineDynamicDelayDuration200(iter,:)));
    OfflineDynamicDelayDuration250(iter,:) = OfflineDynamicDelay(inputSpikes250, desiredSpikes250, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OfflineDynamicDelayDuration250 iter==%d  C==%f\n",iter,max(OfflineDynamicDelayDuration250(iter,:)));
    OfflineDynamicDelayDuration300(iter,:) = OfflineDynamicDelay(inputSpikes300, desiredSpikes300, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OfflineDynamicDelayDuration300 iter==%d  C==%f\n",iter,max(OfflineDynamicDelayDuration300(iter,:)));
    OfflineDynamicDelayDuration350(iter,:) = OfflineDynamicDelay(inputSpikes350, desiredSpikes350, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OfflineDynamicDelayDuration350 iter==%d  C==%f\n",iter,max(OfflineDynamicDelayDuration350(iter,:)));
    OfflineDynamicDelayDuration400(iter,:) = OfflineDynamicDelay(inputSpikes400, desiredSpikes400, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OfflineDynamicDelayDuration400 iter==%d  C==%f\n",iter,max(OfflineDynamicDelayDuration400(iter,:)));
    OfflineDynamicDelayDuration450(iter,:) = OfflineDynamicDelay(inputSpikes450, desiredSpikes450, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OfflineDynamicDelayDuration450 iter==%d  C==%f\n",iter,max(OfflineDynamicDelayDuration450(iter,:)));
    OfflineDynamicDelayDuration500(iter,:) = OfflineDynamicDelay(inputSpikes500, desiredSpikes500, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OfflineDynamicDelayDuration500 iter==%d  C==%f\n",iter,max(OfflineDynamicDelayDuration500(iter,:)));
    
    OnlineStaticDelayDuration50(iter,:) = OnlineStaticDelay(inputSpikes50, desiredSpikes50, weights, weightRange, 0.05, delays, iter1);
    fprintf("OnlineStaticDelayDuration50 iter==%d  C==%f\n",iter,max(OnlineStaticDelayDuration50(iter,:)));
    OnlineStaticDelayDuration100(iter,:) = OnlineStaticDelay(inputSpikes100, desiredSpikes100, weights, weightRange, 0.05, delays, iter1);
    fprintf("OnlineStaticDelayDuration100 iter==%d  C==%f\n",iter,max(OnlineStaticDelayDuration100(iter,:)));
    OnlineStaticDelayDuration150(iter,:) = OnlineStaticDelay(inputSpikes150, desiredSpikes150, weights, weightRange, 0.05, delays, iter1);
    fprintf("OnlineStaticDelayDuration150 iter==%d  C==%f\n",iter,max(OnlineStaticDelayDuration150(iter,:)));
    OnlineStaticDelayDuration200(iter,:) = OnlineStaticDelay(inputSpikes200, desiredSpikes200, weights, weightRange, 0.05, delays, iter1);
    fprintf("OnlineStaticDelayDuration200 iter==%d  C==%f\n",iter,max(OnlineStaticDelayDuration200(iter,:)));
    OnlineStaticDelayDuration250(iter,:) = OnlineStaticDelay(inputSpikes250, desiredSpikes250, weights, weightRange, 0.05, delays, iter1);
    fprintf("OnlineStaticDelayDuration250 iter==%d  C==%f\n",iter,max(OnlineStaticDelayDuration250(iter,:)));
    OnlineStaticDelayDuration300(iter,:) = OnlineStaticDelay(inputSpikes300, desiredSpikes300, weights, weightRange, 0.05, delays, iter1);
    fprintf("OnlineStaticDelayDuration300 iter==%d  C==%f\n",iter,max(OnlineStaticDelayDuration300(iter,:)));
    OnlineStaticDelayDuration350(iter,:) = OnlineStaticDelay(inputSpikes350, desiredSpikes350, weights, weightRange, 0.05, delays, iter1);
    fprintf("OnlineStaticDelayDuration350 iter==%d  C==%f\n",iter,max(OnlineStaticDelayDuration350(iter,:)));
    OnlineStaticDelayDuration400(iter,:) = OnlineStaticDelay(inputSpikes400, desiredSpikes400, weights, weightRange, 0.05, delays, iter1);
    fprintf("OnlineStaticDelayDuration400 iter==%d  C==%f\n",iter,max(OnlineStaticDelayDuration400(iter,:)));
    OnlineStaticDelayDuration450(iter,:) = OnlineStaticDelay(inputSpikes450, desiredSpikes450, weights, weightRange, 0.05, delays, iter1);
    fprintf("OnlineStaticDelayDuration450 iter==%d  C==%f\n",iter,max(OnlineStaticDelayDuration450(iter,:)));
    OnlineStaticDelayDuration500(iter,:) = OnlineStaticDelay(inputSpikes500, desiredSpikes500, weights, weightRange, 0.05, delays, iter1);
    fprintf("OnlineStaticDelayDuration500 iter==%d  C==%f\n",iter,max(OnlineStaticDelayDuration500(iter,:)));
    
    OnlineDynamicDelayDuration50(iter,:) = OnlineDynamicDelay(inputSpikes50, desiredSpikes50, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OnlineDynamicDelayDuration50 iter==%d  C==%f\n",iter,max(OnlineDynamicDelayDuration50(iter,:)));
    OnlineDynamicDelayDuration100(iter,:) = OnlineDynamicDelay(inputSpikes100, desiredSpikes100, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OnlineDynamicDelayDuration100 iter==%d  C==%f\n",iter,max(OnlineDynamicDelayDuration100(iter,:)));
    OnlineDynamicDelayDuration150(iter,:) = OnlineDynamicDelay(inputSpikes150, desiredSpikes150, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OnlineDynamicDelayDuration150 iter==%d  C==%f\n",iter,max(OnlineDynamicDelayDuration150(iter,:)));
    OnlineDynamicDelayDuration200(iter,:) = OnlineDynamicDelay(inputSpikes200, desiredSpikes200, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OnlineDynamicDelayDuration200 iter==%d  C==%f\n",iter,max(OnlineDynamicDelayDuration200(iter,:)));
    OnlineDynamicDelayDuration250(iter,:) = OnlineDynamicDelay(inputSpikes250, desiredSpikes250, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OnlineDynamicDelayDuration250 iter==%d  C==%f\n",iter,max(OnlineDynamicDelayDuration250(iter,:)));
    OnlineDynamicDelayDuration300(iter,:) = OnlineDynamicDelay(inputSpikes300, desiredSpikes300, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OnlineDynamicDelayDuration300 iter==%d  C==%f\n",iter,max(OnlineDynamicDelayDuration300(iter,:)));
    OnlineDynamicDelayDuration350(iter,:) = OnlineDynamicDelay(inputSpikes350, desiredSpikes350, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OnlineDynamicDelayDuration350 iter==%d  C==%f\n",iter,max(OnlineDynamicDelayDuration350(iter,:)));
    OnlineDynamicDelayDuration400(iter,:) = OnlineDynamicDelay(inputSpikes400, desiredSpikes400, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OnlineDynamicDelayDuration400 iter==%d  C==%f\n",iter,max(OnlineDynamicDelayDuration400(iter,:)));
    OnlineDynamicDelayDuration450(iter,:) = OnlineDynamicDelay(inputSpikes450, desiredSpikes450, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OnlineDynamicDelayDuration450 iter==%d  C==%f\n",iter,max(OnlineDynamicDelayDuration450(iter,:)));
    OnlineDynamicDelayDuration500(iter,:) = OnlineDynamicDelay(inputSpikes500, desiredSpikes500, weights, weightRange, 0.01, delays, delayRange, delayRate, iter1);
    fprintf("OnlineDynamicDelayDuration500 iter==%d  C==%f\n",iter,max(OnlineDynamicDelayDuration500(iter,:)));
    
    
end

% save('TestDuration.mat','input','synapse','spikeRate','weightRange','delayRange',...
%     'OfflineStaticDelayDuration50','OfflineStaticDelayDuration100','OfflineStaticDelayDuration150','OfflineStaticDelayDuration200','OfflineStaticDelayDuration250',...
%     'OfflineStaticDelayDuration300','OfflineStaticDelayDuration350','OfflineStaticDelayDuration400','OfflineStaticDelayDuration450','OfflineStaticDelayDuration500',...
%     'OfflineDynamicDelayDuration50','OfflineDynamicDelayDuration100','OfflineDynamicDelayDuration150','OfflineDynamicDelayDuration200','OfflineDynamicDelayDuration250',...
%     'OfflineDynamicDelayDuration300','OfflineDynamicDelayDuration350','OfflineDynamicDelayDuration400','OfflineDynamicDelayDuration450','OfflineDynamicDelayDuration500',...
%     'OnlineStaticDelayDuration50','OnlineStaticDelayDuration100','OnlineStaticDelayDuration150','OnlineStaticDelayDuration200','OnlineStaticDelayDuration250',...
%     'OnlineStaticDelayDuration300','OnlineStaticDelayDuration350','OnlineStaticDelayDuration400','OnlineStaticDelayDuration450','OnlineStaticDelayDuration500',...
%     'OnlineDynamicDelayDuration50','OnlineDynamicDelayDuration100','OnlineDynamicDelayDuration150','OnlineDynamicDelayDuration200','OnlineDynamicDelayDuration250',...
%     'OnlineDynamicDelayDuration300','OnlineDynamicDelayDuration350','OnlineDynamicDelayDuration400','OnlineDynamicDelayDuration450','OnlineDynamicDelayDuration500');






