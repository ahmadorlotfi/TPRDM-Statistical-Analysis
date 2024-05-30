add = 'C:\PDM\Data\Amir Hosein\1-8\'
fname = dir([add '*.mat'])
D=[];
DD=[];

for i=1:length (fname)

file_name = fname(i).name (1:end-4);
load ([add file_name]);
D=[D eval(file_name)];

end

DD.coh = vertcat(D.coh);
DD.acc = vertcat(D.acc);
DD.gap = vertcat(D.gap);

ind_single = isnan (DD.coh(:,2));
ind_double = isnan (DD.coh(:,3)) & ~isnan (DD.coh(:,2));
ind_triple = ~isnan (DD.coh(:,3));

ind_double_nogap = isnan (DD.coh(:,3)) & ~isnan (DD.coh(:,2)) & DD.gap(:,1)==0;
ind_triple_nogap = ~isnan (DD.coh(:,3))& DD.gap(:,1)==0;

ind_double_gap = isnan (DD.coh(:,3)) & ~isnan (DD.coh(:,2)) & DD.gap(:,1)==1.080;
ind_triple_gap = ~isnan (DD.coh(:,3))& DD.gap(:,1)==1.080;

ind_double_gap_equal = isnan (DD.coh(:,3)) & ~isnan (DD.coh(:,2)) & DD.gap(:,1)==1.080 & DD.coh(:,1)==DD.coh(:,2);
ind_triple_gap_equal = ~isnan (DD.coh(:,3))& DD.gap(:,1)==1.080 & DD.coh(:,1)==DD.coh(:,2) & DD.coh(:,2)==DD.coh(:,3);

ind_double_gap_unequal = isnan (DD.coh(:,3)) & ~isnan (DD.coh(:,2)) & DD.gap(:,1)==1.080 & DD.coh(:,1)~=DD.coh(:,2);
ind_triple_gap_unequal = ~isnan (DD.coh(:,3))& DD.gap(:,1)==1.080 & (DD.coh(:,1)~=DD.coh(:,2) | DD.coh(:,2)~=DD.coh(:,3) | DD.coh(:,1)~=DD.coh(:,3));

ind_double_equal = ind_double_nogap | ind_double_gap_equal;
ind_triple_equal = ind_triple_nogap | ind_triple_gap_equal;

% Double-pulses
y = DD.acc (ind_double);
c1 = DD.coh(ind_double,1);
c2 = DD.coh(ind_double,2);

T = table(y, c1, c2);
model = GeneralizedLinearModel.fit (T, 'y ~ c1 + c2 + c1*c2', 'Distribution', 'binomial')

% Triple-pulses
y = DD.acc (ind_triple);
c1 = DD.coh(ind_triple,1);
c2 = DD.coh(ind_triple,2);
c3 = DD.coh(ind_triple,3);

T = table(y, c1, c2, c3);
model = GeneralizedLinearModel.fit (T, 'y ~ c1 + c2 + c3 + c1*c2 + c1*c3 + c2*c3 + c1c2c3', 'Distribution', 'binomial')
