% Helper-function that internally calls the butterworth_filter() function 
% with the parameters used such, that the input-signal is filtered with a 
% high-pass butterworth filter

% © Wouter Kistemaker 10-4-2021
% Version 1.0
function [filtered_signal,b,a] = butterworth_highpass_filter(cf, order, original_signal)
   [filtered_signal,b,a] = butterworth_filter(cf, order, original_signal, 'high');
end