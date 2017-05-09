%This is a part of Micro electronics devices project. This code is used to
%acquire SpO2 and HR from MAX30100. Each text file is 10s interval.
%Sampling rate = 100Hz => 1000 sample per file.
clc; clear all; close all;

%% Open file
addpath('D:\Project Micro\code\Data');
PatientData = importdata('Data.txt');
SpO2 = PatientData.data(:,1);
HR = PatientData.data(:,2);
Patient_Data = PatientData.data;

%% Remove startup value 
% Waiting for 10s = 1000 sample
%
for i = 1:1000
    Status_panel = 'Connecting. Please wait';
end


%% Annotation 
%CLASSIFICATION
%NORMAL: SpO2<=95, PULSE
%MILD/ MODERATE: 92 <= SpO2 <= 95, 20 < RESP =< 25, PULSE < 110
%ACUTE SEVERE:   92 <= SpO2 <= 95, RESP > 25, PULSE >=110
%LIFE THREATENING: SpO2 < 92

%MILD/ MODERATE
        asth_locMM = find((n_SpO2 >=92 & n_SpO2 <=95 & n_RESP > 20 & n_RESP <=25 & n_PULSE <110));
%ACUTE SEVERE
        asth_locAS = find((n_SpO2 >=92 & n_SpO2 <=95 & n_RESP > 25 & n_PULSE >= 110));
%LIFE THREATENING
        asth_locLT = find(n_SpO2 <92);
%GENERAL CASE
        asth_locGE = find((n_SpO2 >=92 & n_SpO2 <=95 & n_RESP > 20 & n_RESP <=25 & n_PULSE <110)| n_SpO2 < 92 |(n_SpO2 >=92 & n_SpO2 <=95 & n_RESP > 25 & n_PULSE >= 110));
%     if iscell(fileNameLIST)==0
%         fileNameLIST = {fileNameLIST};
%     end
for i = 1001:length(HR)
    Status_panel = 'Running';
    Value_HR = HR{i};
    Value_Sp = SpO2{i};
    if 
end
