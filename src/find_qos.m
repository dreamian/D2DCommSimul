% compiling the simulation

clear
inform_mat=zeros(10,10);

for p=1:10

    % 6-8dB -> 3-5

for r=1:10
min_sinr_d=10^((3+10*(p/10))/10); %10^(4/10)
min_sinr_bs=10.^(linspace(3+17*(r/10),20,40)/10);
N=40; % the number of D2D pairs
R=500; % radius
interval=300; % the distance from (0,0) to the center of each cell

simul_diag
parameter_set
distance
ch_gain
admiss_contr
q=find(rho_mat==1);
s=size(q);
inform_mat(p,r)=s(1,1);
max(max(inform_mat));
end
end