fp=[-1 0];
X=315*pi/180;
r=fp;
rh=(2*pi + pi/2 - atan2(r(2), r(1)));
if rh >= 2*pi
    rh = rh - 2*pi;
end

turn=rh-X+2*pi;
if turn >= 2*pi
    turn = turn - 2*pi;
end

if turn < pi
    flag=1; %clockwise
else
    flag=2;  %anti-clockwise
end
