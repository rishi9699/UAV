radius=1;
initial_heading=45*pi/180;
initial_pos=[0 0];
final_pos=[5 5];

[direction, final_heading, angular_dist, total_dist] = dubins(initial_pos, final_pos, initial_heading, radius);