function [direction, Xf, angD, D]= dubins(ip, fp, Xi, R)
fp=fp-ip; %coordinate transforamtion
r_h=(2*pi + pi/2 - atan2(fp(2), fp(1))); %header of the displacement vector
if r_h >= 2*pi
    r_h = r_h - 2*pi;
end

turn=r_h-Xi+2*pi;
if turn >= 2*pi
    turn = turn - 2*pi;
end

if turn < pi
    direction=1; %clockwise
else
    direction=2;  %anti-clockwise
end

switch direction  %determining the direction of circle
    case 1
        cc= ip + [R*cos(Xi) -R*sin(Xi)]; %center of the circle

        V1=Xi-pi/2 + 2*pi; %initial angular pos on the circle
        if V1>=2*pi
            V1=V1-2*pi;
        end

        vec=fp-cc;
        V=(2*pi + pi/2 - atan2(vec(2), vec(1)));
        if V >= 2*pi
            V = V - 2*pi;
        end

        phi=asin(R/norm(vec));
        
        Xf=V+phi;  %final heading angle
        if Xf>=2*pi
            Xf=Xf-2*pi;
        end

        V2 = V + phi - pi/2;  %final angular position on the cirle
        if V2>=2*pi
            V2=V2-2*pi;
        end
        
        angD=V2-V1+2*pi; %angular distance traversed on the circle
        if angD>=2*pi
            angD=angD-2*pi;
        end
        
    case 2
        ac= ip + [-R*cos(Xi) R*sin(Xi)];

        V1=Xi+pi/2;
        if V1>=2*pi
            V1=V1-2*pi;
        end

        vec=fp-ac;
        V=(2*pi + pi/2 - atan2(vec(2), vec(1)));
        if V >= 2*pi
            V = V - 2*pi;
        end

        phi=asin(R/norm(vec));
        
        Xf=V-phi+2*pi;
        if Xf>=2*pi
            Xf=Xf-2*pi;
        end

        V2 = V - phi + pi/2;
        if V2>=2*pi
            V2=V2-2*pi;
        end
        
        angD=V1-V2+2*pi;
        if angD>=2*pi
            angD=angD-2*pi;
        end
        
end

D=R*angD + (R/tan(phi));  %total distance travelled
end