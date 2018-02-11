% This file is for making PLs of CUE and D2D pairs by throuthput

thr_bs=zeros(num_cue,N);
thr_d=zeros(num_cue,N);

rand_bs=rand(num_cue,N); % avoiding the overlap of priority
rand_d=rand(num_cue,N);  



for i=1:num_cue

    
    
for j=1:N
    
    
    thr_bs(i,j)=throughput(P_c(i,j),P_d(i,j),1,i,j,rho_mat(i,j));
    thr_d(i,j)=throughput(P_c(i,j),P_d(i,j),2,i,j,rho_mat(i,j));
    

end
end

PL_CUE=ones(num_cue,N);
PL_D2D=ones(N,num_cue);

for i=1:num_cue
    
    
    
 for j=1:N


  for k=1:N
  
    if (thr_bs(i,j)<thr_bs(i,k))
	  
        PL_CUE(i,j)=PL_CUE(i,j)+1;
    
    elseif (thr_bs(i,j)==thr_bs(i,k) && rand_bs(i,j)>rand_bs(i,k))    
        
    
        PL_CUE(i,j)=PL_CUE(i,j)+1;
        
    end
    
  end
    
  for p=1:num_cue   
    
  if (rho_mat(i,j)==1 && (thr_d(i,j)<thr_d(p,j)) && rho_mat(p,j)==1)
	   
        PL_D2D(j,i)=PL_D2D(j,i)+1;
        
  elseif (rho_mat(i,j)==1 && (thr_d(i,j)==thr_d(p,j)) && rho_mat(p,j)==1 && rand_d(i,j)>rand_d(p,j))
        
        PL_D2D(j,i)=PL_D2D(j,i)+1;
       
  end
    
    
    
    
  end
  
  	if (rho_mat(i,j)==0)
       
	    
        
            PL_D2D(j,i)=-1;
    

    end
    
  
    
 end
   

 
end



ptr_CUE=galeshapley(num_cue,N,PL_D2D,PL_CUE);

% Confirming the one-to-one matching
% But, PL_D2D will be not one-to-one matching
% Because if not matched with CUE, the priority is not meaningless

%i1=1:N;
%i2=1:num_cue;
%subplot(2,1,1);
%plot(i1,PL_D2D(i1,:),'r.');
%subplot(2,1,2);
%plot(i2,PL_CUE(i2,:),'r.');

