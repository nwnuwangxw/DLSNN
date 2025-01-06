clear all;
clc;

input=100;
synapse = 5;
output = 1;
duration=200;
rate=10;
weightRange = 0.5;
delayRange = 5;

inputSpikes = PoissonEncoding(input, duration, rate);
outputSpikes = zeros(output,duration);

weights = weightRange*rand(input,synapse,output);
delays = randi(delayRange,input,synapse,output);

for t = 1:duration
    [outputSpikes,potential] = ShortSRM(inputSpikes, weights, delays, outputSpikes, t);
end
