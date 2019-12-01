function CompressedData = getCompressedFromDetailedData(s,t)

% DetailedData.mat contains a single 51896 row by 12 column matrix called
% Data.  Each row of Data contains the data from a single trial.  The
% entries in a given row are
%
% sNum tNum R1 R2 R3 R4 R5 R6 R7 R8 targLoc respLoc
%
% where sNum is the number of the subject (1,2,3,4 or 5), tNum is the 
% number of the task (1,2,3 or 4), the floating point numbers R1,R2,...,R8
% give 8*rho(1), 8*rho(2),...,8*rho(8), where rho is the perturbation used
% to generate the stimulus on this trial.  (Multiplying by 8 makes it so 
% that the maximum (minimum) possible value in the first 8 columns is 1 
% (-1).)  targLoc gives the location of the target disk on this  trial,
% and respLoc gives the location that the subject guessed was the target
% location on this trial.  The proportion of squares in the target disk
% (backgroun annulus) that had color k, k=1,2...,8, is rho(k), and the 
% proportion of squares in the backgroun annulus that had color k is
% 1/8 - rho(k).

load DetailedData
whichRows = Data(:,1)==s & Data(:,2)==t;
D = Data(whichRows,3:end);
correct = D(:,end)==D(:,end-1);
AllPerts = D(:,1:8);
[UPerts,I,J] = unique(AllPerts,'rows');

K = NaN(size(UPerts,1),1);
N = NaN(size(UPerts,1),1);
for k=1:size(UPerts,1)
    whichOnes = (J == k);
    K(k) = sum(correct(whichOnes));
    N(k) = sum(~correct(whichOnes));    
end

CompressedData = [UPerts K N];


end

