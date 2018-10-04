close all;
clear;

filenames = ["data/uvrag_mrc.csv"; "data/beclin1_mrc.csv"];
inputLength = [699, 450];

for fi = 1:length(filenames)
    filename = filenames(fi);
    len = inputLength(fi);
    plotHDXData(filename, len, [2, 3], '10s');
    plotHDXData(filename, len, [4, 5], '30s');
    plotHDXData(filename, len, [6, 7], '60s');
    plotHDXData(filename, len, [8, 9], '90s');

end

plotHDXData("data/beclin1_fused_mrc.csv", 450, [2, 2], 'fused 30s')
plotHDXData("data/beclin1_fused_mrc.csv", 450, [3, 3], 'fused 60s')

%% Extra Stuff

% 3D Plots
% Z = [hdxData(:,2), hdxData(:,4), hdxData(:,6), hdxData(:,8)]';
% bar3([0 500 1000 1500], Z, .5);

% Mean line and ground line.
% plot(1:450,0);
% plot(mean([hdxData(:,2),hdxData(:,4),hdxData(:,6),hdxData(:,8)],2)) 