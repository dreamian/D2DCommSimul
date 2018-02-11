% This script is for compiling each distance
% This script makes 6 cases of distance

num_cue=50; % fixed number

d_d_pair=30.+30*rand(1,N); % the distance of D2D pair 30~60m

d_c_bs = zeros(1,num_cue);

d_d_bs = zeros(1,N);

d_c_d = zeros(num_cue,N);


for i = 1:N
   
      d_d_bs(i) = sqrt((D2D_Tx(i,1))^2+(D2D_Tx(i,2))^2);
      
end


for i = 1:num_cue
    
	d_c_bs(i) = sqrt((CUE(i,1))^2+(CUE(i,2))^2);
    
  
    for j = 1:N
       
        d_c_d(i,j) = sqrt((CUE(i,1)-D2D_Tx(j,1))^2+(CUE(i,2)-D2D_Tx(j,2))^2);        
        
    end
    
end
