% This file shows the throughput script of 1) D2D pair 2) system under matching

%throughput_script

thr_d_matched=0;
thr_bs_matched=0;
count1=0;
count2=0;

for i=1:num_cue

    for j=1:N
       
        if rho_mat(i,j)==1 && ptr_CUE(i,1)==j
        %function thr = throughput(P_c,P_d,opt,i,j,k)    
        
        thr_d_matched=throughput(P_c(i,j),P_d(i,j),2,i,j,rho_mat(i,j))+thr_d_matched;
        
        thr_bs_matched=throughput(P_c(i,j),P_d(i,j),1,i,j,rho_mat(i,j))+thr_bs_matched;
        
        count1=1+count1;
        
        end
        
 
    end
        
        if ptr_CUE(i,1)==-1 || (ptr_CUE(i,1)~=-1&&rho_mat(i,ptr_CUE(i,1))==0 )
       
        thr_bs_matched=throughput(b1+rand*(max_power-b1),0,1,i,j,0)+thr_bs_matched;
        count2=1+count2;
        
        end
 
end
    

    



thr=thr_d_matched+thr_bs_matched;



