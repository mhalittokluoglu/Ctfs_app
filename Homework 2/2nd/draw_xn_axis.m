function draw_xn_axis(handles)
global T;
global func1;
global order;
global xn;
xn = find_xn(func1,order,T);

xn_ax = [-((length(xn)-1)/2):(length(xn)-1)/2];

axes(handles.axes3);
stem(xn_ax,abs(xn),'filled','Color','black');
xlim([xn_ax(1)-1 xn_ax(end)+1]);
title('x[n] Magnitude');