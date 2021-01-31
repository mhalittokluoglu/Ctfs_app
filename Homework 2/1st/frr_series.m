function r = frr_series(t,y,Order,Period)

r = [-Order,Order];
counter = 1;
for element = [-Order:Order]
    r(counter) = find_fourier_coef(t,y,element,Period);
    counter = counter + 1;
end