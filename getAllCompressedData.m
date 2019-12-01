function allCompressedData = getAllCompressedData

nSubjects = 5;
nTasks = 4;
allCompressedData = cell(nSubjects,nTasks);

for s=1:nSubjects
    for t=1:nTasks
        allCompressedData{s,t} = getCompressedFromDetailedData(s,t);
    end
end
end
