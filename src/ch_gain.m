% This file is for channel gain for 
% 1) CUE-BS(1or2) 2) D2D pairs 3) Interference links for both (D2D->BS) and (CU ->D2D)
% defined by 
% gain_c_bs1(i), gain_c_bs2(i)
% gain_d_pair(i),
% intf_d_bs1(i), intf_d_bs2(i) 
% intf_c_d(i,j)

global gain_c_bs;
gain_c_bs=zeros(1,num_cue);

global gain_d_pair;
gain_d_pair=zeros(1,N);

global intf_d_bs;
intf_d_bs=zeros(1,N);

global intf_c_d;
intf_c_d=zeros(num_cue,N);     

for i = 1:N
   
    
	 gain_d_pair(i) = K*fast_fading*slow_fading*d_d_pair(i)^(-alpha);
     
     intf_d_bs(1,i) = K*fast_fading*slow_fading*d_d_bs(i)^(-alpha);
     
    
    
end


for i = 1:num_cue
    
	 gain_c_bs(1,i) = K*fast_fading*slow_fading*d_c_bs(i)^(-alpha);
    
     
     for j = 1:N
     
         intf_c_d(i,j) = K*fast_fading*slow_fading*d_c_d(i,j)^(-alpha);
     
     end
     
    

end
