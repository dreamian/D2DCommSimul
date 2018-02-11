% This file is made for making basic parameter for simulation




global W;
W=0.5; % the bandwidth is 0.5MHz



alpha=4; % Pathloss exponent
K=10^(-2); % System parameter

max_power=10^((24)/10-3); % 25dBm

global noise;
noise=10^((-144)/10-3); % -144dBm

min_sinr_bs=10.^(linspace(15,20,50)/10); % 15-20dB 균일 분포
min_sinr_d=10^(13/10); %(13/10); % 13dB의 고정 분포

