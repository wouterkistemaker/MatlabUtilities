% Function that calculates the Fourier Transform of the passed function and
% sample frequency (Fs). If output-arguments are 0, both the
% fouriertransformed and the normal function are plotted in two seperate
% figures using subplots. 
%
% fftx and ffty are the matrices containing the values of the
% Fourier Transform of f(t). 
%
% Example:
% 
%   % fs=50; % Sample frequency of 50Hz
%   % dt=1/fs; % Time-step 
%   % t=0:dt:10; % Time-axis from 0 to 10 
%
%   % x=sin(2*pi*3*t); % Sine of 3 Hz
%
%   % fouriertransform(t,fs,x); % Calling it like this will plot x en F(w) of x
% 
%   % [fftx, ffty] = fouriertransform(t,fs,x);
% This won't plot the F(w) of x
% but will return the result of the Fourier Transform in two matrices fftx
% and ffty

% © Wouter Kistemaker 8-3-2022
% TG UTwente
% Version 1.1
function [fftx, ffty] = fouriertransform(t, fs, f, fftxMin, fftxMax)
    N=length(t);
    
    
    if isa(f, "function_handle")
        temp=f(t);
        withLegend=1;
    else
        temp=f;
        withLegend=0;
    end
    
    if nargin < 3
        error("Not enough input arguments specified")
    end
    
    fftx=(0:N-1) *fs/N;
    ffty=abs(fft(temp));
       
    if nargout==0
        subplot(2,1,1); plot(t,temp); xlabel("Time (s)"); 
            if withLegend
                legend(char(f)); 
            end
        subplot(2,1,2); plot(fftx, ffty); xlabel("Frequency (Hz)"); 
            if withLegend
                legend("Fourier Transform of " + char(f));
            end
        
        if nargin == 4
            xlim([fftxMin, max(fftx)]);
        end
        
        if nargin == 5
            xlim([fftxMin, fftxMax]);
        end
        
        % Make sure the highest peak is visible without the need to scroll
        ylim([0, 1.1 * max(ffty)]); 
    end
end
