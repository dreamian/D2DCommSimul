% About random RA

inform_mat=rho_mat;
ptr_CUE=(-1)*ones(num_cue,1);


for i=1:num_cue    
    
    for j=1:N
     
        for k=1:N-j
        if (inform_mat(i,j)==1 && inform_mat(i,j)==inform_mat(i,j+k))
            inform_mat(i,j+k)=0;
            
     
          
         
        end
        end
        
    end
        
    
end

trans=transpose(inform_mat);

for i=1:N    
    
    for j=1:num_cue
     
        for k=1:num_cue-j
        if (trans(i,j)==1 && trans(i,j)==trans(i,j+k))
            trans(i,j+k)=0;
            
     
          
         
        end
        end
        
    end
        
    
end

inform_mat=transpose(trans);

clear i j k;

for i=1:num_cue

for j=1:N

    if inform_mat(i,j)==1

        ptr_CUE(i,1)=j;
        
    end


end
end





 