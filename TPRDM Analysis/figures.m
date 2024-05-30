%initial figures 
%all data
add = '';
[perf_all,perf_single,single_coh_set,Coherency] = All_Data(add);
plot (single_coh_set,perf_single,'MarkerSize',10)
xlabel('Coherency')
ylabel('Prabability Correct')
hold on
scatter (single_coh_set,perf_single,'red','filled')
figure
bar (Coherency,data_bar_all)


%Training phase
add = '';
Sub_Num=;
[data_bar_ac,Coherency1,data_bar_rt,Coherency2,Rt_Coh_0,Rt_Tot,Ac_Tot] = Training_Analysis (add,Sub_Num);
bar (Coherency1,data_bar_ac,0.5)
xlabel('Coherency')
ylabel('Prabability Correct')
figure
bar (Coherency2,data_bar_rt,0.1)
xlabel('Coherency')
ylabel('Reaction Time')
