% This file consider the admission control problem by MINLP.
% and make the optimized power pairs
% relation 1,2,3,4


rho_mat=zeros(num_cue,N);

P_c=zeros(num_cue,N);
P_d=zeros(num_cue,N);

x1=linspace(0,max_power,1000);
x2=linspace(0,max_power,1000);

A=zeros(1,2);  

B=zeros(1,2); % In scene 3, it may be C point 

C=zeros(1,2); 

D=zeros(1,2);

E=zeros(1,2);

for i=1:num_cue
    
      

 for j=1:N

     
   % Considering the selection of BS by CUE,  
     
     
   y=P_c(i,j); x=P_d(i,j);
   
   m1=(min_sinr_bs(1,i))*intf_d_bs(1,j)/gain_c_bs(1,i);
   b1=(min_sinr_bs(1,i))*noise/gain_c_bs(1,i);
   
   m2=gain_d_pair(1,j)/(min_sinr_d*intf_c_d(i,j));
   b2=-noise/intf_c_d(i,j);
   
   y1=m1*x1+b1;
   y2=m2*x2+b2;
   
   A=cross_pt(m1,m2,b1,b2);
   
   B=cross_pt(0,m2,max_power,b2);
   
   C=cross_pt(0,m1,max_power,b1);
   
   D(1,1)=max_power;
   D(1,2)=m2*D(1,1)+b2;
   
   E(1,1)=max_power;
   E(1,2)=m1*E(1,1)+b1;
   
   
% function thr = throughput(P_c,P_d,opt,i,j,k)
% case 1,2,3
if (A(1,1)>=0 && A(1,2)>=0 && m2>m1)
    
    rho_mat(i,j)=1;
    
    % case 1
    if(B(1,1)<C(1,1) && C(1,1)<=max_power && B(1,1)>=0)
        
        P_c(i,j)=max_power;
        
        thr_B=throughput(B(1,1),max_power,1,i,j,rho_mat(i,j))+throughput(B(1,1),max_power,2,i,j,rho_mat(i,j));
        thr_C=throughput(C(1,1),max_power,1,i,j,rho_mat(i,j))+throughput(C(1,1),max_power,2,i,j,rho_mat(i,j));
        
        if (thr_B>thr_C)
            P_d(i,j)=B(1,1);
        else
            P_d(i,j)=C(1,1);
        end
    % case 2   
    elseif ( D(1,2)<=max_power && E(1,2)<D(1,2) && E(1,2)>=0 )
    
        P_d(i,j)=max_power;
        
        thr_D=throughput(max_power,D(1,2),1,i,j,rho_mat(i,j))+throughput(max_power,D(1,2),2,i,j,rho_mat(i,j));
        thr_E=throughput(max_power,E(1,2),1,i,j,rho_mat(i,j))+throughput(max_power,E(1,2),2,i,j,rho_mat(i,j));
        
        if (thr_D>thr_E)
            P_c(i,j)=D(1,2);
        else
            P_c(i,j)=E(1,2);
        end
    
    % case 3
    elseif (B(1,1)<max_power && B(1,1)>=0 && E(1,2)>=0 && E(1,2)<max_power)
    
        
        temp=zeros(2,2);
        thr_CF=zeros(1,100);
        thr_FE=zeros(1,100);

        % temp의 x성분은 P_d, y성분은 P_c

            % in CF segment,

                temp(1,2)= max_power;

                div_P_d=linspace(B(1,1),max_power,100);
 
                    for l = 1:100
                        thr_CF(1,l)=throughput(max_power,div_P_d(1,l),1,i,j,rho_mat(i,j))+throughput(max_power,div_P_d(1,l),2,i,j,rho_mat(i,j));
                        t1 = find(thr_CF==max(max(thr_CF)));
                        temp(1,1)= div_P_d(1,t1(1,1));
                        
                    end
                    
                % in FE segment,
                
                temp(2,1)= max_power;

                div_P_c=linspace(E(1,1),max_power,100);
 
                    for l = 1:100
                        thr_FE(1,l)=throughput(div_P_c(1,l),max_power,1,i,j,rho_mat(i,j))+throughput(div_P_c(1,l),max_power,2,i,j,rho_mat(i,j));
                        t2 = find(thr_FE==max(max(thr_FE)));
                        temp(2,2)= div_P_c(1,t2(1,1));
                        
                    end
                 % comparing CF and FE,
                 
                 if max(thr_FE)<max(thr_CF)
                   
                     P_c(i,j)=temp(1,2);
                     P_d(i,j)=temp(1,1);
                 
                 else
                     
                     P_c(i,j)=temp(2,2);
                     P_d(i,j)=temp(2,1);
                 end

    end         
                            
% no existed in Shadow Area    
else 
    P_d_min=noise*min_sinr_d/gain_d_pair(1,j);
    rho_mat(i,j)=0; P_d(i,j)=P_d_min+rand*(max_power-P_d_min); 
    P_c(i,j)=b1+rand*(max_power-b1);

end
end  
end
