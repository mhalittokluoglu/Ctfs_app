function varargout = homework2_1(varargin)
% HOMEWORK2_1 MATLAB code for homework2_1.fig
%      HOMEWORK2_1, by itself, creates a new HOMEWORK2_1 or raises the existing
%      singleton*.
%
%      H = HOMEWORK2_1 returns the handle to a new HOMEWORK2_1 or the handle to
%      the existing singleton*.
%
%      HOMEWORK2_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HOMEWORK2_1.M with the given input arguments.
%
%      HOMEWORK2_1('Property','Value',...) creates a new HOMEWORK2_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before homework2_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to homework2_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help homework2_1

% Last Modified by GUIDE v2.5 06-Nov-2020 10:38:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @homework2_1_OpeningFcn, ...
                   'gui_OutputFcn',  @homework2_1_OutputFcn, ...
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


% --- Executes just before homework2_1 is made visible.
function homework2_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to homework2_1 (see VARARGIN)

% Choose default command line output for homework2_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes homework2_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global dsply_original;
global order;
dsply_original = 0;
order = 2;
set(handles.order_slider,'Value',order);
set(handles.order_text,'String','Order = '+string(order));


% --- Outputs from this function are returned to the command line.
function varargout = homework2_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in square_button.
function square_button_Callback(hObject, eventdata, handles)
% hObject    handle to square_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global order;
global fnc;
fnc = 'rect';
draw_first_axis(handles);
set(handles.order_text,'String','Order = '+ string(order));
draw_xn(handles);
draw_xt(handles);



% --- Executes on button press in tri_button.
function tri_button_Callback(hObject, eventdata, handles)
% hObject    handle to tri_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global order;
global fnc;
fnc = 'tri';
draw_first_axis(handles);
set(handles.order_text,'String','Order = '+ string(order));
draw_xn(handles);
draw_xt(handles);



function period_edit_Callback(hObject, eventdata, handles)
% hObject    handle to period_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of period_edit as text
%        str2double(get(hObject,'String')) returns contents of period_edit as a double
global order;
global fnc;
if(strcmp(get(gcf,'currentkey'),'return'))
    if strcmp(fnc,'rect')
        fnc = 'rect';
    else
        fnc = 'tri';
    end
    draw_first_axis(handles);
    set(handles.order_text,'String','Order = '+ string(order));
    draw_xn(handles);
    draw_xt(handles);
end


% --- Executes during object creation, after setting all properties.
function period_edit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to period_edit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in scnd_order_button.
function scnd_order_button_Callback(hObject, eventdata, handles)
% hObject    handle to scnd_order_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global order;
set(handles.order_slider,'Value',2);
order = 2;
set(handles.order_text,'String','Order = '+ string(order));
draw_xn(handles);
draw_xt(handles);


% --- Executes on button press in nineth_order_button.
function nineth_order_button_Callback(hObject, eventdata, handles)
% hObject    handle to nineth_order_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global order;
set(handles.order_slider,'Value',9);
order = 9;
set(handles.order_text,'String','Order = '+ string(order));
draw_xn(handles);
draw_xt(handles);


% --- Executes on slider movement.
function order_slider_Callback(hObject, eventdata, handles)
% hObject    handle to order_slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global order;
order = round(get(hObject,'Value'));
set(handles.order_text,'String','Order = '+ string(order));
set(hObject,'Value',order);
draw_xn(handles);
draw_xt(handles);



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
global dsply_original
dsply_original = get(hObject,'Value');
draw_xt(handles);