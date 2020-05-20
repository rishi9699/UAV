function [direction, final_heading, angular_dist, total_dist] = dubins(initial_pos, final_pos, initial_heading, radius)

displacement = final_pos - initial_pos;
disp_header = (2*pi + pi/2 - atan2(displacement(2), displacement(1))); %header of the displacement vector

if disp_header >= 2*pi
    disp_header = disp_header - 2*pi;
end

displacement_angle = disp_header - initial_heading + 2*pi;
if displacement_angle >= 2*pi
    displacement_angle = displacement_angle - 2*pi;
end

if displacement_angle < pi
    direction="clockwise"; %clockwise
else
    direction="anti-clockwise";  %anti-clockwise
end

switch direction
    case "clockwise" %clockwise
        circle_center = initial_pos + [radius*cos(initial_heading), -radius*sin(initial_heading)];

        angularPos1 = initial_heading - pi/2 + 2*pi; %initial angular pos on the circle measured from north
        if angularPos1 >= 2*pi
            angularPos1 = angularPos1 - 2*pi;
        end

        circlecenterTofinalPos = displacement - circle_center;
        heading_circlecenterTofinalPos = (2*pi + pi/2 - atan2(circlecenterTofinalPos(2), circlecenterTofinalPos(1)));
        if heading_circlecenterTofinalPos >= 2*pi
            heading_circlecenterTofinalPos = heading_circlecenterTofinalPos - 2*pi;
        end

        phi = asin(radius/norm(circlecenterTofinalPos)); %phi is the angle between displacement and circlecenterTofinalPos
        
        final_heading = heading_circlecenterTofinalPos + phi;
        if final_heading >= 2*pi
            final_heading = final_heading - 2*pi;
        end

        angularPos2 = heading_circlecenterTofinalPos + phi - pi/2;  %final angular position on the cirle measured from north
        if angularPos2 >= 2*pi
            angularPos2 = angularPos2 - 2*pi;
        end
        
        angular_dist = angularPos2 - angularPos1 + 2*pi;
        if angular_dist >= 2*pi
            angular_dist = angular_dist - 2*pi;
        end
        
    case "anti-clockwise" %anti-clockwise
        circle_center = initial_pos + [-radius * cos(initial_heading), radius * sin(initial_heading)];

        angularPos1 = initial_heading + pi/2;
        if angularPos1 >= 2*pi
            angularPos1 = angularPos1 - 2*pi;
        end

        circlecenterTofinalPos = displacement - circle_center;
        heading_circlecenterTofinalPos = (2*pi + pi/2 - atan2(circlecenterTofinalPos(2), circlecenterTofinalPos(1)));
        if heading_circlecenterTofinalPos >= 2*pi
            heading_circlecenterTofinalPos = heading_circlecenterTofinalPos - 2*pi;
        end

        phi = asin(radius/norm(circlecenterTofinalPos));
        
        final_heading = heading_circlecenterTofinalPos - phi + 2*pi;
        if final_heading >= 2*pi
            final_heading = final_heading - 2*pi;
        end

        angularPos2 = heading_circlecenterTofinalPos - phi + pi/2;
        if angularPos2 >= 2*pi
            angularPos2 = angularPos2 - 2*pi;
        end
        
        angular_dist = angularPos1 - angularPos2 + 2*pi;
        if angular_dist >= 2*pi
            angular_dist = angular_dist - 2*pi;
        end
        
end

total_dist = radius * angular_dist + (radius/tan(phi));
disp("The direction is "+direction+" with the final heading as "+final_heading*180/pi+" degree and angular distance traveled is "+angular_dist*180/pi +" degree");
end