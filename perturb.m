function route = perturb(route_old, method)

%                        ___________            ___________         
%     1. reverse:   [1 2 3 4 5 6 7 8 9] -> [1 2 8 7 6 5 4 3 9]
%                        _         _            _         _
%     2. swap:      [1 2 3 4 5 6 7 8 9] -> [1 2 8 4 5 6 7 3 9]

route = route_old;
numbercities = length(route);
%rand�������ȡ��0-1
%ceil���������������ȡ��
city1 = ceil(numbercities*rand);
city2 = ceil(numbercities*rand);
switch method
    case 'reverse'
        citymin = min(city1,city2);
        citymax = max(city1,city2);
        route(citymin:citymax) = route(citymax:-1:citymin);
    case 'swap'
        route([city1, city2]) = route([city2, city1]);
end