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
OfflineStaticDelayInput50 = zeros(iter2,iter1);
OfflineStaticDelayInput100 = zeros(iter2,iter1);
OfflineStaticDelayInput150 = zeros(iter2,iter1);
OfflineStaticDelayInput200 = zeros(iter2,iter1);
OfflineStaticDelayInput250 = zeros(iter2,iter1);
OfflineStaticDelayInput300 = zeros(iter2,iter1);
OfflineStaticDelayInput350 = zeros(iter2,iter1);
OfflineStaticDelayInput400 = zeros(iter2,iter1);
OfflineStaticDelayInput450 = zeros(iter2,iter1);
OfflineStaticDelayInput500 = zeros(iter2,iter1);


OfflineDynamicDelayInput50 = zeros(iter2,iter1);
OfflineDynamicDelayInput100 = zeros(iter2,iter1);
OfflineDynamicDelayInput150 = zeros(iter2,iter1);
OfflineDynamicDelayInput200 = zeros(iter2,iter1);
OfflineDynamicDelayInput250 = zeros(iter2,iter1);
OfflineDynamicDelayInput300 = zeros(iter2,iter1);
OfflineDynamicDelayInput350 = zeros(iter2,iter1);
OfflineDynamicDelayInput400 = zeros(iter2,iter1);
OfflineDynamicDelayInput450 = zeros(iter2,iter1);
OfflineDynamicDelayInput500 = zeros(iter2,iter1);

OnlineStaticDelayInput50 = zeros(iter2,iter1);
OnlineStaticDelayInput100 = zeros(iter2,iter1);
OnlineStaticDelayInput150 = zeros(iter2,iter1);
OnlineStaticDelayInput200 = zeros(iter2,iter1);
OnlineStaticDelayInput250 = zeros(iter2,iter1);
OnlineStaticDelayInput300 = zeros(iter2,iter1);
OnlineStaticDelayInput350 = zeros(iter2,iter1);
OnlineStaticDelayInput400 = zeros(iter2,iter1);
OnlineStaticDelayInput450 = zeros(iter2,iter1);
OnlineStaticDelayInput500 = zeros(iter2,iter1);

OnlineDynamicDelayInput50 = zeros(iter2,iter1);
OnlineDynamicDelayInput100 = zeros(iter2,iter1);
OnlineDynamicDelayInput150 = zeros(iter2,iter1);
OnlineDynamicDelayInput200 = zeros(iter2,iter1);
OnlineDynamicDelayInput250 = zeros(iter2,iter1);
OnlineDynamicDelayInput300 = zeros(iter2,iter1);
OnlineDynamicDelayInput350 = zeros(iter2,iter1);
OnlineDynamicDelayInput400 = zeros(iter2,iter1);
OnlineDynamicDelayInput450 = zeros(iter2,iter1);
OnlineDynamicDelayInput500 = zeros(iter2,iter1);


%%  learning process
% if isempty(gcp('nocreate')) %如果并行未开启
%     parpool(12); %开启16个并行工作池
% end
parfor iter = 1:iter2
    desiredSpikes = PoissonEncoding(output,duration,spikeRate);
    
    inputSpikes50 = PoissonEncoding(50,duration,spikeRate);
    inputSpikes100 = PoissonEncoding(100,duration,spikeRate);
    inputSpikes150 = PoissonEncoding(150,duration,spikeRate);
    inputSpikes200 = PoissonEncoding(200,duration,spikeRate);
    inputSpikes250 = PoissonEncoding(250,duration,spikeRate);
    inputSpikes300 = PoissonEncoding(300,duration,spikeRate);
    inputSpikes350 = PoissonEncoding(350,duration,spikeRate);
    inputSpikes400 = PoissonEncoding(400,duration,spikeRate);
    inputSpikes450 = PoissonEncoding(450,duration,spikeRate);
    inputSpikes500 = PoissonEncoding(500,duration,spikeRate);
    
    weights50 = weightRange*rand(50,synapse,output);
    weights100 = weightRange*rand(100,synapse,output);
    weights150 = weightRange*rand(150,synapse,output);
    weights200 = weightRange*rand(200,synapse,output);
    weights250 = weightRange*rand(250,synapse,output);
    weights300 = weightRange*rand(300,synapse,output);
    weights350 = weightRange*rand(350,synapse,output);
    weights400 = weightRange*rand(400,synapse,output);
    weights450 = weightRange*rand(450,synapse,output);
    weights500 = weightRange*rand(500,synapse,output);
    
    delays50 = randi([0,delayRange],50,synapse,output);
    delays100 = randi([0,delayRange],100,synapse,output);
    delays150 = randi([0,delayRange],150,synapse,output);
    delays200 = randi([0,delayRange],200,synapse,output);
    delays250 = randi([0,delayRange],250,synapse,output);
    delays300 = randi([0,delayRange],300,synapse,output);
    delays350 = randi([0,delayRange],350,synapse,output);
    delays400 = randi([0,delayRange],400,synapse,output);
    delays450 = randi([0,delayRange],450,synapse,output);
    delays500 = randi([0,delayRange],500,synapse,output);
    
    OfflineStaticDelayInput50(iter,:) = OfflineStaticDelay(inputSpikes50, desiredSpikes, weights50, weightRange, 0.01, delays50, iter1);
    fprintf("OfflineStaticDelayInput50 iter==%d  C==%f\n",iter,max(OfflineStaticDelayInput50(iter,:)));
    OfflineStaticDelayInput100(iter,:) = OfflineStaticDelay(inputSpikes100, desiredSpikes, weights100, weightRange, 0.01, delays100, iter1);
    fprintf("OfflineStaticDelayInput100 iter==%d  C==%f\n",iter,max(OfflineStaticDelayInput100(iter,:)));
    OfflineStaticDelayInput150(iter,:) = OfflineStaticDelay(inputSpikes150, desiredSpikes, weights150, weightRange, 0.01, delays150, iter1);
    fprintf("OfflineStaticDelayInput150 iter==%d  C==%f\n",iter,max(OfflineStaticDelayInput150(iter,:)));
    OfflineStaticDelayInput200(iter,:) = OfflineStaticDelay(inputSpikes200, desiredSpikes, weights200, weightRange, 0.01, delays200, iter1);
    fprintf("OfflineStaticDelayInput200 iter==%d  C==%f\n",iter,max(OfflineStaticDelayInput200(iter,:)));
    OfflineStaticDelayInput250(iter,:) = OfflineStaticDelay(inputSpikes250, desiredSpikes, weights250, weightRange, 0.01, delays250, iter1);
    fprintf("OfflineStaticDelayInput250 iter==%d  C==%f\n",iter,max(OfflineStaticDelayInput250(iter,:)));
    OfflineStaticDelayInput300(iter,:) = OfflineStaticDelay(inputSpikes300, desiredSpikes, weights300, weightRange, 0.01, delays300, iter1);
    fprintf("OfflineStaticDelayInput300 iter==%d  C==%f\n",iter,max(OfflineStaticDelayInput300(iter,:)));
    OfflineStaticDelayInput350(iter,:) = OfflineStaticDelay(inputSpikes350, desiredSpikes, weights350, weightRange, 0.01, delays350, iter1);
    fprintf("OfflineStaticDelayInput350 iter==%d  C==%f\n",iter,max(OfflineStaticDelayInput350(iter,:)));
    OfflineStaticDelayInput400(iter,:) = OfflineStaticDelay(inputSpikes400, desiredSpikes, weights400, weightRange, 0.01, delays400, iter1);
    fprintf("OfflineStaticDelayInput400 iter==%d  C==%f\n",iter,max(OfflineStaticDelayInput400(iter,:)));
    OfflineStaticDelayInput450(iter,:) = OfflineStaticDelay(inputSpikes450, desiredSpikes, weights450, weightRange, 0.01, delays450, iter1);
    fprintf("OfflineStaticDelayInput450 iter==%d  C==%f\n",iter,max(OfflineStaticDelayInput450(iter,:)));
    OfflineStaticDelayInput500(iter,:) = OfflineStaticDelay(inputSpikes500, desiredSpikes, weights500, weightRange, 0.01, delays500, iter1);
    fprintf("OfflineStaticDelayInput500 iter==%d  C==%f\n",iter,max(OfflineStaticDelayInput500(iter,:)));
    
    OfflineDynamicDelayInput50(iter,:) = OfflineDynamicDelay(inputSpikes50, desiredSpikes, weights50, weightRange, 0.01, delays50, delayRange, 5, iter1);
    fprintf("OfflineDynamicDelayInput50 iter==%d  C==%f\n",iter,max(OfflineDynamicDelayInput50(iter,:)));
    OfflineDynamicDelayInput100(iter,:) = OfflineDynamicDelay(inputSpikes100, desiredSpikes, weights100, weightRange, 0.01, delays100, delayRange, 5, iter1);
    fprintf("OfflineDynamicDelayInput100 iter==%d  C==%f\n",iter,max(OfflineDynamicDelayInput100(iter,:)));
    OfflineDynamicDelayInput150(iter,:) = OfflineDynamicDelay(inputSpikes150, desiredSpikes, weights150, weightRange, 0.01, delays150, delayRange, 5, iter1);
    fprintf("OfflineDynamicDelayInput150 iter==%d  C==%f\n",iter,max(OfflineDynamicDelayInput150(iter,:)));
    OfflineDynamicDelayInput200(iter,:) = OfflineDynamicDelay(inputSpikes200, desiredSpikes, weights200, weightRange, 0.01, delays200, delayRange, 5, iter1);
    fprintf("OfflineDynamicDelayInput200 iter==%d  C==%f\n",iter,max(OfflineDynamicDelayInput200(iter,:)));
    OfflineDynamicDelayInput250(iter,:) = OfflineDynamicDelay(inputSpikes250, desiredSpikes, weights250, weightRange, 0.01, delays250, delayRange, 5, iter1);
    fprintf("OfflineDynamicDelayInput250 iter==%d  C==%f\n",iter,max(OfflineDynamicDelayInput250(iter,:)));
    OfflineDynamicDelayInput300(iter,:) = OfflineDynamicDelay(inputSpikes300, desiredSpikes, weights300, weightRange, 0.01, delays300, delayRange, 5, iter1);
    fprintf("OfflineDynamicDelayInput300 iter==%d  C==%f\n",iter,max(OfflineDynamicDelayInput300(iter,:)));
    OfflineDynamicDelayInput350(iter,:) = OfflineDynamicDelay(inputSpikes350, desiredSpikes, weights350, weightRange, 0.01, delays350, delayRange, 5, iter1);
    fprintf("OfflineDynamicDelayInput350 iter==%d  C==%f\n",iter,max(OfflineDynamicDelayInput350(iter,:)));
    OfflineDynamicDelayInput400(iter,:) = OfflineDynamicDelay(inputSpikes400, desiredSpikes, weights400, weightRange, 0.01, delays400, delayRange, 5, iter1);
    fprintf("OfflineDynamicDelayInput400 iter==%d  C==%f\n",iter,max(OfflineDynamicDelayInput400(iter,:)));
    OfflineDynamicDelayInput450(iter,:) = OfflineDynamicDelay(inputSpikes450, desiredSpikes, weights450, weightRange, 0.01, delays450, delayRange, 5, iter1);
    fprintf("OfflineDynamicDelayInput450 iter==%d  C==%f\n",iter,max(OfflineDynamicDelayInput450(iter,:)));
    OfflineDynamicDelayInput500(iter,:) = OfflineDynamicDelay(inputSpikes500, desiredSpikes, weights500, weightRange, 0.01, delays500, delayRange, 5, iter1);
    fprintf("OfflineDynamicDelayInput500 iter==%d  C==%f\n",iter,max(OfflineDynamicDelayInput500(iter,:)));
    
    OnlineStaticDelayInput50(iter,:) = OnlineStaticDelay(inputSpikes50, desiredSpikes, weights50, weightRange, 0.05, delays50, iter1);
    fprintf("OnlineStaticDelayInput50 iter==%d  C==%f\n",iter,max(OnlineStaticDelayInput50(iter,:)));
    OnlineStaticDelayInput100(iter,:) = OnlineStaticDelay(inputSpikes100, desiredSpikes, weights100, weightRange, 0.05, delays100, iter1);
    fprintf("OnlineStaticDelayInput100 iter==%d  C==%f\n",iter,max(OnlineStaticDelayInput100(iter,:)));
    OnlineStaticDelayInput150(iter,:) = OnlineStaticDelay(inputSpikes150, desiredSpikes, weights150, weightRange, 0.05, delays150, iter1);
    fprintf("OnlineStaticDelayInput150 iter==%d  C==%f\n",iter,max(OnlineStaticDelayInput150(iter,:)));
    OnlineStaticDelayInput200(iter,:) = OnlineStaticDelay(inputSpikes200, desiredSpikes, weights200, weightRange, 0.05, delays200, iter1);
    fprintf("OnlineStaticDelayInput200 iter==%d  C==%f\n",iter,max(OnlineStaticDelayInput200(iter,:)));
    OnlineStaticDelayInput250(iter,:) = OnlineStaticDelay(inputSpikes250, desiredSpikes, weights250, weightRange, 0.05, delays250, iter1);
    fprintf("OnlineStaticDelayInput250 iter==%d  C==%f\n",iter,max(OnlineStaticDelayInput250(iter,:)));
    OnlineStaticDelayInput300(iter,:) = OnlineStaticDelay(inputSpikes300, desiredSpikes, weights300, weightRange, 0.05, delays300, iter1);
    fprintf("OnlineStaticDelayInput300 iter==%d  C==%f\n",iter,max(OnlineStaticDelayInput300(iter,:)));
    OnlineStaticDelayInput350(iter,:) = OnlineStaticDelay(inputSpikes350, desiredSpikes, weights350, weightRange, 0.05, delays350, iter1);
    fprintf("OnlineStaticDelayInput350 iter==%d  C==%f\n",iter,max(OnlineStaticDelayInput350(iter,:)));
    OnlineStaticDelayInput400(iter,:) = OnlineStaticDelay(inputSpikes400, desiredSpikes, weights400, weightRange, 0.05, delays400, iter1);
    fprintf("OnlineStaticDelayInput400 iter==%d  C==%f\n",iter,max(OnlineStaticDelayInput400(iter,:)));
    OnlineStaticDelayInput450(iter,:) = OnlineStaticDelay(inputSpikes450, desiredSpikes, weights450, weightRange, 0.05, delays450, iter1);
    fprintf("OnlineStaticDelayInput450 iter==%d  C==%f\n",iter,max(OnlineStaticDelayInput450(iter,:)));
    OnlineStaticDelayInput500(iter,:) = OnlineStaticDelay(inputSpikes500, desiredSpikes, weights500, weightRange, 0.05, delays500, iter1);
    fprintf("OnlineStaticDelayInput500 iter==%d  C==%f\n",iter,max(OnlineStaticDelayInput500(iter,:)));
    
    OnlineDynamicDelayInput50(iter,:) = OnlineDynamicDelay(inputSpikes50, desiredSpikes, weights50, weightRange, 0.01, delays50, delayRange, 5, iter1);
    fprintf("OnlineDynamicDelayInput50 iter==%d  C==%f\n",iter,max(OnlineDynamicDelayInput50(iter,:)));
    OnlineDynamicDelayInput100(iter,:) = OnlineDynamicDelay(inputSpikes100, desiredSpikes, weights100, weightRange, 0.01, delays100, delayRange, 5, iter1);
    fprintf("OnlineDynamicDelayInput100 iter==%d  C==%f\n",iter,max(OnlineDynamicDelayInput100(iter,:)));
    OnlineDynamicDelayInput150(iter,:) = OnlineDynamicDelay(inputSpikes150, desiredSpikes, weights150, weightRange, 0.01, delays150, delayRange, 5, iter1);
    fprintf("OnlineDynamicDelayInput150 iter==%d  C==%f\n",iter,max(OnlineDynamicDelayInput150(iter,:)));
    OnlineDynamicDelayInput200(iter,:) = OnlineDynamicDelay(inputSpikes200, desiredSpikes, weights200, weightRange, 0.01, delays200, delayRange, 5, iter1);
    fprintf("OnlineDynamicDelayInput200 iter==%d  C==%f\n",iter,max(OnlineDynamicDelayInput200(iter,:)));
    OnlineDynamicDelayInput250(iter,:) = OnlineDynamicDelay(inputSpikes250, desiredSpikes, weights250, weightRange, 0.01, delays250, delayRange, 5, iter1);
    fprintf("OnlineDynamicDelayInput250 iter==%d  C==%f\n",iter,max(OnlineDynamicDelayInput250(iter,:)));
    OnlineDynamicDelayInput300(iter,:) = OnlineDynamicDelay(inputSpikes300, desiredSpikes, weights300, weightRange, 0.01, delays300, delayRange, 5, iter1);
    fprintf("OnlineDynamicDelayInput300 iter==%d  C==%f\n",iter,max(OnlineDynamicDelayInput300(iter,:)));
    OnlineDynamicDelayInput350(iter,:) = OnlineDynamicDelay(inputSpikes350, desiredSpikes, weights350, weightRange, 0.01, delays350, delayRange, 5, iter1);
    fprintf("OnlineDynamicDelayInput350 iter==%d  C==%f\n",iter,max(OnlineDynamicDelayInput350(iter,:)));
    OnlineDynamicDelayInput400(iter,:) = OnlineDynamicDelay(inputSpikes400, desiredSpikes, weights400, weightRange, 0.01, delays400, delayRange, 5, iter1);
    fprintf("OnlineDynamicDelayInput400 iter==%d  C==%f\n",iter,max(OnlineDynamicDelayInput400(iter,:)));
    OnlineDynamicDelayInput450(iter,:) = OnlineDynamicDelay(inputSpikes450, desiredSpikes, weights450, weightRange, 0.01, delays450, delayRange, 5, iter1);
    fprintf("OnlineDynamicDelayInput450 iter==%d  C==%f\n",iter,max(OnlineDynamicDelayInput450(iter,:)));
    OnlineDynamicDelayInput500(iter,:) = OnlineDynamicDelay(inputSpikes500, desiredSpikes, weights500, weightRange, 0.01, delays500, delayRange, 5, iter1);
    fprintf("OnlineDynamicDelayInput500 iter==%d  C==%f\n",iter,max(OnlineDynamicDelayInput500(iter,:)));
    
    
end

save('TestInput.mat','synapse','duration','spikeRate','weightRange','delayRange',...
    'OfflineStaticDelayInput50','OfflineStaticDelayInput100','OfflineStaticDelayInput150','OfflineStaticDelayInput200','OfflineStaticDelayInput250',...
    'OfflineStaticDelayInput300','OfflineStaticDelayInput350','OfflineStaticDelayInput400','OfflineStaticDelayInput450','OfflineStaticDelayInput500',...
    'OfflineDynamicDelayInput50','OfflineDynamicDelayInput100','OfflineDynamicDelayInput150','OfflineDynamicDelayInput200','OfflineDynamicDelayInput250',...
    'OfflineDynamicDelayInput300','OfflineDynamicDelayInput350','OfflineDynamicDelayInput400','OfflineDynamicDelayInput450','OfflineDynamicDelayInput500',...
    'OnlineStaticDelayInput50','OnlineStaticDelayInput100','OnlineStaticDelayInput150','OnlineStaticDelayInput200','OnlineStaticDelayInput250',...
    'OnlineStaticDelayInput300','OnlineStaticDelayInput350','OnlineStaticDelayInput400','OnlineStaticDelayInput450','OnlineStaticDelayInput500',...
    'OnlineDynamicDelayInput50','OnlineDynamicDelayInput100','OnlineDynamicDelayInput150','OnlineDynamicDelayInput200','OnlineDynamicDelayInput250',...
    'OnlineDynamicDelayInput300','OnlineDynamicDelayInput350','OnlineDynamicDelayInput400','OnlineDynamicDelayInput450','OnlineDynamicDelayInput500');






