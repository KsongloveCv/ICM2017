function [meant]=newMM2andMM1(mean_arr,mean_serv,mean_serv1,mean_serv21,mean_serv22,peo_num) 
nt=exprnd(mean_arr,1,peo_num);

state_a=zeros(3,peo_num);                  
state_b=zeros(3,peo_num);                       
state_a(2,:)=exprnd(mean_serv,1,peo_num);
state_b(2,:)=exprnd(mean_serv1,1,peo_num); 
state_a(3,1)=0;   
state_b(3,1)=0; 
a=1;%ą���������
b=1;%b̨���������


arr_time=cumsum(nt);   
%����ʱ����ʱ�����������ʱ��
state_b(1,1)=arr_time(1);
state_a(1,1)=arr_time(2);                                
%state(1,:)=arr_time;  

lea_time_a(1)=sum(state_a(:,1));   
%�ȼ���ǰ1���˿͵��뿪ʱ��   
lea_time_b(1)=sum(state_b(:,1));   
%�ȼ����2���˿͵��뿪ʱ��
                
                
for i=3:peo_num 
if  lea_time_a(a)<lea_time_b(b)
%��i���˿͵������̨�����ȴ�ʱ��Ϊ   
%��ʱ����̨�����뿪�Ĺ˿͵��뿪ʱ���ȥ��i���˿͵ĵ���ʱ��
        a=a+1;
        state_a(1,a)=arr_time(i);
        if state_a(1,a)<=state_a(3,a-1)+state_a(2,a-1)   
           state_a(3,a)=state_a(3,a-1)+state_a(2,a-1)-state_a(1,a-1);   
        else   
            state_a(3,a)=0;   
        end 
        lea_time_a(a)=sum(state_a(:,a));
    else
        b=b+1;
        state_b(1,b)=arr_time(i);
        if state_b(1,b)<=state_b(3,b-1)+state_b(2,b-1)   
           state_b(3,b)=state_b(3,b-1)+state_b(2,b-1)-state_b(1,b-1);   
        else   
            state_b(3,b)=0;   
        end 
        lea_time_b(b)=sum(state_b(:,b));
    end
end

%��������״̬����
state=[state_a(:,1:a),state_b(:,1:b)];
state(3,:)=[lea_time_a(1:a),lea_time_b(1:b)];

%���������뿪ʱ��
%[g,m]=min(lea_time_a);
%[h,n]=min(lea_time_b);
lea_time=[lea_time_a,lea_time_b];

%���뿪ʱ����Ⱥ�˳���Ŷ�
guodu1=lea_time;
guodu2=zeros(1,peo_num);
for i=1:peo_num
    [guodu2(i),j]=min(guodu1);
    guodu1(j)=max(guodu1);
end        
                                
state2=zeros(3,peo_num);   
%��һ�����о����ʾ��������̨ÿ���˿͵�״̬   
%��������Ϊ������ʱ����������ʱ�䣬�ȴ�ʱ��   
state2(2,:)=unifrnd(mean_serv21,mean_serv22,1,peo_num);
%������������̨�ķ���ʱ��ֲ�      
state2(1,:)=guodu2;     

for i=2:peo_num   
if state2(1,i)<=state2(3,i-1)+state2(2,i-1)
%��Ҫ�ȴ������µȴ�ʱ��   
        state2(3,i)=state2(3,i-1)+state2(2,i-1)-state2(1,i);   
    else   
        state2(3,i)=0;   
    end;   
end;   
   
%arr_time2=cumsum(state2(1,:)); 
%state2(1,:)=arr_time2;   
lea_time2=sum(state2);


%����ƽ��ʱ��
t1=0;
t2=0;
for i=1:peo_num
    t1=t1+state(3,i)-state(1,i);
    t2=t2+lea_time2(i)-state2(1,i);
end
meant=(t1+t2)/peo_num;