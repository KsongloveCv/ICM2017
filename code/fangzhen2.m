function cnt = fangzhen(people_bonus,driver_bonus)
if nargin < 2
    q1 = 0 ; q2 = 0;
else
    q1 = driver_bonus;q2 = people_bonus;
end
car_pos1 = rand(20,1);
car_pos1 = [ones(20,1).*2000,car_pos1.*6000];
car_pos2 = rand(20,1);
car_pos2 = [ones(20,1).*4000,car_pos2.*6000];
car_pos3 = rand(20,1);
car_pos3 = [car_pos3.*6000,ones(20,1).*2000];
car_pos4 = rand(20,1);
car_pos4 = [car_pos4.*6000,ones(20,1).*4000];
car_pos = [[car_pos1;car_pos2;car_pos3;car_pos4;],ones(80,1)];
car_pos_t = car_pos;
car_pos1 = rand(25,1);
car_pos1 = [ones(25,1).*2000,car_pos1.*6000];
car_pos2 = rand(25,1);
car_pos2 = [ones(25,1).*4000,car_pos2.*6000];
car_pos3 = rand(25,1);
car_pos3 = [car_pos3.*6000,ones(25,1).*2000];
car_pos4 = rand(25,1);
car_pos4 = [car_pos4.*6000,ones(25,1).*4000];
p_pos = [[car_pos1;car_pos2;car_pos3;car_pos4;],ones(100,1)];
p_pos_t = p_pos;
figure(1)
hold on
d = 200;cnt = 0;
for i = 1:80
    nowbest = [d,0];
    for j = 1:100
        if p_pos(j,3)==0 
            continue;
        end
        delta = abs(car_pos(i,1)-p_pos(j,1)) + abs(car_pos(i,2)-p_pos(j,2));
        if delta < nowbest(1)
            nowbest(2) = j;
            nowbest(1) = delta;
        end
    end
    if nowbest(1) < d && nowbest(2) > 0
        cnt = cnt + 1;
        p_pos(nowbest(2),3) = 0;
    end
end
cnt % Ã»ÓÐ²¹Ìù
t_p_pos = p_pos;
hold on
p_pos = p_pos_t;
car_pos = car_pos_t;
d = 310;cnt = 0;
for i = 1:80
    nowbest = [d,0];
    for j = 1:100
        if p_pos(j,3)==0 
            continue;
        end
        delta = abs(car_pos(i,1)-p_pos(j,1)) + abs(car_pos(i,2)-p_pos(j,2));
        if delta < nowbest(1)
            nowbest(2) = j;
            nowbest(1) = delta;
        end
    end
    if nowbest(1) < d && nowbest(2) > 0
        cnt = cnt + 1;
        p_pos(nowbest(2),3) = 0;
    end
end
for i = 1:100
    if t_p_pos(i,3)==0
        plot(t_p_pos(i,1),t_p_pos(i,2),'go');
    elseif p_pos(i,3)==0
        plot(p_pos(i,1),p_pos(i,2),'r*');
    end
end
cnt
figure(2)
hold on
p_pos = p_pos_t;
car_pos = car_pos_t;
d = 300;cnt = 0;
for i = 1:80
    nowbest = [d,0];
    for j = 1:100
        if p_pos(j,3)==0 
            continue;
        end
        delta = abs(car_pos(i,1)-p_pos(j,1)) + abs(car_pos(i,2)-p_pos(j,2));
        if delta < nowbest(1)
            nowbest(2) = j;
            nowbest(1) = delta;
        end
    end
    if nowbest(1) < d && nowbest(2) > 0
        cnt = cnt + 1;
        p_pos(nowbest(2),3) = 0;
    end
end
for i = 1:100
    if t_p_pos(i,3)==0
        plot(t_p_pos(i,1),t_p_pos(i,2),'go');
    elseif p_pos(i,3)==0
        plot(p_pos(i,1),p_pos(i,2),'r*')
    end
end
cnt
end
     