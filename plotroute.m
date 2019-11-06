function plotroute(city, route, current_distance, temperature)


global h;
cycle = route([1:end, 1]);%将路线赋值给cycle  例如：1,2,3...34,1
%给每种对象的每一个属性规定了一个名字，称为属性名
% set(句柄，属性名1，属性值1，属性名2，属性值2，…)
set(h,'Xdata',[city(cycle).long],'Ydata',[city(cycle).lat]);%绘制当前

%输出现在的温度和路程
xlabel(sprintf('T = %6.1f        Total Distance = %6.1f', ...
                    temperature,                  current_distance));
drawnow   %将还未处理完的图像实时的显示出来

