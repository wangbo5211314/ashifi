function d = totaldistance(route, dis)


d = dis(route(end),route(1)); % ����·������һ�����������һ�����еľ���route(34)-route(1)
%����route��1��-route��2����route��2��-route��3��...route��33��-route(34)
for k = 1:length(route)-1
    i = route(k);
    j = route(k+1);
    d = d + dis(i,j);
end