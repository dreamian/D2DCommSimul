% N의 갯수(CUE나 D2D pair의 갯수)에 따른 throughput 값을 보여줍니다. 
% 값의 신뢰성을 위해 2000번 반복 시행

rep=50;

result_1=simulation(rep,1);
result_2=simulation(rep,2);
%result_3=simulation(rep,3);


i=15:50;

plot(i,result_1(1,i),'r',i,result_2(1,i),'b')%,i,result_3(1,i),'g');


xlabel('Number of D2D pairs(CU fixed)','fontsize',14,'fontname','arial');
ylabel('Throughput of System [ Mbps ]','fontsize',14,'fontname','arial');