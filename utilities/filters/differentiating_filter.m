% This function filters an input signal with a differentiating filter
% where the difference with the previous sample is used to filter the
% signal
%
%   Parameters:
%       - original_signal : input signal (array)
%       - deltaT : the time step between 2 samples
%
% © Wouter Kistemaker 14-4-2021
% Version 1.0
function [filtered_signal] = differentiating_filter(original_signal, deltaT)
    n=length(original_signal);
    filtered_signal = zeros(1, n);
    
    for idx=1:n
        if idx==1
            filtered_signal(1) = original_signal(1)/deltaT;
        else
            filtered_signal(idx) = (original_signal(idx)-original_signal(idx-1))/deltaT;
        end
    end
end
