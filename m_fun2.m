function [Y, clutch] = fcn(en, t_start, t_current, current_gear_num)

clutch = 0;
Y = zeros(4,1);


if en == 1
    
    if (t_current > t_start) && (t_current <= t_start + 0.5)
        clutch = 120;
        if current_gear_num > 0
            Y(current_gear_num) = -200;
        end
        return;
%         Y(current_gear_num + 1) = 200;
    end 
    
    if (t_current > t_start + 0.5) && (t_current < t_start + 1)
        clutch = 120;
        if current_gear_num > 0
            Y(current_gear_num) = -200;
        end
        Y(current_gear_num + 1) = 200;
        return;
    end 

    if (t_current > t_start + 1) && (t_current < t_start + 1.5)
        clutch = 120;
        Y(current_gear_num + 1) = 200;
        return;
    end
    if (t_current >= t_start + 1.5) && (t_current < t_start + 1.5 + 0.5)
        clutch = 120 - ((t_current - (t_start + 1.5) )*120 / 0.5);
        return;

    end
    
    
end

