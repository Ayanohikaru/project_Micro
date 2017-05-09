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
%MILD/ MODERATE: 92 <= SpO2 <= 95, 20 < RESP =< 25, PULSE < 110
%ACUTE SEVERE:   92 <= SpO2 <= 95, RESP > 25, PULSE >=110
%LIFE THREATENING: SpO2 < 92

% % MILD/ MODERATE
% %         asth_locMM = find((n_SpO2 >=92 & n_SpO2 <=95 & n_RESP > 20 & n_RESP <=25 & n_PULSE <110));
% % ACUTE SEVERE
% %         asth_locAS = find((n_SpO2 >=92 & n_SpO2 <=95 & n_RESP > 25 & n_PULSE >= 110));
% % LIFE THREATENING
% %         asth_locLT = find(n_SpO2 <92);
% % GENERAL CASE
% %         asth_locGE = find((n_SpO2 >=92 & n_SpO2 <=95 & n_RESP > 20 & n_RESP <=25 & n_PULSE <110)| n_SpO2 < 92 |(n_SpO2 >=92 & n_SpO2 <=95 & n_RESP > 25 & n_PULSE >= 110));
% %     if iscell(fileNameLIST)==0
% %         fileNameLIST = (fileNameLIST);
% %     end
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
