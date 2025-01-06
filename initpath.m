% INITPATH Initialize paths for SNN toolbox
%
% Usage
%    initpath();

% Find where the package installed.
[pathstr, ~, ~] = fileparts(mfilename('fullpath'));

addpath(pathstr);
addpath(genpath(fullfile(pathstr,'Application')));
addpath(genpath(fullfile(pathstr,'EvaluationFunction')));
addpath(genpath(fullfile(pathstr,'LearningAlgorithm')));
addpath(genpath(fullfile(pathstr,'SpikeEncoding')));
addpath(genpath(fullfile(pathstr,'SpikingNeuronModel')));
addpath(genpath(fullfile(pathstr,'Results')));
addpath(genpath(fullfile(pathstr,'Dataset')));





clear pathstr;
