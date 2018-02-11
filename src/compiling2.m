R=500;
interval=300;
N=50;
obj_mat=zeros(1,50);
rep=5000;
sum=0;

handler = waitbar(0,'Initializing waitbar...');
start = clock;

for i=1:rep

 pct = i/rep;
 etr = etime(clock,start)*(1/pct-1);
 waitbar(pct,handler, sprintf('Computing... %d%% eta %d sec', round(pct*100), round(etr)));

 
 parameter_set;
 simul_diag;
 distance;
 ch_gain;
 admiss_contr;

 
 pl_script;
 


for l=1:N
    
 for j=1:N
   if PL_D2D(ptr_CUE(l,1),j)== l
    obj_mat(1,j)=obj_mat(1,j)+1;
   end
   
 end

end

end

obj_mat=obj_mat/rep;

plot(obj_mat);

for p=1:N
    
    sum=sum+obj_mat(1,p);
    
end
 


