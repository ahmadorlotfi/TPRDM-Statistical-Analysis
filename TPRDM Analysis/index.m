% calculating the index for all types of trials in the experiment

fname = dir([add '*.mat']);
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
DD.Target = vertcat (D.Target);
DD.resp = vertcat (D.resp);

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
ind_equal = ind_double_equal | ind_triple_equal;

%ind sw

ind_double_ws = isnan (DD.coh(:,3)) & (DD.coh(:,1)<DD.coh(:,2));
ind_double_sw = isnan (DD.coh(:,3)) & (DD.coh(:,1)>DD.coh(:,2));

ind_triple_ws12 = ~isnan (DD.coh(:,3)) & (DD.coh(:,1)<DD.coh(:,2));
ind_triple_sw12 = ~isnan (DD.coh(:,3)) & (DD.coh(:,1)>DD.coh(:,2));
ind_triple_ws13 = ~isnan (DD.coh(:,3)) & (DD.coh(:,1)<DD.coh(:,3));
ind_triple_sw13 = ~isnan (DD.coh(:,3)) & (DD.coh(:,1)>DD.coh(:,3));
ind_triple_ws23 = ~isnan (DD.coh(:,3)) & (DD.coh(:,2)<DD.coh(:,3));
ind_triple_sw23 = ~isnan (DD.coh(:,3)) & (DD.coh(:,2)>DD.coh(:,3));



ind_32 = isnan(DD.coh(:,2)) & DD.coh(:,1)==0.032;
ind_64 = isnan(DD.coh(:,2)) & DD.coh(:,1)==0.064;
ind_128 = isnan(DD.coh(:,2)) & DD.coh(:,1)==0.128;
ind_256 = isnan(DD.coh(:,2)) & DD.coh(:,1)==0.256;
ind_512 = isnan(DD.coh(:,2)) & DD.coh(:,1)==0.512;

%sum(ind_32) + sum(ind_64) + sum(ind_128) + sum(ind_256) + sum(ind_512) == sum(ind_single);

ind_3232 = isnan (DD.coh(:,3)) & (DD.coh(:,1)==0.032) & (DD.coh(:,2)==0.032);
ind_3232_gap = isnan (DD.coh(:,3)) & (DD.coh(:,1)==0.032) & (DD.coh(:,2)==0.032) & (DD.gap(:,1)~=0);
ind_3232_nogap = isnan (DD.coh(:,3)) & (DD.coh(:,1)==0.032) & (DD.coh(:,2)==0.032) & (DD.gap(:,1)==0);

ind_6464 = isnan (DD.coh(:,3)) & (DD.coh(:,1)==0.064) & (DD.coh(:,2)==0.064);
ind_6464_gap = isnan (DD.coh(:,3)) & (DD.coh(:,1)==0.064) & (DD.coh(:,2)==0.064) & (DD.gap(:,1)~=0);
ind_6464_nogap = isnan (DD.coh(:,3)) & (DD.coh(:,1)==0.064) & (DD.coh(:,2)==0.064) & (DD.gap(:,1)==0);

ind_128128 = isnan (DD.coh(:,3)) & (DD.coh(:,1)==0.128) & (DD.coh(:,2)==0.128);
ind_128128_gap = isnan (DD.coh(:,3)) & (DD.coh(:,1)==0.128) & (DD.coh(:,2)==0.128) & (DD.gap(:,1)~=0);
ind_128128_nogap = isnan (DD.coh(:,3)) & (DD.coh(:,1)==0.128) & (DD.coh(:,2)==0.128) & (DD.gap(:,1)==0);

ind_3264_r = isnan (DD.coh(:,3)) & (((DD.coh(:,1)==0.032) & (DD.coh(:,2)==0.064)) | ((DD.coh(:,1)==0.064) & (DD.coh(:,2)==0.032)));
ind_3264 = isnan (DD.coh(:,3)) & DD.coh(:,1)==0.032 & DD.coh(:,2)==0.064;
ind_6432 = isnan (DD.coh(:,3)) & DD.coh(:,1)==0.064 & DD.coh(:,2)==0.032;


ind_32128_r = isnan (DD.coh(:,3)) & (((DD.coh(:,1)==0.032) & (DD.coh(:,2)==0.128)) | ((DD.coh(:,1)==0.128) & (DD.coh(:,2)==0.032)));
ind_32128 = isnan (DD.coh(:,3)) & DD.coh(:,1)==0.032 & DD.coh(:,2)==0.128;
ind_12832 = isnan (DD.coh(:,3)) & DD.coh(:,1)==0.128 & DD.coh(:,2)==0.032;

ind_64128_r = isnan (DD.coh(:,3)) & (((DD.coh(:,1)==0.064) & (DD.coh(:,2)==0.128)) | ((DD.coh(:,1)==0.128) & (DD.coh(:,2)==0.064)));
ind_64128 = isnan (DD.coh(:,3)) & DD.coh(:,1)==0.064 & DD.coh(:,2)==0.128;
ind_12864 = isnan (DD.coh(:,3)) & DD.coh(:,1)==0.128 & DD.coh(:,2)==0.064;

ind_double_ws = isnan (DD.coh(:,3)) & (DD.coh(:,1) < DD.coh(:,2));
%sum(ind_double_ws) == sum(ind_32128) + sum(ind_64128) + sum(ind_3264)
ind_double_sw = isnan (DD.coh(:,3)) & (DD.coh(:,1) > DD.coh(:,2));

ind_323232 = (DD.coh(:,1)==0.032) & (DD.coh(:,2)==0.032) & (DD.coh(:,3)==0.032);
ind_323232_nogap = (DD.coh(:,1)==0.032) & (DD.coh(:,2)==0.032) & (DD.coh(:,3)==0.032) & (DD.gap(:,1)==0);
ind_323232_gap = (DD.coh(:,1)==0.032) & (DD.coh(:,2)==0.032) & (DD.coh(:,3)==0.032) & (DD.gap(:,1)~=0);

ind_646464 = (DD.coh(:,1)==0.064) & (DD.coh(:,2)==0.064) & (DD.coh(:,3)==0.064);
ind_646464_nogap = (DD.coh(:,1)==0.064) & (DD.coh(:,2)==0.064) & (DD.coh(:,3)==0.064) & (DD.gap(:,1)==0);
ind_646464_gap = (DD.coh(:,1)==0.064) & (DD.coh(:,2)==0.064) & (DD.coh(:,3)==0.064) & (DD.gap(:,1)~=0);

ind_128128128 = (DD.coh(:,1)==0.128) & (DD.coh(:,2)==0.128) & (DD.coh(:,3)==0.128);
ind_128128128_nogap = (DD.coh(:,1)==0.128) & (DD.coh(:,2)==0.128) & (DD.coh(:,3)==0.128) & (DD.gap(:,1)==0);
ind_128128128_gap = (DD.coh(:,1)==0.128) & (DD.coh(:,2)==0.128) & (DD.coh(:,3)==0.128) & (DD.gap(:,1)~=0);

ind_323264 = (DD.coh(:,1)==0.032) & (DD.coh(:,2)==0.032) & (DD.coh(:,3)==0.064);
ind_326432 = (DD.coh(:,1)==0.032) & (DD.coh(:,2)==0.064) & (DD.coh(:,3)==0.032);
ind_643232 = (DD.coh(:,1)==0.064) & (DD.coh(:,2)==0.032) & (DD.coh(:,3)==0.032);
ind_323264_r = ind_323264 + ind_326432 + ind_643232;

ind_3232128 = (DD.coh(:,1)==0.032) & (DD.coh(:,2)==0.032) & (DD.coh(:,3)==0.128);
ind_3212832 = (DD.coh(:,1)==0.032) & (DD.coh(:,2)==0.128) & (DD.coh(:,3)==0.032);
ind_1283232 = (DD.coh(:,1)==0.128) & (DD.coh(:,2)==0.032) & (DD.coh(:,3)==0.032);
ind_3232128_r = ind_3232128 + ind_3212832 + ind_1283232;

ind_646432 = (DD.coh(:,1)==0.064) & (DD.coh(:,2)==0.064) & (DD.coh(:,3)==0.032);
ind_643264 = (DD.coh(:,1)==0.064) & (DD.coh(:,2)==0.032) & (DD.coh(:,3)==0.064);
ind_326464 = (DD.coh(:,1)==0.032) & (DD.coh(:,2)==0.064) & (DD.coh(:,3)==0.064);
ind_326464_r = ind_646432 + ind_643264 + ind_326464;

ind_6464128 = (DD.coh(:,1)==0.064) & (DD.coh(:,2)==0.064) & (DD.coh(:,3)==0.128);
ind_6412864 = (DD.coh(:,1)==0.064) & (DD.coh(:,2)==0.128) & (DD.coh(:,3)==0.064);
ind_1286464 = (DD.coh(:,1)==0.128) & (DD.coh(:,2)==0.064) & (DD.coh(:,3)==0.064);
ind_6464128_r = ind_6464128 + ind_6412864 + ind_1286464;

ind_12812832 = (DD.coh(:,1)==0.128) & (DD.coh(:,2)==0.128) & (DD.coh(:,3)==0.032);
ind_12832128 = (DD.coh(:,1)==0.128) & (DD.coh(:,2)==0.032) & (DD.coh(:,3)==0.128);
ind_32128128 = (DD.coh(:,1)==0.032) & (DD.coh(:,2)==0.128) & (DD.coh(:,3)==0.128);
ind_32128128_r = ind_12812832 + ind_12832128 + ind_32128128;

ind_12812864 = (DD.coh(:,1)==0.128) & (DD.coh(:,2)==0.128) & (DD.coh(:,3)==0.064);
ind_12864128 = (DD.coh(:,1)==0.128) & (DD.coh(:,2)==0.064) & (DD.coh(:,3)==0.128);
ind_64128128 = (DD.coh(:,1)==0.064) & (DD.coh(:,2)==0.128) & (DD.coh(:,3)==0.128);
ind_64128128_r = ind_12812864 + ind_12864128 + ind_64128128;

ind_3264128 = (DD.coh(:,1)==0.032) & (DD.coh(:,2)==0.064) & (DD.coh(:,3)==0.128);
ind_3212864 = (DD.coh(:,1)==0.032) & (DD.coh(:,2)==0.128) & (DD.coh(:,3)==0.064);
ind_6432128 = (DD.coh(:,1)==0.064) & (DD.coh(:,2)==0.032) & (DD.coh(:,3)==0.128);
ind_6412832 = (DD.coh(:,1)==0.064) & (DD.coh(:,2)==0.128) & (DD.coh(:,3)==0.032);
ind_1283264 = (DD.coh(:,1)==0.128) & (DD.coh(:,2)==0.032) & (DD.coh(:,3)==0.064);
ind_1286432 = (DD.coh(:,1)==0.128) & (DD.coh(:,2)==0.064) & (DD.coh(:,3)==0.032);
ind_3264128_r = ind_3264128 + ind_3212864 + ind_6432128 + ind_6412832 + ind_1283264 + ind_1286432;
