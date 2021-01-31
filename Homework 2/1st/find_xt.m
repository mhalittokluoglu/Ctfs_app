function xt = find_xt(xn,t,Order,Period)
j = sqrt(-1);
w0 = 2*pi/Period;
xt = 0;
counter = 1;
for n=[-Order:Order]
    xt = xt + xn(counter)*exp(j*w0*n*t);
    counter = counter + 1;
end
end





