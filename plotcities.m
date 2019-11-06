function h = plotcities(province, border, city)
% PLOTCITIES
% h = PLOTCITIES(province, border, city) draw the map of China, and return 
% the route handle.

global h;
% �����й���ͼ
plot(province.long, province.lat, 'color', [0.7,0.7,0.7])
hold on
plot(border.long  , border.lat  , 'color', [0.5,0.5,0.5], 'linewidth', 1.5);
 

% ���Ƹ�ʡ֮������ߣ�����Ϊ�����Ϊ���ǲ���֪�������ߵĳ���
h = plot(NaN, NaN, 'b-', 'linewidth', 1);

% ����ɫ�ĵ��������Ҫ����ĳ���
plot([city(2:end).long], [city(2:end).lat], 'o', 'markersize', 3, ...
                              'MarkerEdgeColor','b','MarkerFaceColor','g');
% �Ա�����Ϊ������
plot([city(1).long],[city(1).lat],'p','markersize',5, ...
                              'MarkerEdgeColor','r','MarkerFaceColor','g');
%����������axis([XMIN XMAX YMIN YMAX ZMIN ZMAX]) ���õ�ǰ����ͼ���x�ᡢy���z��ķ�Χ��
axis([70 140 15 55]);