add = 'C:\PDM\Data\TPRDM\4\';

index

% Double-pulses
y = DD.acc (ind_double);
c1 = DD.coh(ind_double,1);
c2 = DD.coh(ind_double,2);

T = table(y, c1, c2);
model_double_interaction = GeneralizedLinearModel.fit (T, 'y ~ c1 + c2 + c1*c2', 'Distribution', 'binomial', 'link', 'logit');

% Triple-pulses
y = DD.acc (ind_triple);
c1 = DD.coh(ind_triple,1);
c2 = DD.coh(ind_triple,2);
c3 = DD.coh(ind_triple,3);

T = table(y, c1, c2, c3);
model_triple_interaction = GeneralizedLinearModel.fit (T, 'y ~ c1 + c2 + c3 + c1*c2 + c1*c3 + c2*c3 + c1*c2*c3', 'Distribution', 'binomial', 'link', 'logit');
