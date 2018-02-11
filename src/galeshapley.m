%--------------------- GS algorithm ---------------------%
function stablematch = galeshapley(num_cue,N,PL_D2D, PL_CUE)




resr_partner = (-1)*ones(num_cue,1);
rank = zeros(num_cue,N);



for i = 1:num_cue
    for j = 1:N
        for k = 1:N
        if(PL_CUE(i,k) == j)
            rank(i,j) = k;
        end
        end
    end
end
 

temp=1;

while (temp<=num_cue)


    for i=1:N
        
          
      f=find(PL_D2D(i,:)==temp);     
        
      
      if isempty(f)~=1 
          
          f=f(1,1);
          
       if(resr_partner(f,1)==-1 || rank(f,resr_partner(f,1))>rank(f,i))
          
          resr_partner(f,1)=i;
         
       end   
          
      end
        
        
        
    end
    
    temp=1+temp;
    
    
end
    
    
    
   
    

stablematch = resr_partner;


end



          
        
        
        
        
