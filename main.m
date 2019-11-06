
clear;clc;

load china; % 加载地图中各个城市的经度和纬度
plotcities(province, border, city); % 绘制中国地图

numberofcities = length(city);      % 城市的数量
%dis(i,j)指的是i和j之间的距离
dis = distancematrix(city);   


temperature = 1000;                 % 初始化温度
cooling_rate = 0.92;                % 冷却速率  0.8——0.99
iterations = 1;                     % 初始化初值

% 获取一个确定的随机数
rand('seed',0);                    

% 随机组合：numberofcities
route = randperm(numberofcities);
% 计算总路程
previous_distance = totaldistance(route,dis);

% 初始化温度迭代次数，当迭代温度达到100时，进行降温
temperature_iterations = 1;
% This is a flag used to plot the current route after 200 iterations
plot_iterations = 1;

% 绘制现在的路径
plotroute(city, route, previous_distance, temperature);

while 1.0 < temperature
    %随机生成相邻解
    temp_route = perturb(route,'reverse');
    % 计算相邻解的总路程
    current_distance = totaldistance(temp_route, dis);
    % 计算改变的路程差
    diff = current_distance - previous_distance;
    
    % diff < 0说明当前的路程比之前的更优，换
    %rand < exp(-diff/(temperature))  以一定概率选中此解
    if (diff < 0) || (rand < exp(-diff/(temperature)))
        route = temp_route;         %accept new route
        previous_distance = current_distance;
        
        % 更新温度和绘图、计数迭代次数
        temperature_iterations = temperature_iterations + 1;
        plot_iterations = plot_iterations + 1;
        iterations = iterations + 1;
    end
    
    % 当温度迭代次数达到100时，进行降温
    if temperature_iterations >= 100
       temperature = cooling_rate*temperature;
       temperature_iterations = 0;
    end
    
    %  当绘图迭代达到200次时，取当前最优解
    if plot_iterations >= 200
       plotroute(city, route, previous_distance,temperature);
       plot_iterations = 0;
    end
end

% 绘制当前最优解
plotroute(city, route, previous_distance,temperature);
