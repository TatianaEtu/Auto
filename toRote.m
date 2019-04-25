function [y4,y3,y2,y1, clutch, gas] = fcn(u1, u2, it, TClutch, TGas, TSynchron)

clutch = 0.0;
gas = 0.0;
y1 = 0;
y2 = 0;
y3 = 0;
y4 = 0;

if(u1 < 1000)  % I
    if (it < 0.3)
        clutch = 0;
        gas = 0.0;
        y1 = 0;
        y2 = 0;
        y3 = 0;
        y4 = 0;
    else    
        clutch = 120;
        gas = 0.0;
        y1 = 200;
        y2 = 0;
        y3 = 0;
        y4 = 0;
    end
        return;
end

if(u1 > 900 && u1 < 1200)  % GAS
    gas = 0.75;
end

if(u1 > 1200 && u1 < 1400)  % -I
    gas = 0;
    y1 = -200;
    y3 = 0;
    y4 = 0;
end
 
if(u1 > 1300 && u1 < 1600)  % II
    clutch = 120;
    gas = 0.0;
    y2 = 200;
    y3 = 0;
    y4 = 0;
    return;
end

if(u1 > 1500 && u1 < 1800)  % GAS
    gas = 0.65;
end

if(u1 > 1800 && u1 < 2100)  % -II
    gas = 0;
    y2 = -200;
    y1 = 0;
    y4 = 0;
end

if(u1 > 2000 && u1 < 2600)  % III
    clutch = 120;
    gas = 0.0;
    y3 = 200;
    y1 = 0;
    y4 = 0;
    return;
end

if(u1 > 2550 && u1 < 2800)  % GAS
    if(u2 < 0.05)
        gas = 0.65;
    end
end