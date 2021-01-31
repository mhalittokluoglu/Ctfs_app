function draw_axis(handles)
global t;
global y;
global T;
global func1;
global order;
global xn;
global xt;
global dsply_original;
xn = find_xn(func1,order,T);
xt = find_xt(xn,order,t,T);

axes(handles.axes2);
if dsply_original
    cla;
    plot(t,y);
    hold on;
    plot(t,real(xt));
    legend('Original',string(order)+' Approximation');
else
    cla;
    plot(t,real(xt));
    legend(string(order)+' Approximation');
end
title(string(order) + ' Approximation');