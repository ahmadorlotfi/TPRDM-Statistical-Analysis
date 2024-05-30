function [five_points] = Psychometric (add)
%add = 'C:\PDM\Data\Second phase\Data\Amir M\';

index

%single

y = DD.acc (ind_single);
c1 = DD.coh (ind_single);

T = table(y, c1);
model_single = fitglm (T, 'y ~ c1', 'Distribution', 'binomial','link','logit');


c1 = (0:0.018:0.52);
v_formula3 = c1';
y_acc = glmval(model_single.Coefficients.Estimate, v_formula3, 'logit');

c_5_points = ([0.032, 0.064, 0.128, 0.256, 0.512]);
five_x = c_5_points';
five_points = glmval(model_single.Coefficients.Estimate, five_x, 'logit');

%[perf_all,perf_single,single_coh_set,Coherency] = All_Data(add);

% scatter (single_coh_set,perf_single,'red','filled');
% xlabel('Coherency');
% ylabel('Prabability Correct');
% hold on
% plot (c1,y_acc);

end