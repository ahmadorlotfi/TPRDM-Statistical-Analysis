%equal double-pulses

add= '';

[~,~,perf_single,~] = All_Data (add);

[p_e_3232, p_e_6464, p_e_128128, p_e_3264, p_e_32128, p_e_64128, p_e_323232, ... 
p_e_646464, p_e_128128128, p_e_323264, p_e_3232128, p_e_646432, p_e_6464128, ...
p_e_12812832, p_e_12812864, p_e_3264128] = reg_perfectintegrator (add);

index

perf_3232 = sum(DD.acc(ind_3232))/sum(ind_3232);
perf_3232_nogap = sum(DD.acc(ind_3232_nogap))/sum(ind_3232_nogap);
perf_3232_gap = sum(DD.acc(ind_3232_gap))/sum(ind_3232_gap);

se_3232 = sqrt((perf_3232)*(1-perf_3232)/sum(ind_3232));
se_3232_nogap = sqrt((perf_3232_nogap)*(1-perf_3232_nogap)/sum(ind_3232_nogap));
se_3232_gap = sqrt((perf_3232_gap)*(1-perf_3232_gap)/sum(ind_3232_gap));

perf_6464 = sum(DD.acc(ind_6464))/sum(ind_6464);
perf_6464_nogap = sum(DD.acc(ind_6464_nogap))/sum(ind_6464_nogap);
perf_6464_gap = sum(DD.acc(ind_6464_gap))/sum(ind_6464_gap);

se_6464 = sqrt((perf_6464)*(1-perf_6464)/sum(ind_6464));
se_6464_nogap = sqrt((perf_6464_nogap)*(1-perf_6464_nogap)/sum(ind_6464_nogap));
se_6464_gap = sqrt((perf_6464_gap)*(1-perf_6464_gap)/sum(ind_6464_gap));

perf_128128 = sum(DD.acc(ind_128128))/sum(ind_128128);
perf_128128_nogap = sum(DD.acc(ind_128128_nogap))/sum(ind_128128_nogap);
perf_128128_gap = sum(DD.acc(ind_128128_gap))/sum(ind_128128_gap);

se_128128 = sqrt((perf_128128)*(1-perf_128128)/sum(ind_128128));
se_128128_nogap = sqrt((perf_128128_nogap)*(1-perf_128128_nogap)/sum(ind_128128_nogap));
se_128128_gap = sqrt((perf_128128_gap)*(1-perf_128128_gap)/sum(ind_128128_gap));

Coherency = categorical({'nogap','gap','all','single'});
Coherency = reordercats (Coherency,{'nogap','gap','all','single'});
s1 = scatter (Coherency(1:3),[perf_3232_nogap perf_3232_gap perf_3232],'red','filled');
hold on
errorbar (Coherency(1:3),[perf_3232_nogap perf_3232_gap perf_3232],[se_3232_nogap, se_3232_gap, se_3232],'o')
hold on
scatter (Coherency(1,4),five_points(1),'red','<');
hold on
x_categories = categorical ({'nogap','all'});
p_e_3232_line = line(x_categories,[p_e_3232,p_e_3232],'color','red','LineWidth',3);
ylim ([0.4 1])
hold on
s2 = scatter (Coherency(1:3),[perf_6464_nogap perf_6464_gap perf_6464],'green','filled');
hold on
errorbar (Coherency(1:3),[perf_6464_nogap perf_6464_gap perf_6464],[se_6464_nogap, se_6464_gap, se_6464],'o')
hold on
scatter (Coherency(1,4),five_points(2),'green','<');
hold on
p_e_6464_line = line(x_categories,[p_e_6464,p_e_6464],'color','green','LineWidth',3);
hold on
s3 = scatter (Coherency(1:3),[perf_128128_nogap perf_128128_gap perf_128128],'blue','filled');
hold on
errorbar (Coherency(1:3),[perf_128128_nogap perf_128128_gap perf_128128],[se_128128_nogap, se_128128_gap, se_128128],'o')
hold on
scatter (Coherency(1,4),five_points(3),'blue','<');
hold on
p_e_128128_line = line(x_categories,[p_e_128128,p_e_128128],'color','blue','LineWidth',3);
xlabel('Types')
ylabel('Prabability Correct')
legend([s1 s2 s3],{'32-32','64-64','128-128'},'Location','southeast')

%% unequal double-pulses

address= {'','','','',''};
figure
for j=1:5
add = char(strcat('', address(j),''));

[p_e_3232, p_e_6464, p_e_128128, p_e_3264, p_e_32128, p_e_64128, p_e_323232, ... 
p_e_646464, p_e_128128128, p_e_323264, p_e_3232128, p_e_646432, p_e_6464128, ...
p_e_12812832, p_e_12812864, p_e_3264128] = reg_perfectintegrator (add);

index

perf_3264_r = sum(DD.acc(ind_3264))/sum(ind_3264);
se_3264_r = sqrt((perf_3264_r)*(1-perf_3264_r)/sum(ind_3264));

perf_32128_r = sum(DD.acc(ind_32128))/sum(ind_32128);
se_32128_r = sqrt((perf_32128_r)*(1-perf_32128_r)/sum(ind_32128));

perf_64128_r = sum(DD.acc(ind_64128))/sum(ind_64128);
se_64128_r = sqrt((perf_64128_r)*(1-perf_64128_r)/sum(ind_64128));

perf_unequal = [perf_3264_r,perf_32128_r,perf_64128_r];
se_unequal = [se_3264_r,se_32128_r,se_64128_r];

Coherency = categorical({'S1','S2','S3','S4','All'});
Coherency = reordercats (Coherency,{'S1','S2','S3','S4','All'});

pe1 = scatter (Coherency(j),p_e_3264,'red','filled','square');
hold on
pe2 = scatter (Coherency(j),p_e_32128,'green','filled','square');
hold on
pe3 = scatter (Coherency(j),p_e_64128,'blue','filled','square');
hold on
s1 = scatter (Coherency(j),perf_3264_r,'red','filled');
hold on
errorbar (Coherency(j),perf_3264_r,se_3264_r,'color','red')
hold on
s2 = scatter (Coherency(j),perf_32128_r,'green','filled');
hold on
errorbar (Coherency(j),perf_32128_r,se_32128_r,'color','green')
hold on
s3 = scatter (Coherency(j),perf_64128_r,'blue','filled');
hold on
errorbar (Coherency(j),perf_64128_r,se_64128_r,'color','blue')
end

hold on
% x_categories = categorical ({'S1','S1'});
% p_e_3264_line = line(x_categories,[p_e_3264,p_e_3264],'color','red','LineWidth',3);
% hold on
% p_e_32128_line = line(x_categories,[p_e_32128,p_e_32128],'color','green','LineWidth',3);
% hold on
% p_e_64128_line = line(x_categories,[p_e_64128,p_e_64128],'color','blue','LineWidth',3);
ylim ([0.50 1])
xlabel('Types')
ylabel('Prabability Correct')
legend([s1 s2 s3],{'32-64','32-128','64-128'},'Location','southeast')