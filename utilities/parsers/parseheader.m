% This function parses a header-file (*.hea) and retrieves the settings it contains into a struct,
% and is specifically designed to parse header-files that are present in any of the datasets
% provided by the research platform PhysioNet.org. 
% 
% Right now, only header-files that belong to ECG-research is supported, but expansion of
% this support may occor in the future.
%   
%   Apnea database header file structure :
%       - Record information:  [record name] [number of signals] [sample frequency] [total sample count]
%       - Signal specifications: [filename] [format] [ADC_Gain] [ADC_Resolution] [ADC_Zero] [initial value] [checksum] [blocksize] [description]
%
%   It is worth mentioning that some of these settings have sub-settings
%   that are not yet being parsed. These settings are:
%
%       Record information (record name):[number of segments]
%       Record information (sample frequency):[counter frequency]
%       Record information (counter frequency):[base counter value]
%
%       Signal specifications (ADC gain): [baseline]
%       Signal specifications (ADC gain): [units]
%       
%   Besides the sub-settings, there are a number of other settings that are
%   not yet included. This function was designed to parse headers from the
%   Apnea ECG Database. Therefore, one must keep in mind that this function
%   might return incomplete settings when being used on headers 
%   from other ECG databases.
%
%   Settings that are not yet included are:
%
%       Record information: [base time]
%       Record information: [base date]
%
%       Signal specifications: [samples per frame]
%       Signal specifications: [skew]
%       Signal specifications: [byte offset]
%          
% © Wouter Kistemaker 14-4-2021
% Version 1.0
function [settings] = parseheader(file)

    fid = fopen(file, 'r');
    
    for lineidx=1:2
        line = fgetl(fid);
        values=split(line);
        
        if lineidx == 1
            % First line -> record information
            record.name=values{1};
            record.nsignals=str2double(values{2});
            record.samplefrequency=str2double(values{3});
            record.samplecount=str2double(values{4});
            settings.record=record;
        end
        
        if lineidx == 2
            % Second line -> signal specifications
            signal.filename=values{1};
            signal.format=str2double(values{2}); 
            signal.adcgain=str2double(values{3});
            signal.adcresolution=str2double(values{4});
            signal.adczero=str2double(values{5});
            signal.initialvalue=str2double(values{6});
            signal.checksum=str2double(values{7});
            signal.blocksize=str2double(values{8});
            signal.description=values{9};
            settings.signal=signal;
        end
    end
  end