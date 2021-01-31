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
end


