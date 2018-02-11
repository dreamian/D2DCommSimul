%LORA_set




[x, y]=find(rho_mat==1);

ptr_CUE=unique(y);

size=size(ptr_CUE);

if isempty(size)==1
    
    size=0;
    
end

for i=1:num_cue-size(1,1)

    ptr_CUE(size(1,1)+i,1)=-1;

end




ref_thr=0;
sys_thr=1;

count_while=0;

while ref_thr<sys_thr

    throughput_script;
    ref_thr=thr;
    count_while=1+count_while;
    
for p=1:num_cue-1
    

    
 for q=p+1:num_cue
     
    throughput_script;
    sys_thr_1=thr;
    
    temp=ptr_CUE(p);
    ptr_CUE(p)=ptr_CUE(q);
    ptr_CUE(q)=temp;
    
    throughput_script;
    sys_thr_2=thr;
    
    if sys_thr_1>sys_thr_2
        
       temp=ptr_CUE(p);
       ptr_CUE(p)=ptr_CUE(q);
       ptr_CUE(q)=temp;
       sys_thr=sys_thr_1;
    
    elseif sys_thr_1<=sys_thr_2
        
        sys_thr=sys_thr_2;
    
    end

  end
end
end
