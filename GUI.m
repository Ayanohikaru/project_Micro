function varargout = GUI(varargin)
%GUI MATLAB code file for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('Property','Value',...) creates a new GUI using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to GUI_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      GUI('CALLBACK') and GUI('CALLBACK',hObject,...) call the
%      local function named CALLBACK in GUI.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 10-May-2017 03:28:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
   gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

cd('D:\Project Micro\code');
imshow('logoIU.jpg','Parent',handles.logoIU);
imshow('logoBME.jpg','Parent',handles.logoBME);
set(handles.Status,'String','Starting up ...');

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function severity_result_Callback(hObject, eventdata, handles)
% hObject    handle to severity_result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of severity_result as text
%        str2double(get(hObject,'String')) returns contents of severity_result as a double


% --- Executes during object creation, after setting all properties.
function severity_result_CreateFcn(hObject, eventdata, handles)
% hObject    handle to severity_result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in startButton.
function startButton_Callback(hObject, eventdata, handles)
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
%CLASSIFICATION
for i = i:length(HR)
       Status_panel = 'Running';
       if (SpO2(i)>95)
          Result_panel = 'Normal';YN_panel='No';
       elseif (SpO2(i)>=92 & SpO2(i)<=92 & HR<110)
          Result_panel = 'Mild/Moderate';YN_panel='Yes';
       elseif (SpO2(i)>=92 & SpO2(i)<=92 & HR>110)
          Result_panel = 'Acute';YN_panel='Yes';
       elseif (SpO2(i)<92)
          Result_panel = 'Life Threatening';YN_panel='Yes';
       end   
       disp(Status_panel);disp(Result_panel); 
end
set(handles.Status,'string',Status_panel)
set(handles.YN_results,'string',YN_panel)
set(handles.severity_result,'string',Result_panel)
axes(handles.SpO2_plot);
plot(SpO2,'b');hold on;

axes(handles.HR_plot);
plot(HR,'b');hold on;



function Status_Callback(hObject, eventdata, handles)
% hObject    handle to Status (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Status as text
%        str2double(get(hObject,'String')) returns contents of Status as a double


% --- Executes during object creation, after setting all properties.
function Status_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Status (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function YN_results_Callback(hObject, eventdata, handles)
% hObject    handle to YN_results (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of YN_results as text
%        str2double(get(hObject,'String')) returns contents of YN_results as a double


% --- Executes during object creation, after setting all properties.
function YN_results_CreateFcn(hObject, eventdata, handles)
% hObject    handle to YN_results (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function PEF_plot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PEF_plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate PEF_plot


% --- Executes during object creation, after setting all properties.
function SpO2_plot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SpO2_plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate SpO2_plot
