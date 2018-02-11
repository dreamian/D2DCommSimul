% N의 갯수(CUE나 D2D pair의 갯수)에 따른 throughput 값을 보여줍니다. 
% 값의 신뢰성을 위해 (rep)번 반복 시행

function simul = simulation(rep,option)



handler = waitbar(0,'Initializing waitbar...');
start = clock;

thrpt_vector=zeros(1,50);

for i=1:rep
    
    pct = i/rep;
    etr = etime(clock,start)*(1/pct-1);
    waitbar(pct,handler, sprintf('Computing... %d%% eta %d sec', round(pct*100), round(etr)));

for N=15:50

 R=500;
 
 parameter_set;
 simul_diag;
 distance;
 ch_gain;
 admiss_contr;
     
     if option==1    
        pl_script;
        throughput_script;
        thrpt_vector(1,N)=thr+thrpt_vector(1,N);

     elseif option==2
        random_script;
        throughput_script;
        thrpt_vector(1,N)=thr+thrpt_vector(1,N);
        
     elseif option==3
        LORA_set;
        throughput_script;
        thrpt_vector(1,N)=thr+thrpt_vector(1,N);
        clearvars -except thrpt_vector option rep handler start i pct etr waitbar;
 
     end

end
end

thrpt_vector=thrpt_vector/rep;

simul = thrpt_vector;

end
