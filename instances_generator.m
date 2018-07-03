%Script to generate instances for the genetic algorithm tunning of the
%TERRA algorithm

% Instance Parameters
home = [0;0]; %Initial location of the UGV-UAV System
n = 16; %Number of target points
r = 4; %Farthest distance the UAV can travel in km
area = 50; %Area of the map
delta = 2; %Number of clusters
tries = 100; %Number of tries to build an instance
instances = 20; %Number of instances to generate

dir = 'trainInstances/'; %Directory where the instances are going to be saved.

%FORMAT filename = Instances/ n%_delta%_iteration
for i=1:instances
    [ xy ] = map_generator(home, n, r, area, delta, tries);
    filename = [dir 'n' int2str(n) '_d' int2str(delta) '_i' int2str(i)];
    save(filename)
end