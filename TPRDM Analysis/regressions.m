function [three_points] = Psychometric (add)
%add = '';

index

%single

y = DD.acc (ind_single);
c1 = DD.coh (ind_single);

T = table(y, c1);
model_single = fitglm (T, 'y ~ c1', 'Distribution', 'binomial','link','logit');


c1 = (0:0.018:0.52);
v_formula3 = c1';
y_acc = glmval(model_single.Coefficients.Estimate, v_formula3, 'logit');

c_3_points = ([0.032,0.064,0.128]);
three_points = c_3_points';
y_acc_3_points = glmval(model_single.Coefficients.Estimate, three_points, 'logit');

[perf_all,perf_single,single_coh_set,Coherency] = All_Data(add);

scatter (single_coh_set,perf_single,'red','filled');
xlabel('Coherency');
ylabel('Prabability Correct');
hold on
plot (c1,y_acc);
figure

% Coefficients = ["Intercept";"C1"];
% Estimate = [model_single.Coefficients.Estimate(1);model_single.Coefficients.Estimate(2)];
% SE = [model_single.Coefficients.SE(1);model_single.Coefficients.SE(2)];
% tStat = [model_single.Coefficients.tStat(1);model_single.Coefficients.tStat(2)];
% pValue = [model_single.Coefficients.pValue(1);model_single.Coefficients.pValue(2)];
% table_single = table ( Estimate, SE, tStat, pValue);
% %table_single = table2cell(table_single);
% 
% u1 = uitable('Data',table_single{:,:},'ColumnName',table_single.Properties.VariableNames,'RowName',Coefficients,'Units', 'Normalized','Position', [0 0 1 1]);
% % Get the table in string form.


end