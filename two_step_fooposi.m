function y = two_step_fooposi(soma_trace, spine_trace)
[c_soma,b_soma,c1_soma,g_soma,sn_soma,sp_soma] = constrained_foopsi(soma_trace);
[c_spine,b_spine,c1_spine,g_spine,sn_spine,sp_spine] = constrained_foopsi(spine_trace);

% robust fitting gives only zero, so use linear regression 
brob = robustfit(soma_trace, spine_trace);

% linear regression
%brob = regress(sp_soma, [ones(size(soma_trace)), sp_spine]);
spine_only_comp = sp_spine - (brob(1) + brob(2)*sp_soma);
y = spine_only_comp;
end