function h = plotcities(province, border, city)
% PLOTCITIES
% h = PLOTCITIES(province, border, city) draw the map of China, and return 
% the route handle.

global h;
% 绘制中国地图
plot(province.long, province.lat, 'color', [0.7,0.7,0.7])
hold on
plot(border.long  , border.lat  , 'color', [0.5,0.5,0.5], 'linewidth', 1.5);
 

% 绘制各省之间的连线，设置为无穷，因为我们并不知道它连线的长度
h = plot(NaN, NaN, 'b-', 'linewidth', 1);

% 以绿色的点来描绘需要计算的城市
plot([city(2:end).long], [city(2:end).lat], 'o', 'markersize', 3, ...
                              'MarkerEdgeColor','b','MarkerFaceColor','g');
% 以北京作为出发点
plot([city(1).long],[city(1).lat],'p','markersize',5, ...
                              'MarkerEdgeColor','r','MarkerFaceColor','g');
%控制坐标轴axis([XMIN XMAX YMIN YMAX ZMIN ZMAX]) 设置当前所绘图像的x轴、y轴和z轴的范围。
axis([70 140 15 55]);