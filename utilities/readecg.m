% Function that reads a *.dat file and loads the expected ECG-data that is
% in it. One can specify the sample frequency and the time until one wants
% to have the ECG-data. If not specified, all data is loaded. One must
% understand that these files can be very big, so it may be heavy to load a
% complete file, and it may certainly be heavy to perform operations on the
% entire dataset retrieved!
%
% Example:
% 
%   % filename = 'ecg.dat';
%   % ecg = readecg(filename); 
%
%   % filename = 'ecg.dat';
%   % fs = 100; % 100 samples per second
%   % time = 30; % we want to get the ECG for 30 seconds
%   % ecg = readecg(filename, fs, time);
% 
% © Wouter Kistemaker 9-4-2021
% Version 1.0

function [data] = readecg(filename, fs, time, precision)
    fid = fopen(filename, 'r');
    
    if fid==-1
        error("No such file or directory: '" + filename + "'")
    end
    
    
    if nargin == 1
        data = fread(fid);  
        return
    end
    
    if nargin == 3
        data = fread(fid, fs*time);
        return
    end
    
    if nargin == 4
        data = fread(fid, fs*time, precision);
        return
    end
    
    error("Specify 1 or 3 arguments")
end
