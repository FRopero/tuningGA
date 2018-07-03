function [ xy ] = map_generator(home, n, r, area, delta, tries)
% This function creates a map ensuring that 'n' target points are distributed 
% 'delta' groups inside an specific radius 'r', around a map 
% with an specific area. 
% Mandatory: 'n' must be multiple of 'delta'

% INPUTS
% home = home point
% n = number of target points to generate
% r = radius of the target point in km
% area = the size of the environment in km2
% delta = number of groups

% OUTPUTS
% xy = coordinates of the target points

% Example:
% n = 12
% r = 3
% area = 50 km2
% delta = 2
% Solution: This algorithm will create 2 groups of 6 target points inside a
% r = 3 km of radius in a 50km2 area

groups = [];
xy = [];
theta = linspace(0,2*pi);
finish = false;

if (n>0)
    if (area>0)
        if (delta>0)
            groups_number = n / delta;
            rng('shuffle','twister');
            
            while (groups_number > 0 && ~finish)
                cond = false;
                it = 0;
                %First, ensure that the distance between g and other groups is
                %higher than 4*r
                while (~cond)
                    cond = true;
                    g = [(area*rand(1,1));(area*rand(1,1))];
                    [~,c] = size(groups);
                    for i=1:c
                        d = sqrt( ((groups(1,i)-g(1,1))^2) + ((groups(2,i)-g(2,1))^2) );
                        if (d <= 4*r)
                            cond = false;
                        end
                    end
                    d = sqrt( ((home(1,1)-g(1,1))^2) + ((home(2,1)-g(2,1))^2) );
                    if (d <= 4*r)
                        cond = false;
                    end
                    if (it>100) %Tries per group
                        if (tries>0)
                            [ xy ] = map_generator(home, n, r, area, delta, tries-1);
                        end
                        finish = true;
                        break
                    end 
                   it = it + 1;
                end
                if (~finish)
                    groups = [groups g];
                    %Third, generate 'delta' target points for the group 'g'
                    max_x = g(1)+r;
                    min_x = g(1)-r;
                    max_y = g(2)+r;
                    min_y = g(2)-r;
                    tmp = delta;
                    while (tmp > 0)
                        p = [(max_x-min_x)*rand(1,1)+min_x;(max_y-min_y)*rand(1,1)+min_y];                    
                        d = sqrt( ((g(1,1)-p(1,1))^2) + ((g(2,1)-p(2,1))^2) );
                        if (d <= r)
                            xy = [xy p];
                            tmp = tmp - 1;
                        end
                    end

                    groups_number = groups_number - 1;
                end
            end
        else
            disp('delta must be > 0')
        end
    else
       disp('area must be > 0') 
    end
else
   disp('n must be > 0') 
end

%Round to 3 decimals
f = 10.^3;
xy = round(f*xy)/f;


end

