function varargout = homework2(varargin)
% HOMEWORK2 MATLAB code for homework2.fig
%      HOMEWORK2, by itself, creates a new HOMEWORK2 or raises the existing
%      singleton*.
%
%      H = HOMEWORK2 returns the handle to a new HOMEWORK2 or the handle to
%      the existing singleton*.
%
%      HOMEWORK2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HOMEWORK2.M with the given input arguments.
%
%      HOMEWORK2('Property','Value',...) creates a new HOMEWORK2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before homework2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to homework2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help homework2

% Last Modified by GUIDE v2.5 03-Nov-2020 19:25:51

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @homework2_OpeningFcn, ...
                   'gui_OutputFcn',  @homework2_OutputFcn, ...
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


% --- Executes just before homework2 is made visible.
function homework2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to homework2 (see VARARGIN)

% Choose default command line output for homework2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes homework2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = homework2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global t;
global y;
global T;
global current_func;
global phs_stat;
phs_stat = round(get(handles.slider3,'Value'));
current_func = 'sin';
T = 2*pi;
t = [-3*pi:0.001:3*pi];
y = sin(t+ ((10-phs_stat)*pi/9))/2;
axes(handles.axes1);
ax = gca;
cla reset;
plot(t,y);
ax.XLim = [-3*pi 3*pi];
ax.YLim = [-1 1];
grid on;
hold on;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global t;
global y;
global T;
global current_func;
global phs_stat;
phs_stat = round(get(handles.slider3,'Value'));
current_func = 'cos';
T = 2*pi;
t = [-3*pi:0.001:3*pi];
y = cos(t + (10-phs_stat)*pi/9)/2;
axes(handles.axes1);
ax = gca;
cla reset;
plot(t,y);
ax.XLim = [-3*pi 3*pi];
ax.YLim = [-1 1];
grid on;
hold on;

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global t;
global y;
global T;
global current_func;
current_func = 'tri';
global phs_stat;
phs_stat = round(get(handles.slider3,'Value'));
T = 2*pi;
t = [-4*pi+phs_stat*pi/9:0.001:5*pi-phs_stat*pi/9];
y = t;
counter = 1;
state = 0;
dx = 1 / (1000*pi);
for e=y
    if counter/1000 == round(1*pi,3) || counter/1000 == round(3*pi,3) || counter/1000 == round(5*pi,3) || counter/1000 == round(7*pi,3)
        state = 1;
    elseif counter/1000 == round(2*pi,3) || counter/1000 == round(4*pi,3) || counter/1000 == round(6*pi,3) || counter/1000 == round(8*pi,3)
        state = 0;
    end
    if state == 0
        if counter > 1
            y(counter) =  y(counter-1) + dx;
        else
            y(counter) = -0.5;
        end
    else
        y(counter) = y(counter-1) - dx;
    end
    counter = counter + 1;
end
axes(handles.axes1);
ax = gca;
cla reset;
plot(t,y);
ax.XLim = [-3*pi 3*pi];
ax.YLim = [-1 1];
grid on;
hold on;



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global t;
global y;
global T;
global current_func;
current_func = 'saw';
global phs_stat;
phs_stat = round(get(handles.slider3,'Value'));
T = 2*pi;
t = [-4*pi+phs_stat*pi/9:0.001:5*pi-phs_stat*pi/9];
y = t;
counter = 1;
dx = 1 / (1000*2*pi);
for e=y
    if counter/1000 == round(pi*2,3) || counter/1000 == round(pi*4,3) || counter/1000 == round(pi*6,3)|| counter/100 == round(pi*8,3)
        y(counter) = -0.5;
    elseif counter<2
        y(counter) = -0.5;
    else
        y(counter) = y(counter-1) + dx;
    end
    counter = counter + 1;
end
axes(handles.axes1);
ax = gca;
cla reset;
plot(t,y);
ax.XLim = [-3*pi 3*pi];
ax.YLim = [-1 1];
grid on;
hold on;


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global t;
global y;
global T;
global current_func;
current_func = 'rec';
global phs_stat;
phs_stat = round(get(handles.slider3,'Value'));
T = 2*pi;
t = [-4*pi+phs_stat*pi/9:0.001:5*pi-phs_stat*pi/9];
y = t;
counter = 1;
state = 0;
for e=y
    if counter/1000 == round(1*pi,3) || counter/1000 == round(3*pi,3) || counter/1000 == round(5*pi,3) || counter/1000 == round(7*pi,3)
        state = 1;
    elseif counter/1000 == round(2*pi,3) || counter/1000 == round(4*pi,3) || counter/1000 == round(6*pi,3) || counter/1000 == round(8*pi,3)
        state = 0;
    end
    if state == 0
        y(counter) = -0.5;
    else
        y(counter) = 0.5;
    end
    counter = counter + 1;
end
axes(handles.axes1);
ax = gca;
cla reset;
plot(t,y);
ax.XLim = [-3*pi 3*pi];
ax.YLim = [-1 1];
grid on;
hold on;


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global slider_pos;
global t;
global y;
global T;
global is_mag;
is_mag = get(handles.checkbox1,'Value');
slider_pos = round(get(handles.slider2, 'Value'));


for counter = 0:slider_pos
    Cx(counter+1) = find_Cx(t,counter,y,T);
end
Cx_axis = [0:length(Cx)-1];
cos_val = 2 * real(Cx);
sin_val = -2 * imag(Cx);
for counter=Cx_axis
    theta(counter+1) = atan(sin_val(counter+1)/-cos_val(counter+1));
end
Magn = cos_val./(cos(theta));
counter = 1;
for e=Magn
    if sign(e) == -1
        Magn(counter) = -Magn(counter);
        theta(counter) = -theta(counter);
    end
    counter = counter + 1;
end
draw_axes(handles,Magn,theta,cos_val,sin_val,Cx_axis);




% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function new = intgrl(t,data)
dt = t(2)-t(1);
new = [0:(length(t)-2)];
counter = 1;
for count = data
    if count ~= data(end)
        if counter>1
            new(counter) = dt*(data(counter)+ data(counter+1))/2 + new(counter-1);
            counter = counter + 1;
        else
            new(counter) = dt*(data(counter)+ data(counter+1))/2;
            counter = counter + 1;
        end
    end
end

function Cx = find_Cx(t,k,data,Period)
w0 = 2*pi/Period;
new = t;
j = sqrt(-1);
interval = t(2)-t(1);
counter = 1;
for count=t
    new(counter) = data(counter) * exp(-j*k*w0*count);
    counter = counter + 1;
end
new_intgrl = intgrl(t,new);
T_init = 1;
T_end = T_init + round(Period/interval);
Cx = (new_intgrl(T_end)-new_intgrl(T_init))/Period;

function draw_axes(handles,mag,phase,cos_val,sin_val,Cx_axis)
global is_mag;
global y;
global t;
if is_mag == 1
    axes(handles.axes2);
    ax = gca;
    stem(Cx_axis,mag,'filled','Color','red');
    ax.XLim = [-1 51];
    ax.YLim = [-1 1];
    grid on;
    title('Magnitude');
    axes(handles.axes3);
    ax = gca;
    stem(Cx_axis,phase,'filled','Color','red');
    ax.XLim = [-1 51];
    ax.YLim = [-2*pi 2*pi];
    grid on;
    title('Phase');
else
    axes(handles.axes2);
    ax = gca;
    stem(Cx_axis,sin_val,'filled','Color','red');
    ax.XLim = [-1 51];
    ax.YLim = [-1 1];
    grid on;
    title('Sin');
    axes(handles.axes3);
    ax = gca;
    stem(Cx_axis,cos_val,'filled','Color','red');
    ax.XLim = [-1 51];
    ax.YLim = [-1 1];
    grid on;
    title('Cos');
end
axes(handles.axes1);
cla reset;
ax = gca;
cla reset;
plot(t,y);
ax.XLim = [-3*pi 3*pi];
ax.YLim = [-1 1];
grid on;
hold on;
counter = 1;
fr = mag(1);
for e=sin_val
    if counter > 1
        new_cos = cos_val(counter)*cos(t*(counter-1));
        new_sin = sin_val(counter)*sin(t*(counter-1));
        fr = fr + new_cos+ new_sin;
    end
    counter = counter + 1;
end
if length(fr)>1
    plot(t,fr);
end
    

% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
global is_mag;
is_mag = get(handles.checkbox1,'Value');


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global y;
global t;
global phs_stat;
global current_func;
phs_stat = round(get(handles.slider3,'Value'));
if strcmp('sin',current_func)
    t = [-3*pi:0.001:3*pi];
    y = sin(t+ ((10-phs_stat)*pi/9))/2;
    axes(handles.axes1);
    ax = gca;
    cla reset;
    plot(t,y);
    ax.XLim = [-3*pi 3*pi];
    ax.YLim = [-1 01];
    grid on;
    hold on;
elseif strcmp('cos',current_func)
    t = [-3*pi:0.001:3*pi];
    y = cos(t+ ((10-phs_stat)*pi/9))/2;
    axes(handles.axes1);
    ax = gca;
    cla reset;
    plot(t,y);
    ax.XLim = [-3*pi 3*pi];
    ax.YLim = [-1 1];
    grid on;
    hold on;
elseif strcmp('tri',current_func)
    t = [-4*pi+phs_stat*pi/9:0.001:5*pi-phs_stat*pi/9];
    y = t;
    counter = 1;
    state = 0;
    dx = 1 / (1000*pi);
    for e=y
        if counter/1000 == round(1*pi,3) || counter/1000 == round(3*pi,3) || counter/1000 == round(5*pi,3) || counter/1000 == round(7*pi,3)
            state = 1;
        elseif counter/1000 == round(2*pi,3) || counter/1000 == round(4*pi,3) || counter/1000 == round(6*pi,3) || counter/1000 == round(8*pi,3)
            state = 0;
        end
        if state == 0
            if counter > 1
                y(counter) =  y(counter-1) + dx;
            else
                y(counter) = -0.5;
            end
        else
            y(counter) = y(counter-1) - dx;
        end
        counter = counter + 1;
    end
    axes(handles.axes1);
    ax = gca;
    cla reset;
    plot(t,y);
    ax.XLim = [-3*pi 3*pi];
    ax.YLim = [-1 1];
    grid on;
    hold on;
elseif strcmp('saw',current_func)
    t = [-4*pi+phs_stat*pi/9:0.001:5*pi-phs_stat*pi/9];
    y = t;
    counter = 1;
    dx = 1 / (1000*2*pi);
    for e=y
        if counter/1000 == round(pi*2,3) || counter/1000 == round(pi*4,3) || counter/1000 == round(pi*6,3)|| counter/100 == round(pi*8,3)
            y(counter) = -0.5;
        elseif counter<2
            y(counter) = -0.5;
        else
            y(counter) = y(counter-1) + dx;
        end
        counter = counter + 1;
    end
    axes(handles.axes1);
    ax = gca;
    cla reset;
    plot(t,y);
    ax.XLim = [-3*pi 3*pi];
    ax.YLim = [-1 1];
    grid on;
    hold on;
elseif strcmp('rec',current_func)
    t = [-4*pi+phs_stat*pi/9:0.001:5*pi-phs_stat*pi/9];
    y = t;
    counter = 1;
    state = 0;
    for e=y
        if counter/1000 == round(1*pi,3) || counter/1000 == round(3*pi,3) || counter/1000 == round(5*pi,3) || counter/1000 == round(7*pi,3)
            state = 1;
        elseif counter/1000 == round(2*pi,3) || counter/1000 == round(4*pi,3) || counter/1000 == round(6*pi,3) || counter/1000 == round(8*pi,3)
            state = 0;
        end
        if state == 0
            y(counter) = -0.5;
        else
            y(counter) = 0.5;
        end
        counter = counter + 1;
    end
    axes(handles.axes1);
    ax = gca;
    cla reset;
    plot(t,y);
    ax.XLim = [-3*pi 3*pi];
    ax.YLim = [-1 1];
    grid on;
    hold on;

end
   


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
