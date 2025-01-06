function ip = spikeInnerProduct(SpikeTrain1,SpikeTrain2,delay,sigma)
SpikeTrain1 = find(SpikeTrain1);
SpikeTrain2 = find(SpikeTrain2);
s = abs(SpikeTrain1 - SpikeTrain2' - delay);
ip = exp(-s.*s./(2*sigma*sigma));
ip = sum(ip(:));
end