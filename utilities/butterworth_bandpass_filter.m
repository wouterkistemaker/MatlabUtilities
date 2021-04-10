% Helper-function that internally calls the butterworth_filter() function 
% with the parameters used such, that the input-signal is filtered with a 
% band-pass butterworth filter

% © Wouter Kistemaker 10-4-2021
% Version 1.0
function [filtered_signal, b, a] = butterworth_bandpass_filter(cf, order, original_signal)
    if ~isa(cf, 'double') || length(cf) ~= 2
        error("The cutoff-frequency must be a 2-element array");
    end
    [filtered_signal,b,a] = butterworth_filter(cf, order, original_signal);
end