function error = CauchySchwarzDistance(SpikeTrain1,SpikeTrain2)
sigma = 5;
sii = spikeInnerProduct(SpikeTrain1,SpikeTrain1,sigma);
sjj = spikeInnerProduct(SpikeTrain2,SpikeTrain2,sigma);
sij = spikeInnerProduct(SpikeTrain1,SpikeTrain2,sigma);
error = sij/sqrt(sii*sjj);
end

function ip = spikeInnerProduct(SpikeTrain1,SpikeTrain2,sigma)
SpikeTrain1 = find(SpikeTrain1);
SpikeTrain2 = find(SpikeTrain2);
s = abs(SpikeTrain1 - SpikeTrain2');
ip = exp(-(s.*s)./(2*sigma*sigma));
ip = sum(ip(:));
end