function user = user_distribution(num_of_pairs,R)


user=zeros(num_of_pairs,2);

k=1;



    for i=1:num_of_pairs

    
    
    
    [coord_x,coord_y] = get_coordinates(R);
    user(k,1)=coord_x;
    user(k,2)=coord_y;
    k=k+1;
    
    
    end
    
end
         
        
   
