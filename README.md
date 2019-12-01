# Red-Green-Axis-Mechanisms

This project enables access to the data from the experiments described in "Experiments with color scrambles reveal Red and Green half-axis mechanisms plus a Gray-tuned mechanism" by Christian Herrera, Charles Chubb, Charles E. Wright, Peng Sun, and George Sperling.  A draft of this paper is included in Color_scrambles.pdf.  

Files included:

1. DetailedData.mat contains a single 51896 row by 12 column matrix called Data.  Each row of Data contains the data from a single trial.  The entries in a given row are

      sNum tNum R1 R2 R3 R4 R5 R6 R7 R8 targLoc respLoc

where sNum is the number of the subject (1,2,3,4 or 5), tNum is the number of the task (1,2,3 or 4), the floating point numbers R1,R2,...,R8 give 8\*rho(1), 8\*rho(2),...,8\*rho(8), where rho is the perturbation used to generate the stimulus on this trial.  (Multiplying by 8 makes it so that the maximum (minimum) possible value in the first 8 columns is 1 (-1).)  targLoc gives the location of the target disk on this  trial, and respLoc gives the location that the subject guessed was the target location on this trial.  The proportion of squares in the target disk (backgroun annulus) that had color k, k=1,2...,8, is rho(k), and the proportion of squares in the backgroun annulus that had color k is 1/8 - rho(k).

2. getCompressedFromDetailedData.m is called as follows:

      CompressedData = getCompressedFromDetailedData(s,t);
      
where s is the subject number (1, 2, 3, 4, or 5) and t is the task number (1, 2, 3 or 4).  CompressedData is a matrix each of whose rows summarizes the results from a unique perturbation-condition used to generate stimuli for subject s in task t.  A given row comprises the following entries:

      R1 R2 R3 R4 R5 R6 R7 R8 nCorrect nIncorrect
      
The floating point numbers R1,R2,...,R8 give 8\*rho(1), 8\*rho(2),...,8\*rho(8) for the perturbation used to generate the stimuli in this condition.  nCorrect (nIncorrect) gives the number of trials in this condition to which subject s responded correctly (incorrectly).

3. getAllCompressedData.m is called as follows:

      allCompressedData = getAllCompressedData;
      
The output object, allCompressedData, is the 5 row by 4 column cell array such that

      allCompressedData{s,t} = getCompressedFromDetailedData(s,t);
      
4. 
