% This file is for making the effect of slow fading and getting the value of gain

function slow_g = slow_fading(~)

% Slow fading modeled as normal-log distribution with 8dB deviation

	std=8;
    mu=1;

% Make the gaussian number of slow fading

    
    sx=sqrt(log(std^2/mu^2+1));
    mx=log(mu)-sx^2/2;
    X=exp(mx+sx*randn);
    


slow_g = X;

end
