% Function that filters an input signal using the butterworth filter. The
% used butterworth filter is parameter-dependant, meaning that for instance
% the 'type' has influence on the behaviour on the filter. Although this
% function can be used directly, it is easier and recommended to use
%
%   % butterworth_lowpass_filter()      for low-pass filters
%   % butterworth_highpass_filter()     for high-pass filters
%   % butterworth_bandpass_filter()     for band-pass filters
%   
%
% Example 1: 2nd-order low-pass filter with cutoff-frequency of 6 Hz
% 
%   % fs=100;
%   % cf=6/(fs/2);                              % Cutoff-frequency of 6 Hz, 
%                                               % normalized to half of the sample frequency
%   % t=0:1/fs:1;                               % 1 second, 100 samples
%   % x=sin(2 * pi * 5 * t) + 2 * pi * 8 * t);  % 5 and 8 Hz components
%   
%   % [filtered_signal,b,a] = butterworth_filter(cf, 2, x, 'low'); 
%
% Example 2: 4th-order high-pass filter with cutoff-frequency of 6 Hz
%
%   % [filtered_signal,b,a] = butterworth_filter(cf, 2, x, 'high');
%
%
% © Wouter Kistemaker 10-4-2021
% Version 1.0

function [filtered_signal,b,a] = butterworth_filter(cf, order, original_signal, type)
    if nargin <3
        error("Please specify 4 input-arguments")
    end
    
    if nargin~= 4 && isa(cf, 'double') && length(cf) == 2        
        [b,a] = butter(order, cf);
        filtered_signal = filter(b,a,original_signal);
        return
    end
    
    if type ~= "low" && type ~= "high" && type ~= "stop"
        error("Invalid filter-type, must be: 'low', 'high'  or 'stop'")
    end
 
    if type == "stop" && (~isa(cf, 'double') || length(cf) ~= 2)
        error("The cutoff-frequency must be a 2-element array");
    end
    
    [b,a] = butter(order, cf, type);
    filtered_signal = filter(b,a,original_signal);
end
