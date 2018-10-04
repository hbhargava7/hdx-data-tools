function plotHDXData(inputFile, len, columns, label)

hdxData = hdxParse(inputFile, len);

figure('Color', [1 1 1]);
clf
hold on;

% Standard Error Calculations
value = mean([hdxData(:,columns(1)),hdxData(:,columns(2))],2);
stdev = std([hdxData(:,columns(1)),hdxData(:,columns(2))], [], 2);
SEM = stdev/sqrt(2);
disp(SEM)
uniques = [];
middles = [];
values = [];
startidx = 1;

for i = 1:(length(SEM)-1)
   
   current = SEM(i);
   next = SEM(i+1);
   if current ~= next
       middle = (startidx + i)/2;
       middles = [middles, middle];
       values = [values, value(i)];
       startidx = i;
       uniques = [uniques, current];
   end
end

hold on;
bar(value,'EdgeColor','none','BarWidth',1);
errorbar(middles + .5,values, uniques,'LineStyle','none','LineWidth',2,'Color',[0 0.447058826684952 0.74117648601532])

xlabel('Residue Number (aa)');
ylabel('Relative Deuterium Uptake (%)')
set(gca,'FontName','Source Sans Pro','FontSize',14);

title([extractBetween(inputFile,6,11),' Relative Deuterium Uptake ', label], 'FontSize', 18);

ylim([-15 15])
end