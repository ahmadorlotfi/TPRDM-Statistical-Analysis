%drawing related figures based on perfect integrator for triple-pulses
%trials

%equal triple-pulses

add= '';

[five_points] = Psychometric (add);

[p_e_3232, p_e_6464, p_e_128128, p_e_3264, p_e_32128, p_e_64128, p_e_323232, ... 
p_e_646464, p_e_128128128, p_e_323264, p_e_3232128, p_e_646432, p_e_6464128, ...
p_e_12812832, p_e_12812864, p_e_3264128] = reg_perfectintegrator (add);

index

perf_323232 = sum(DD.acc(ind_323232))/sum(ind_323232);
perf_323232_nogap = sum(DD.acc(ind_323232_nogap))/sum(ind_323232_nogap);
perf_323232_gap = sum(DD.acc(ind_323232_gap))/sum(ind_323232_gap);

se_323232 = sqrt((perf_323232)*(1-perf_323232)/sum(ind_323232));
se_323232_nogap = sqrt((perf_323232_nogap)*(1-perf_323232_nogap)/sum(ind_323232_nogap));
se_323232_gap = sqrt((perf_323232_gap)*(1-perf_323232_gap)/sum(ind_323232_gap));

perf_646464 = sum(DD.acc(ind_646464))/sum(ind_646464);
perf_646464_nogap = sum(DD.acc(ind_646464_nogap))/sum(ind_646464_nogap);
perf_646464_gap = sum(DD.acc(ind_646464_gap))/sum(ind_646464_gap);

se_646464 = sqrt((perf_646464)*(1-perf_646464)/sum(ind_646464));
se_646464_nogap = sqrt((perf_646464_nogap)*(1-perf_646464_nogap)/sum(ind_646464_nogap));
se_646464_gap = sqrt((perf_646464_gap)*(1-perf_646464_gap)/sum(ind_646464_gap));

perf_128128128 = sum(DD.acc(ind_128128128))/sum(ind_128128128);
perf_128128128_nogap = sum(DD.acc(ind_128128128_nogap))/sum(ind_128128128_nogap);
perf_128128128_gap = sum(DD.acc(ind_128128128_gap))/sum(ind_128128128_gap);

se_128128128 = sqrt((perf_128128128)*(1-perf_128128128)/sum(ind_128128128));
se_128128128_nogap = sqrt((perf_128128128_nogap)*(1-perf_128128128_nogap)/sum(ind_128128128_nogap));
se_128128128_gap = sqrt((perf_128128128_gap)*(1-perf_128128128_gap)/sum(ind_128128128_gap));

Coherency = categorical({'nogap','gap','all','single'});
Coherency = reordercats (Coherency,{'nogap','gap','all','single'});
s1 = scatter (Coherency(1:3),[perf_323232_nogap perf_323232_gap perf_323232],'red','filled');
hold on
errorbar (Coherency(1:3),[perf_323232_nogap perf_323232_gap perf_323232],[se_323232_nogap, se_323232_gap, se_323232],'o')
hold on
x_categories = categorical ({'nogap','all'});
p_e_323232_line = line(x_categories,[p_e_323232,p_e_323232],'color','red','LineWidth',3);
ylim ([0.4 1])
hold on
s2 = scatter (Coherency(1:3),[perf_646464_nogap perf_646464_gap perf_646464],'green','filled');
hold on
errorbar (Coherency(1:3),[perf_646464_nogap perf_646464_gap perf_646464],[se_646464_nogap, se_646464_gap, se_646464],'o')
hold on
p_e_646464_line = line(x_categories,[p_e_646464,p_e_646464],'color','green','LineWidth',3);
hold on
s3 = scatter (Coherency(1:3),[perf_128128128_nogap perf_128128128_gap perf_128128128],'blue','filled');
hold on
errorbar (Coherency(1:3),[perf_128128128_nogap perf_128128128_gap perf_128128128],[se_128128128_nogap, se_128128128_gap, se_128128128],'o')
hold on
p_e_128128128_line = line(x_categories,[p_e_128128128,p_e_128128128],'color','blue','LineWidth',3);
xlabel('Types')
ylabel('Prabability Correct')
legend([s1 s2 s3],{'32-32-32','64-64-64','128-128-128'},'Location','southeast')

