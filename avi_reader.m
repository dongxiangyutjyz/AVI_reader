function varargout = avi_reader(varargin)
% AVI_READER MATLAB code for avi_reader.fig
%      AVI_READER, by itself, creates a new AVI_READER or raises the existing
%      singleton*.
%
%      H = AVI_READER returns the handle to a new AVI_READER or the handle to
%      the existing singleton*.
%
%      AVI_READER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AVI_READER.M with the given input arguments.
%
%      AVI_READER('Property','Value',...) creates a new AVI_READER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before avi_reader_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to avi_reader_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help avi_reader

% Last Modified by GUIDE v2.5 08-Jul-2017 10:33:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @avi_reader_OpeningFcn, ...
                   'gui_OutputFcn',  @avi_reader_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
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


% --- Executes just before avi_reader is made visible.
function avi_reader_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to avi_reader (see VARARGIN)

% Choose default command line output for avi_reader
global change;
global fieldname;
global len;
global pauselen;
pauselen = 1/200;
fieldname = [];
change = [];
len = 0;
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
%set(gcf,'position',get(0,'ScreenSize'));
% UIWAIT makes avi_reader wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = avi_reader_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function frame_no_Callback(hObject, eventdata, handles)
% hObject    handle to frame_no (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global f_no;
global avi;

f_no = str2num(get(hObject,'String'));
% persent = f_no/avi.NumberOfFrames;
% set(handles.slider1,'position',persent);
%guidata(hObject, handles);
set(handles.text_f_no,'String',num2str(f_no));
frame = read(avi,f_no);
imshow(frame);
% Hints: get(hObject,'String') returns contents of frame_no as text
%        str2double(get(hObject,'String')) returns contents of frame_no as a double


% --- Executes during object creation, after setting all properties.
function frame_no_CreateFcn(hObject, eventdata, handles)
% hObject    handle to frame_no (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global avi;
global f_no;
persent = get(hObject,'Value');

f_no = int32(avi.NumberOfFrames * persent);
if(f_no == 0)
    f_no =1;
end
set(handles.text_f_no,'String',num2str(f_no));
frame = read(avi,f_no);
imshow(frame);
% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% global avi;
% hObject.Min= 1;
% hObject.Max = 50;
% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on button press in pre_frame.
function pre_frame_Callback(hObject, eventdata, handles)
global avi;
global f_no;
if(f_no>1)
    f_no = f_no - 1;
end
%persent = f_no/avi.NumberOfFrames;
%set(handles.slider1,'Position',persent);
set(handles.text_f_no,'String',num2str(f_no));
frame = read(avi,f_no);
imshow(frame);
% hObject    handle to pre_frame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in next_frame.
function next_frame_Callback(hObject, eventdata, handles)
global avi;
global f_no;
%global a;
if(f_no<avi.NumberOfFrames)
    f_no = f_no + 1;
end
set(handles.text_f_no,'String',num2str(f_no));
%persent = f_no/avi.NumberOfFrames;

frame = read(avi,f_no);
imshow(frame);
% a=0:0.1:5;
% y=a.^2;
% plot(a,y);

% hObject    handle to next_frame (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in set_data.

% hObject    handle to set_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in open_avi.
function open_avi_Callback(hObject, eventdata, handles)
global avi;
global f_no;
f_no = 1;
[filename, pathname] = ...
     uigetfile({'*.avi';'*.*'},'????????????');
 pathname
avi = VideoReader([pathname filename]);
set(handles.text_f_no,'String',num2str(f_no));
frame = read(avi,f_no);
imshow(frame);
% hObject    handle to open_avi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Play.
function Play_Callback(hObject, eventdata, handles)
global isplay;
global avi;
global f_no;
global pauselen;
isplay = 1;
while(isplay > 0)
    if(f_no<= avi.NumberOfFrames)
        frame = read(avi,f_no);
        imshow(frame);
        set(handles.text_f_no,'String',num2str(f_no));
        pause(pauselen);
        if(f_no<avi.NumberOfFrames)
            f_no = f_no + 1;
        else
            isplay=0;
            break;
        end
        
    else
        isplay=0;
        break;
    end
end
% hObject    handle to Play (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Pause.
function Pause_Callback(hObject, eventdata, handles)
global isplay;
isplay = 0;
% hObject    handle to Pause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when figure1 is resized.
function figure1_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function Target_Box_Callback(hObject, eventdata, handles)
% hObject    handle to Target_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Target_Box as text
%        str2double(get(hObject,'String')) returns contents of Target_Box as a double


% --- Executes during object creation, after setting all properties.
function Target_Box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Target_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Ideal_Box_Callback(hObject, eventdata, handles)
% hObject    handle to Ideal_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Ideal_Box as text
%        str2double(get(hObject,'String')) returns contents of Ideal_Box as a double


% --- Executes during object creation, after setting all properties.
function Ideal_Box_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Ideal_Box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Change_Button.
function Change_Button_Callback(hObject, eventdata, handles)
% hObject    handle to Change_Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filename;
global change;
global fieldname;
tag = load(filename);

for j = 1:length(fieldname)
    for i = 1:length(tag.Com)
        if fieldname(j) == tag.Com(i)
            tag.Com(i) = change(j);
        end
    end
end

Com = tag.Com;
save('Com.mat','Com');


% --- Executes on button press in open_mat.
function open_mat_Callback(hObject, eventdata, handles)
% hObject    handle to open_mat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filename;
[filename, pathname] = ...
     uigetfile({'*.mat';'*.*'},'????????????');
 pathname


% --- Executes on button press in RAM.
function RAM_Callback(hObject, eventdata, handles)
% hObject    handle to RAM (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global change;
global fieldname;
global len;
fieldname(len+1) = str2double(handles.Target_Box.String);
change(len+1) = str2double(handles.Ideal_Box.String);
len = len + 1;

% --- Executes on button press in Back.
function Back_Callback(hObject, eventdata, handles)
% hObject    handle to Back (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global fieldname;
global change;
global len;
fieldname(length(fieldname)) = [];
change(length(change)) = [];
len = len - 1;


% --- Executes on button press in new_video.
function new_video_Callback(hObject, eventdata, handles)
% hObject    handle to new_video (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('Com');
load('pool');
load('pool_z');
Gen_com(handles);


% --- Executes on button press in fast.
function fast_Callback(hObject, eventdata, handles)
% hObject    handle to fast (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pauselen;
pauselen = 1/600;

% --- Executes on button press in normal.
function normal_Callback(hObject, eventdata, handles)
% hObject    handle to normal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pauselen;
pauselen = 1/200;

% --- Executes on button press in slow.
function slow_Callback(hObject, eventdata, handles)
% hObject    handle to slow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pauselen;
pauselen = 1/10;
