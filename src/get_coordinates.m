function [coord_x,coord_y] = get_coordinates(radius)


theta=2*pi*rand;

    


coord_x = rand*radius*cos(theta);
coord_y = rand*radius*sin(theta);

end


