function xn = find_xn(func,Order,Period)
j = sqrt(-1);
w0 = 2*pi/Period;
xn = [-Order:Order];
counter = 1;
for n=[-Order:Order]
    fx = @(x) (func(x)).*exp(-j*n*w0*x);
    xn(counter) = (1/Period)*integral(fx,0,1);
    counter = counter + 1;
end
end
