function frr = find_fourier_coef(t,y,n,Period)
w0 = 2*pi/Period;
new = t;
j = sqrt(-1);
interval = t(2)-t(1);
counter = 1;
for count=t
    new(counter) = y(counter) * exp(-j*n*w0*count);
    counter = counter + 1;
end
new_intgrl = intgrl(t,new);
T_init = 1;
T_end = T_init + round(Period/interval);
frr = (new_intgrl(T_end)-new_intgrl(T_init))/Period;
end


