function [t, y] = rect(Period)
inc = Period / 5000;
t = [-1.5*Period:inc:1.5*Period];
y = t;
inr = Period*0.25/inc;
counter = 1;
state = 0;
for e=y
    if counter == round(inr*1) || counter == round(5*inr) || counter == round(9*inr)
        state = 1;
    elseif counter == round(3*inr) || counter == round(7*inr) || counter == round(11*inr)
        state = 0;
    end
    if state == 0
        y(counter) = 0;
    else
        y(counter) = 1;
    end
    counter = counter + 1;
end
end