% This function filters an input signal with a moving average
% filter, where a number of samples in the past are taken into account. 
%
%   Parameters:
%       - original_signal : input signal (array)
%       - nSamples : amount of extra samples to use
%
% © Wouter Kistemaker 14-4-2021
% TG UTwente
% Version 1.0
function [filtered_signal] = moving_average_filter(original_signal, nSamples)
    n = length(original_signal);
    filtered_signal = zeros(1,n);
    
    if nargin == 1
        nSamples = 2;
    end
    
    for idx=1:n
        
        
        beginindex=idx-nSamples;
        
        if beginindex < 1
            beginindex=1;
        end
            filtered_signal(idx) = sum(original_signal(beginindex:idx))/(nSamples+1);
    end
end
