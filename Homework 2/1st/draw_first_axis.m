function draw_first_axis(handles)
global T;
global y;
global t;
global fnc;
T = str2num(get(handles.period_edit,'String'));
axes(handles.axes1);
if(strcmp(fnc,'tri'))
    [t,y] = tri(T);
    plot(t,y);
    title('Triangle Wave');
elseif(strcmp(fnc,'rect'))
    [t,y] = rect(T);
    plot(t,y);
    title('Square Wave');
end
xlim([-1.5*T 1.5*T]);
ylim([-0.5 1.5]);