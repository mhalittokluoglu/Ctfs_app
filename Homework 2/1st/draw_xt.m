function draw_xt(handles)
global xt;
global xn;
global t;
global y;
global T;
global order;
global dsply_original;

xt = find_xt(xn,t,order,T);
axes(handles.axes4);

if dsply_original
    cla;
    plot(t,y);
    hold on;
    plot(t,real(xt));
    xlim([-1.5*T 1.5*T]);
    ylim([-0.5 1.5]);
    legend('Original',string(order)+' Approximation');
else
    cla;
    plot(t,real(xt));
    xlim([-1.5*T 1.5*T]);
    ylim([-0.5 1.5]);
    legend(string(order)+' Approximation');
end
