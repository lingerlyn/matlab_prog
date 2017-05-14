function y = fun_robust_fit(soma_trace, spine_trace)
%% Robust Regression
brob = robustfit(soma_trace, spine_trace);

spine_only_comp = spine_trace - (brob(1) + brob(2)*soma_trace);
[c,b,c1,g,sn,sp] = constrained_foopsi(spine_only_comp);
y = sp; 
end 