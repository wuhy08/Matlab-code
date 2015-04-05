function [Pm_TFC_mean, Td_ECS_mean, Td_ECS_max, V_AES_RMS]=extract_result(filename)

% Initialize variables.
delimiter = ',';
startRow = 2;

% Format string for each line of text:
%   column1: double (%f)
%	column2: double (%f)
%   column3: double (%f)
%	column4: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%f%f%f%f%[^\n\r]';

% Open the text file.
fileID = fopen(filename,'r');

% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'HeaderLines' ,startRow-1, 'ReturnOnError', false);

% Close the text file.
fclose(fileID);

% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

% Allocate imported array to column variable names
Pm_TFC_mean = dataArray{:, 1};
Td_ECS_mean = dataArray{:, 2};
Td_ECS_max = dataArray{:, 3};
V_AES_RMS = dataArray{:, 4};


% Clear temporary variables
clearvars filename delimiter startRow formatSpec fileID dataArray ans;
end
