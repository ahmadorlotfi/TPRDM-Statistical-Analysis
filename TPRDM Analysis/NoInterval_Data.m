function [data_bar_nointerval,trail_num_nointerval] = NoInterval_Data (add)

% add = ''
fname = dir([add '*.mat']);
D=[];
DD=[];

for i=1:length (fname)

    file_name = fname(i).name (1:end-4);
    load ([add file_name])
    D=[D eval(file_name)];
    
end

DD.coh = vertcat(D.coh);
DD.acc = vertcat(D.acc);
DD.gap = vertcat(D.gap);


%single

ind_single = isnan (DD.coh(:,2));
data_single = DD.acc(ind_single,1);
 data_single_coh = DD.coh(ind_single,1);
 
 for i=1:length(data_single)
    if abs (data_single_coh(i,1)-0.0320) < 1e-5
        ind_single_32(i) = true;
        data_single_32 (i,1) = data_single(i,1);
    else
        ind_single_32(i) = false;
        data_single_32 (i,1) = 0;
    end
end
pref_single_32 = sum (data_single_32) / sum (ind_single_32);
Mean_single_32 = mean(data_single_32(ind_single_32,1));

for i=1:length(data_single)
    if abs (data_single_coh(i,1)-0.0640) < 1e-5
        ind_single_64(i) = true;
        data_single_64 (i,1) = data_single(i,1);
    else
        ind_single_64(i) = false;
        data_single_64 (i,1) = 0;
    end
end
pref_single_64 = sum (data_single_64) / sum (ind_single_64);
Mean_single_64 = mean(data_single_64(ind_single_64,1));

for i=1:length(data_single)
    if abs (data_single_coh(i,1)-0.1280) < 1e-5
        ind_single_128(i) = true;
        data_single_128 (i,1) = data_single(i,1);
    else
        ind_single_128(i) = false;
        data_single_128 (i,1) = 0;
    end
end
pref_single_128 = sum (data_single_128) / sum (ind_single_128);
Mean_single_128 = mean(data_single_128(ind_single_128,1));

for i=1:length(data_single)
    if abs (data_single_coh(i,1)-0.2560) < 1e-5
        ind_single_256(i) = true;
        data_single_256 (i,1) = data_single(i,1);
    else
        ind_single_256(i) = false;
        data_single_256 (i,1) = 0;
    end
end
pref_single_256 = sum (data_single_256) / sum (ind_single_256);
Mean_single_256 = mean(data_single_256(ind_single_256,1));


for i=1:length(data_single)
    if abs (data_single_coh(i,1)-0.5120) < 1e-5
        ind_single_512(i) = true;
        data_single_512 (i,1) = data_single(i,1);
    else
        ind_single_512(i) = false;
        data_single_512 (i,1) = 0;
    end
end
pref_single_512 = sum (data_single_512) / sum (ind_single_512);
Mean_single_512 = mean(data_single_512(ind_single_512,1));

j=1
for i=1:length(DD.coh)
    if abs(DD.gap(i,1)-0)<1e-5
       Data.coh (j,1:3)= DD.coh (i,1:3);
       Data.acc (j,1)= DD.acc (i,1);
       j=j+1;
    end
end


ind_single = isnan (Data.coh(:,2));
ind_double = isnan (Data.coh(:,3)) & ~isnan (Data.coh(:,2));
ind_triple = ~isnan (Data.coh(:,3));

%  data_single = Data.acc(ind_single,1);
%  data_single_coh = Data.coh(ind_single,1);
% [single_g, single_coh_set]= findgroups (data_single_coh);
% perf_single = splitapply(@mean,data_single,single_g);
% plot (single_coh_set,perf_single)




% double pulse perf
data_double = Data.acc(ind_double,1);
data_double_coh = Data.coh(ind_double,1:2);


for i=1:length(data_double)
    if abs (data_double_coh(i,1)-0.0320) < 1e-5 || abs (data_double_coh(i,2)-0.0320) < 1e-5
        ind_double_32(i) = true;
        data_double_32 (i,1) = data_double(i,1);
    else
        ind_double_32(i) = false;
        data_double_32 (i,1) = 0;
    end
end
pref_double_32 = sum (data_double_32) / sum (ind_double_32);
Mean_double_32 = mean(data_double_32(ind_double_32,1));
num_double_32=sum(ind_double_32);

for i=1:length(data_double)
    if abs (data_double_coh(i,1)-0.0640) < 1e-5 || abs (data_double_coh(i,2)-0.0640) < 1e-5
       ind_double_64(i) = true;
       data_double_64 (i,1) = data_double(i,1);
    else
        ind_double_64(i) = false;
        data_double_64 (i,1) = 0;
    end
end
pref_double_64 = sum (data_double_64) / sum (ind_double_64);
Mean_double_64 = mean(data_double_64(ind_double_64,1));
num_double_64=sum(ind_double_64);

for i=1:length(data_double)
    if abs (data_double_coh(i,1)-0.1280) < 1e-5 || abs (data_double_coh(i,2)-0.1280) < 1e-5
       ind_double_128(i) = true;
       data_double_128 (i,1) = data_double(i,1);
    else
        ind_double_128(i) = false;
        data_double_128 (i,1) = 0;
    end
end
pref_double_128 = sum (data_double_128) / sum (ind_double_128);
Mean_double_128 = mean(data_double_128(ind_double_128,1));
num_double_128=sum(ind_double_128);



% triple pulse perf
data_triple = Data.acc(ind_triple,1);
data_triple_coh = Data.coh(ind_triple,1:3);

for i=1:length(data_triple)
    if abs (data_triple_coh(i,1)-0.0320) < 1e-5 || abs (data_triple_coh(i,2)-0.0320) < 1e-5 || abs (data_triple_coh(i,3)-0.0320) < 1e-5
       ind_triple_32(i) = true;
       data_triple_32 (i,1) = data_triple(i,1);
    else
        ind_triple_32(i) = false;
        data_triple_32 (i,1) = 0;
    end
end
pref_triple_32 = sum (data_triple_32) / sum (ind_triple_32);
Mean_triple_32 = mean(data_triple_32(ind_triple_32,1));
num_triple_32=sum(ind_triple_32);

for i=1:length(data_triple)
    if abs (data_triple_coh(i,1)-0.0640) < 1e-5 || abs (data_triple_coh(i,2)-0.0640) < 1e-5 || abs (data_triple_coh(i,3)-0.0640) < 1e-5
       ind_triple_64(i) = true;
       data_triple_64 (i,1) = data_triple(i,1);
    else
        ind_triple_64(i) = false;
        data_triple_64 (i,1) = 0;
    end
end
pref_triple_64 = sum (data_triple_64) / sum (ind_triple_64);
Mean_triple_64 = mean(data_triple_64(ind_triple_64,1));
num_triple_64=sum(ind_triple_64);


for i=1:length(data_triple)
    if abs (data_triple_coh(i,1)-0.1280) < 1e-5 || abs (data_triple_coh(i,2)-0.1280) < 1e-5 || abs (data_triple_coh(i,3)-0.1280) < 1e-5
       ind_triple_128(i) = true;
       data_triple_128 (i,1) = data_triple(i,1);
    else
        ind_triple_128(i) = false;
        data_triple_128 (i,1) = 0;
    end
end
pref_triple_128 = sum (data_triple_128) / sum (ind_triple_128);
Mean_triple_128 = mean(data_triple_128(ind_triple_128,1));
num_triple_128=sum(ind_triple_128);


data_bar_nointerval = [pref_single_32,pref_double_32,pref_triple_32;
            pref_single_64,pref_double_64,pref_triple_64;
            pref_single_128,pref_double_128,pref_triple_128;
            pref_single_256,0,0;
            pref_single_512,0,0;];
        
trail_num_nointerval = [0, 0, 0;
                        num_double_32,num_double_64,num_double_128;
                        num_triple_32,num_triple_64,num_triple_128];
 
% figure
% Coherency = categorical({'0.032','0.064','0.128','0.256','0512'});
% bar (Coherency,data_bar_1080)

end 