function draw_xn(handles)
global xn;
global T;
global order;
global t;
global y;
xn = frr_series(t,y,order,T);
xn_axis = [-((length(xn)-1)/2):((length(xn)-1)/2)];

axes(handles.axes2);
stem(xn_axis,abs(xn),'filled');
xlim([xn_axis(1)-1 xn_axis(end)+1]);
title('x[n] Magnitude');


axes(handles.axes3);
stem(xn_axis,angle(xn),'filled');
xlim([xn_axis(1)-1 xn_axis(end)+1]);
title('x[n] Phase');