R=1;
X=300*pi/180;
ip=[0 0];
fp=[-3 -3];

ac= ip + [-R*cos(X) R*sin(X)];

V1=X+pi/2;
if V1>=2*pi
    V1=V1-2*pi;
end

vec=fp-ac;
V=(2*pi + pi/2 - atan2(vec(2), vec(1)));
if V >= 2*pi
    V = V - 2*pi;
end

phi=asin(R/norm(vec));

V2 = V - phi + pi/2;
if V2>=2*pi
    V2=V2-2*pi;
end


angD=V1-V2+2*pi;
if angD>=2*pi
    angD=angD-2*pi;
end

D=R*angD + (R/tan(phi));
