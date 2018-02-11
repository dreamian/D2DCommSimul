% This file is for making the throughput of CUE and D2D

function thr = throughput(P_c,P_d,opt,i,j,rho_mat)

global gain_c_bs;
global noise;
%global rho_mat;
global intf_d_bs;
global gain_d_pair;
%global intf_c_d;
global W;

if opt==1 % the case of 'SINR for BS'

        SINR=P_c*gain_c_bs(1,i)/(noise+rho_mat*P_d*intf_d_bs(1,j));

elseif opt==2     % the case of 'SINR for D2D pair'
    
    if rho_mat==1

        SINR=P_d*gain_d_pair(1,j)/(noise);%+P_c*intf_c_d(i,j));

    elseif rho_mat==0
       
        SINR=0;
        
    end
    
end





 thr= W*(log2(1+SINR));


end