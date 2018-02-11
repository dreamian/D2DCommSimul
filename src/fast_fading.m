% This file is for making the effect of fast fading and getting the value of gain

function fast_g = fast_fading(~)




% Then, generate the random variables of exponential distribution
% by the inverse function of PDF	

	lambda = 1;
	fast_gain = -(1/lambda)*log(1-rand);



fast_g = fast_gain;

end
