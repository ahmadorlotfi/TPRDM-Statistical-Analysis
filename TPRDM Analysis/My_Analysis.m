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

% add = 'C:\PDM\Data\Ahmad\TPRDM\6\12-16\';
% [data_bar_all,Coherency,perf_single,single_coh_set] = All_Data(add)
% plot (single_coh_set,perf_single)
% bar (Coherency,data_bar_all,0.4)

% interval data
add = '';
[data_bar_interval,trail_num_interval] = Interval_Data (add);

bar (Coherency,data_bar_interval)
% 
% add = 'C:\PDM\Data\Ahmad\TPRDM\6\17-24\';
% [data_bar_interval,trail_num_interval] = Interval_Data (add)
% hold on
% bar (Coherency,data_bar_interval,0.4)




%noninterval data
add = '';
[data_bar_nointerval,trail_num_nointerval] = NoInterval_Data (add);
bar (Coherency,data_bar_nointerval)
ylabel('Probability Correct')
xlabel ('Coherency')
legend({'Single-pulse','Double-pulse','Triple-pulse'},'location','northwest')
% add = 'C:\PDM\Data\Ahmad\TPRDM\6\12-16\';
% [data_bar_nointerval,trail_num_nointerval] = NoInterval_Data (add)
% hold on
% bar (Coherency,data_bar_nointerval,0.4)



figure
bar (Coherency,[data_bar_nointerval data_bar_interval data_bar_all])

%smw
add = '';
[sw_tags,sw_bar,double_coh_set,perf_double] = SMW (add)
bar (sw_tags,sw_bar)
figure
bar (double_coh_set,perf_double)


%smw_interval
add = '';
[sw_tags,sw_bar,double_coh_set,perf_double] = SMW_interval (add)
bar (sw_tags,sw_bar)
figure
bar (double_coh_set,perf_double)

%single double compare
add = '';
[data_bar_interval,trail_num_interval,x,y,c] = sing_doub_compare (add)
scatter(x,y,[20 50 80 20 50 80 20 50 80],c,'filled')
xlabel('Coherency')
ylabel('Prabability Correct')
%legend({'single-pulse','d','t'})

%Training 
add = '';
Sub_Num=7;
[data_bar_ac,Coherency1,data_bar_rt,Coherency2,Rt_Coh_0,Rt_Tot,Ac_Tot] = Training_Analysis (add,Sub_Num);
bar (Coherency1,data_bar_ac,0.5)
xlabel('Coherency')
ylabel('Prabability Correct')
figure
bar (Coherency2,data_bar_rt,0.1)
xlabel('Coherency')
ylabel('Reaction Time')
