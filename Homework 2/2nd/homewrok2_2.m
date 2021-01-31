function varargout = homewrok2_2(varargin)
% HOMEWROK2_2 MATLAB code for homewrok2_2.fig
%      HOMEWROK2_2, by itself, creates a new HOMEWROK2_2 or raises the existing
%      singleton*.
%
%      H = HOMEWROK2_2 returns the handle to a new HOMEWROK2_2 or the handle to
%      the existing singleton*.
%
%      HOMEWROK2_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HOMEWROK2_2.M with the given input arguments.
%
%      HOMEWROK2_2('Property','Value',...) creates a new HOMEWROK2_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before homewrok2_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to homewrok2_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help homewrok2_2

% Last Modified by GUIDE v2.5 06-Nov-2020 10:27:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @homewrok2_2_OpeningFcn, ...
                   'gui_OutputFcn',  @homewrok2_2_OutputFcn, ...
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


% --- Executes just before homewrok2_2 is made visible.
function homewrok2_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to homewrok2_2 (see VARARGIN)

global func1;
global increment;
global t;
global y;
global T;
global dsply_original;
dsply_original = 0;
T = 1;
func1 = @(x)  -(x.^3)/3 + (x.^2)/2 -3*x/16 + 1;

increment = 0.0001;
t = [0:increment:1];
y = func1(t);
axes(handles.axes1);
plot(t,y);
title('Original Function');



% Choose default command line output for homewrok2_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes homewrok2_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = homewrok2_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in second_order_button.
function second_order_button_Callback(hObject, eventdata, handles)
% hObject    handle to second_order_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global order;
order = 2;
set(handles.order_slider,'Value',order);
set(handles.order_text,'String','Order = ' + string(order));
draw_xn_axis(handles)
draw_axis(handles)


% --- Executes on button press in nineth_order_button.
function nineth_order_button_Callback(hObject, eventdata, handles)
% hObject    handle to nineth_order_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global order;
order = 9;
set(handles.order_slider,'Value',order);
set(handles.order_text,'String','Order = ' + string(order));
draw_xn_axis(handles)
draw_axis(handles)


% --- Executes on slider movement.
function order_slider_Callback(hObject, eventdata, handles)
% hObject    handle to order_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global order;
order = round(get(hObject,'Value'));
set(hObject,'Value',order);
set(handles.order_text,'String','Order = ' + string(order));
draw_xn_axis(handles)
draw_axis(handles)


% --- Executes during object creation, after setting all properties.
function order_slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to order_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in dsply_original_checkbox.
function dsply_original_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to dsply_original_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of dsply_original_checkbox
global dsply_original;
dsply_original = get(hObject,'Value');
draw_axis(handles);