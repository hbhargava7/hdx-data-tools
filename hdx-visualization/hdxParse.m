function hdxData = hdxParse(fileName, len)

rawData = csvread(fileName, 1);

% Iterate through the sequence and fill an array with the values for each
% index.
hdxData = [linspace(1, len, len)', zeros(len, size(rawData, 2)-2)];
for i = 1:length(rawData)
        height = rawData(i,2)-rawData(i,1);
        hdxData(rawData(i,1):rawData(i,2), 2:9) = repmat(rawData(i,3:10), height+1,1);
end

end