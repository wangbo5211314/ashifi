function plotroute(city, route, current_distance, temperature)


global h;
cycle = route([1:end, 1]);%��·�߸�ֵ��cycle  ���磺1,2,3...34,1
%��ÿ�ֶ����ÿһ�����Թ涨��һ�����֣���Ϊ������
% set(�����������1������ֵ1��������2������ֵ2����)
set(h,'Xdata',[city(cycle).long],'Ydata',[city(cycle).lat]);%���Ƶ�ǰ

%������ڵ��¶Ⱥ�·��
xlabel(sprintf('T = %6.1f        Total Distance = %6.1f', ...
                    temperature,                  current_distance));
drawnow   %����δ�������ͼ��ʵʱ����ʾ����

