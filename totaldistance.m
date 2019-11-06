function d = totaldistance(route, dis)


d = dis(route(end),route(1)); % 返回路径，第一个城市与最后一个城市的距离route(34)-route(1)
%计算route（1）-route（2），route（2）-route（3）...route（33）-route(34)
for k = 1:length(route)-1
    i = route(k);
    j = route(k+1);
    d = d + dis(i,j);
end