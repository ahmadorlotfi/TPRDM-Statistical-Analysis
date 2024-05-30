function [perf_all,perf_single,single_coh_set,Coherency] = All_Data (add)

index

pref_single_32 = sum (DD.acc(ind_32)) / sum (ind_32);
pref_single_64 = sum (DD.acc(ind_64)) / sum (ind_64);
pref_single_128 = sum (DD.acc(ind_128)) / sum (ind_128);
pref_single_256 = sum (DD.acc(ind_256)) / sum (ind_256);
pref_single_512 = sum (DD.acc(ind_512)) / sum (ind_512);

perf_single = [pref_single_32,pref_single_64,pref_single_128,pref_single_256,pref_single_512];
single_coh_set = [0.032, 0.064, 0.128, 0.256, 0.512];

% double pulse perf

pref_double_32 = sum (DD.acc(ind_3232)) / sum (ind_3232);
pref_double_64 = sum (DD.acc(ind_6464)) / sum (ind_6464);
pref_double_128 = sum (DD.acc(ind_128128)) / sum (ind_128128);



% triple pulse perf


pref_triple_32 = sum (DD.acc(ind_323232)) / sum (ind_323232);
pref_triple_64 = sum (DD.acc(ind_646464)) / sum (ind_646464);
pref_triple_128 = sum (DD.acc(ind_128128128)) / sum (ind_128128128);

perf_all = [pref_single_32,pref_double_32,pref_triple_32;
            pref_single_64,pref_double_64,pref_triple_64;
            pref_single_128,pref_double_128,pref_triple_128;
            pref_single_256,0,0;
            pref_single_512,0,0;];
%figure
Coherency = categorical({'0.032','0.064','0.128','0.256','0512'});
Coherency = reordercats (Coherency,{'0.032','0.064','0.128','0.256','0512'});

% plot (single_coh_set,perf_single,'MarkerSize',10)
% xlabel('Coherency')
% ylabel('Prabability Correct')
% hold on
% scatter (single_coh_set,perf_single,'red','filled')
% figure
% bar (Coherency,perf_all)

end
