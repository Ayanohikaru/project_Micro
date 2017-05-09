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
% Eliminate value below normal
i = 1;
while (HR(i)<50 & SpO2(i)<80)
       i = i+1;
       Status_panel = 'Please wait....';
       Result_panel = 'Connecting';
       disp(Status_panel);disp(Result_panel);
end


%% Annotation 
%CLASSIFICATION
for i = i:length(HR)
       Status_panel = 'Running';
       if (SpO2(i)>95)
          Result_panel = 'Normal';
       elseif (SpO2(i)>=92 & SpO2(i)<=92 & HR<110)
          Result_panel = 'Mild/Moderate';
       elseif (SpO2(i)>=92 & SpO2(i)<=92 & HR>110)
          Result_panel = 'Acute';
       elseif (SpO2(i)<92)
          Result_panel = 'Life Threatening';
       end   
       disp(Status_panel);disp(Result_panel); 
end
