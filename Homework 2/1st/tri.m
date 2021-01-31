function [t,y] = tri(Period)
inc = Period/5000;
t = [-1.5*Period:inc:1.5*Period];
y = t;
inr = Period*0.5/inc;
dt = 1/inr;
counter = 1;
state = 0;
for e=y
    if counter == round(inr*1) || counter == round(3*inr) || counter == round(5*inr)
        state = 1;
    elseif counter == round(2*inr) || counter == round(4*inr) || counter == round(6*inr)
        state = 0;
    end
    if state == 0
        if counter == 1
            y(counter) = 0;
        else
            y(counter) = y(counter-1) + dt;
        end
    else
        y(counter) = y(counter-1) - dt;
    end
    counter = counter + 1;
end
end