function [data_bar_ac,Coherency1,data_bar_rt,Coherency2,Rt_Coh_0,Rt_Tot,Ac_Tot] = Training_Analysis (add,Sub_Num)
% this function shows the performance of the participant in the training
% phase, making the experimenter sure to ask the participant to the main
% experiment
% input1: add must be address of the data file
% input2: the number dedicated to the participant before the training phase
% output1: [total accuracy, accuracy in trials with %3.2, %6.4, %12.8,
% %25.6, and %52.2% recpectively]
% output2: labels of the output1
% output3: [reaction-time in trials with zero coherency, reaction-time in
% all trials]
% output4: labels of the output3
% output5: reaction-time in trials with zero coherency
% output6: reaction-time in all trials
% output7: accuracy in all trials


fname = dir([add '*.mat']);
D=[];
Data.coh=[];

file_name = fname.name;
load ([add file_name])

trial_num=200;
[ses_sum,block_sum] = size(DataRt{1,Sub_Num});
%Sub_Num=1;

for j=1:ses_sum
for i=1:block_sum
    Data.coh((i-1)*trial_num+1:(i)*trial_num,1) = DataRt{1,Sub_Num}{j,i}.coh;
    Data.acc((i-1)*trial_num+1:(i)*trial_num,1) = DataRt{1,Sub_Num}{j,i}.acc;
    Data.answer((i-1)*trial_num+1:(i)*trial_num,1) = DataRt{1,Sub_Num}{j,i}.answer;
    Data.eval((i-1)*trial_num+1:(i)*trial_num,1) = DataRt{1,Sub_Num}{j,i}.eval_answer;
    Data.rt((i-1)*trial_num+1:(i)*trial_num,1) = DataRt{1,Sub_Num}{j,i}.TrialRT;
end
end



% RT Coh=0
ind= (Data.eval ~= 'r' & Data.answer ~= 'm' & Data.coh==0);
RT0Per = (cellfun(@(x)(x(1,1)),Data.rt));
Rt_Coh_0=mean(RT0Per(ind)); %#ok<NASGU>

% RT Total
ind= (Data.eval ~= 'r' & Data.answer ~= 'm' );
TotRT = (cellfun(@(x)(x(1,1)),Data.rt));
Rt_Tot=mean(TotRT(ind));



%Ac Total
sum_cor= sum(Data.eval == 't' & Data.answer ~= 'm' & Data.coh~=0);
sum_all= sum(Data.eval ~= 'r' & Data.answer ~= 'm' & Data.coh~=0);
Ac_Tot=(sum_cor/sum_all)*100;


%Ac Coh=3.2
sum_cor_32= sum(Data.eval == 't' & Data.answer ~= 'm' & Data.coh==3.2);
sum_all_32= sum(Data.eval ~= 'r' & Data.answer ~= 'm' & Data.coh==3.2);
Ac_32=(sum_cor_32/sum_all_32)*100;

%Ac Coh=6.4
sum_cor_64= sum(Data.eval == 't' & Data.answer ~= 'm' & Data.coh==6.4);
sum_all_64= sum(Data.eval ~= 'r' & Data.answer ~= 'm' & Data.coh==6.4);
Ac_64=(sum_cor_64/sum_all_64)*100;

%Ac Coh=12.8
sum_cor_128= sum(Data.eval == 't' & Data.answer ~= 'm' & Data.coh==12.8);
sum_all_128= sum(Data.eval ~= 'r' & Data.answer ~= 'm' & Data.coh==12.8);
Ac_128=(sum_cor_128/sum_all_128)*100;

%Ac Coh=25.6
sum_cor_256= sum(Data.eval == 't' & Data.answer ~= 'm' & Data.coh==25.6);
sum_all_256= sum(Data.eval ~= 'r' & Data.answer ~= 'm' & Data.coh==25.6);
Ac_256=(sum_cor_256/sum_all_256)*100;

%Ac Coh=51.2
sum_cor_512= sum(Data.eval == 't' & Data.answer ~= 'm' & Data.coh==51.2);
sum_all_512= sum(Data.eval ~= 'r' & Data.answer ~= 'm' & Data.coh==51.2);
Ac_512=(sum_cor_512/sum_all_512)*100;

Coherency = categorical({'Total','0.032','0.064','0.128','0.256','0512'});
Coherency1 = reordercats (Coherency,{'Total','0.032','0.064','0.128','0.256','0512'});

data_bar_ac = [Ac_Tot, Ac_32, Ac_64, Ac_128, Ac_256, Ac_512];
%bar (Coherency,data_bar_training)
Coherency = categorical({'Zero','Total'});
Coherency2 = reordercats (Coherency,{'Zero','Total'});

data_bar_rt = [Rt_Coh_0,Rt_Tot];
end