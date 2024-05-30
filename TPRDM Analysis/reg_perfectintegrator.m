% based on single pulse accuracy drivred  from psychometric function

function [p_e_3232, p_e_6464, p_e_128128, p_e_3264, p_e_32128, p_e_64128, p_e_323232, p_e_646464, ...
    p_e_128128128, p_e_323264, p_e_3232128, p_e_646432, p_e_6464128,p_e_12812832, ...
    p_e_12812864, p_e_3264128] = reg_perfectintegrator (add)

%add = ''

index
[five_points] = Psychometric (add);

perf_32 = five_points(1);
perf_64 = five_points(2);
perf_128 = five_points(3);

%Double-pulse

% 32-32
e1 = icdf('normal',perf_32,0,1);
e2 = icdf('normal',perf_32,0,1);
p_e_3232 = 1 - cdf('normal',0, e1+e2, sqrt(2));

% 64-64
e1 = icdf('normal',perf_64,0,1);
e2 = icdf('normal',perf_64,0,1);
p_e_6464 = 1 - cdf('normal',0, e1+e2, sqrt(2));

% 128-128
e1 = icdf('normal',perf_128,0,1);
e2 = icdf('normal',perf_128,0,1);
p_e_128128 = 1 - cdf('normal',0, e1+e2, sqrt(2));

% 32-64 & 64-32
e1 = icdf('normal',perf_32,0,1);
e2 = icdf('normal',perf_64,0,1);
p_e_3264 = 1 - cdf('normal',0, e1+e2, sqrt(2));

% 32-128 & 128-32
e1 = icdf('normal',perf_32,0,1);
e2 = icdf('normal',perf_128,0,1);
p_e_32128 = 1 - cdf('normal',0, e1+e2, sqrt(2));

% 64-128
e1 = icdf('normal',perf_64,0,1);
e2 = icdf('normal',perf_128,0,1);
p_e_64128 = 1 - cdf('normal',0, e1+e2, sqrt(2));


% Triple-pulse

% 32-32-32
e1 = icdf('normal',perf_32,0,1);
e2 = icdf('normal',perf_32,0,1);
e3 = icdf('normal',perf_32,0,1);
p_e_323232 = 1 - cdf('normal',0, e1+e2+e3, sqrt(3));

% 64-64-64
e1 = icdf('normal',perf_64,0,1);
e2 = icdf('normal',perf_64,0,1);
e3 = icdf('normal',perf_64,0,1);
p_e_646464 = 1 - cdf('normal',0, e1+e2+e3, sqrt(3));

% 128-128-128
e1 = icdf('normal',perf_128,0,1);
e2 = icdf('normal',perf_128,0,1);
e3 = icdf('normal',perf_128,0,1);
p_e_128128128 = 1 - cdf('normal',0, e1+e2+e3, sqrt(3));


% 32-32-64 & 32-64-32 & 64-32-32
e1 = icdf('normal',perf_32,0,1);
e2 = icdf('normal',perf_32,0,1);
e3 = icdf('normal',perf_64,0,1);
p_e_323264 = 1 - cdf('normal',0, e1+e2+e3, sqrt(3));

% 32-32-128 & 32-128-32 & 128-32-32
e1 = icdf('normal',perf_32,0,1);
e2 = icdf('normal',perf_32,0,1);
e3 = icdf('normal',perf_128,0,1);
p_e_3232128 = 1 - cdf('normal',0, e1+e2+e3, sqrt(3));

% 64-64-32 & 64-32-64 & 32-64-64
e1 = icdf('normal',perf_64,0,1);
e2 = icdf('normal',perf_64,0,1);
e3 = icdf('normal',perf_32,0,1);
p_e_646432 = 1 - cdf('normal',0, e1+e2+e3, sqrt(3));

% 64-64-128 & 64-128-64 & 128-64-64
e1 = icdf('normal',perf_64,0,1);
e2 = icdf('normal',perf_64,0,1);
e3 = icdf('normal',perf_128,0,1);
p_e_6464128 = 1 - cdf('normal',0, e1+e2+e3, sqrt(3));

% 128-128-32 & 128-32-128 & 32-128-128
e1 = icdf('normal',perf_128,0,1);
e2 = icdf('normal',perf_128,0,1);
e3 = icdf('normal',perf_32,0,1);
p_e_12812832 = 1 - cdf('normal',0, e1+e2+e3, sqrt(3));

% 128-128-64 & 128-64-128 & 64-128-128
e1 = icdf('normal',perf_128,0,1);
e2 = icdf('normal',perf_128,0,1);
e3 = icdf('normal',perf_64,0,1);
p_e_12812864 = 1 - cdf('normal',0, e1+e2+e3, sqrt(3));

% 32-64-128 & all its combinations
e1 = icdf('normal',perf_32,0,1);
e2 = icdf('normal',perf_64,0,1);
e3 = icdf('normal',perf_128,0,1);
p_e_3264128 = 1 - cdf('normal',0, e1+e2+e3, sqrt(3));

end