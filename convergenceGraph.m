% Script to compute the convergence graph of the genetic algorithm
% 'tsp_ga_ugv.m'. The input are the set of parameters required by the
% genetic algorithm and the instances in 'trainInstances/'.

% Genetic Algorithm Parameters
numInstances = 50;
popSize = 200;
tournaments = 9;
mutOper = 2;
mutRate = 0.06;
crossOper = 1;
elite = 2.7;

totalHistory16 = [];
totalHistory64 = [];

for i=1:numInstances
     newInstance16 = ['trainInstances/n16_d2_i' int2str(i)];
     distHistory16 = tsp_ga_ugv(newInstance16, popSize,tournaments, mutOper,mutRate,crossOper, elite);
     totalHistory16 = [totalHistory16 distHistory16];
     
     newInstance64 = ['trainInstances64/n64_d2_i' int2str(i)];
     distHistory64 = tsp_ga_ugv(newInstance64, popSize,tournaments, mutOper,mutRate,crossOper, elite);
     totalHistory64 = [totalHistory64 distHistory64];
end

figure;
hold on
plot(totalHistory16(1,:),'--black','LineWidth',2);
plot(totalHistory16(2,:),'-black','LineWidth',2);
plot(totalHistory16(3,:),':black','LineWidth',2);

set(gca,'XLim',[1 100],'YLim',[0 1.1*max([1 totalHistory16(3,:)])]);
xlabel('Generation Number')
ylabel('Fitness Function Output (km)')


plot(totalHistory64(1,:),'--red','LineWidth',2);
plot(totalHistory64(2,:),'-red','LineWidth',2);
plot(totalHistory64(3,:),':red','LineWidth',2);
hold off

