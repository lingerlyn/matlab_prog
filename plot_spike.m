function plot_spike(spikes, clor)
%% take in spikes, and plot spikes
ystart = zeros(size(spikes));
yend = spikes;

hold on;
for idx = 1:numel(ystart)
    plot([idx, idx], [ystart(idx), yend(idx)], clor)
end
hold off;
end