clc; clear all; close all
addpath('constrained-foopsi-master')
thr_val = 98;

%% Loading the data
load('mydata.mat');
x_data = data.x_data;
y_data = data.y_data;

traces = horzcat(y_data.f_s, y_data.f_d);
fprintf('Number of soma traces: %d\n', size(x_data.s_s, 2))
fprintf('Number of spine traces: %d\n', size(x_data.s_d, 2))

soma_trace = traces(1000:2000, 1);
spine_trace = y_data.f_d;
inferred_spike = zeros(1000, size(x_data.s_d, 2));

%% robust fit
for i=1:size(x_data.s_d, 2)
    i
    spine_one = spine_trace(1000:2000, i);
    one_spike_trace = fun_robust_fit(soma_trace, spine_one);
    inferred_spike(:, i) = one_spike_trace;
end

save('result_rfit.mat', 'inferred_spike')

%% 2-step foopsi
inferred_spike2 = zeros(1000, size(x_data.s_d, 2));
for i=1:size(x_data.s_d, 2)
    i
    spine_one = spine_trace(1:1000, i);
    one_spike_trace = two_step_fooposi(soma_trace, spine_one);
    inferred_spike2(:, i) = one_spike_trace;
end
save('result_foopsi.mat', 'inferred_spike2')