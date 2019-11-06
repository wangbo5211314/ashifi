
clear;clc;

load china; % ���ص�ͼ�и������еľ��Ⱥ�γ��
plotcities(province, border, city); % �����й���ͼ

numberofcities = length(city);      % ���е�����
%dis(i,j)ָ����i��j֮��ľ���
dis = distancematrix(city);   


temperature = 1000;                 % ��ʼ���¶�
cooling_rate = 0.92;                % ��ȴ����  0.8����0.99
iterations = 1;                     % ��ʼ����ֵ

% ��ȡһ��ȷ���������
rand('seed',0);                    

% �����ϣ�numberofcities
route = randperm(numberofcities);
% ������·��
previous_distance = totaldistance(route,dis);

% ��ʼ���¶ȵ����������������¶ȴﵽ100ʱ�����н���
temperature_iterations = 1;
% This is a flag used to plot the current route after 200 iterations
plot_iterations = 1;

% �������ڵ�·��
plotroute(city, route, previous_distance, temperature);

while 1.0 < temperature
    %����������ڽ�
    temp_route = perturb(route,'reverse');
    % �������ڽ����·��
    current_distance = totaldistance(temp_route, dis);
    % ����ı��·�̲�
    diff = current_distance - previous_distance;
    
    % diff < 0˵����ǰ��·�̱�֮ǰ�ĸ��ţ���
    %rand < exp(-diff/(temperature))  ��һ������ѡ�д˽�
    if (diff < 0) || (rand < exp(-diff/(temperature)))
        route = temp_route;         %accept new route
        previous_distance = current_distance;
        
        % �����¶Ⱥͻ�ͼ��������������
        temperature_iterations = temperature_iterations + 1;
        plot_iterations = plot_iterations + 1;
        iterations = iterations + 1;
    end
    
    % ���¶ȵ��������ﵽ100ʱ�����н���
    if temperature_iterations >= 100
       temperature = cooling_rate*temperature;
       temperature_iterations = 0;
    end
    
    %  ����ͼ�����ﵽ200��ʱ��ȡ��ǰ���Ž�
    if plot_iterations >= 200
       plotroute(city, route, previous_distance,temperature);
       plot_iterations = 0;
    end
end

% ���Ƶ�ǰ���Ž�
plotroute(city, route, previous_distance,temperature);
