clear all;
load('attack_data_10k.mat');
load('constants.mat');
%######################################################################################


mode = 1; % Use mode = 1 for running only the current script 
if (mode == 1)
    datapoints2 = datapoints;
    datapoints2 = datapoints2*1000000;
    byte_to_attack = 1; % Use this to add a for loop and loop over all 16 bytes.
    samples = size(datapoints2,1);%samples = size(aligned_samples,1); % 128;
elseif (mode == 0)
    datapoints2 = datapoints(num_trace_start:num_trace_stop,:);
    datapoints2 = datapoints2*1000000;
    %byte_to_attack = 6; % Use this to add a for loop and loop over all 16 bytes.
    samples = numoftraces;
elseif (mode ==2)
    datapoints2 = datapoints;
    datapoints2 = datapoints2*1000000;
    samples = size(datapoints2,1);
    
end
more off

% Prepare data
D = plaintexts_SCA(:,5);
%clear aes_plaintexts byte_to_attack

% Prepare power traces
%eval(sprintf('traces = %s(1:samples, :);', datapoints2));
traces = datapoints2(1:samples,:);
%clear analyzed_traces

% Prepare keys
K = uint8(0:255);


  

% Calculate hypothetical intermediate values
V = zeros(length(D),length(K),'uint8');%initializing a V matrix of size 10000x256 which will contain the intermediate values
for i=1:length(D)
    for j=1:length(K)
        V(i,j)=SubBytes(1,bitxor(K(j),D(i))+1);%storing in matrix V the results of the intermediate values.
    end
end


% Calclate hypothetical power consumption

H = zeros(length(D),length(K),'uint8');%assign a matrix H with length 10000x256 which will contain the hypothetical power consumption
for i=1:length(D)
    for j=1:length(K)
        H(i,j)=HW(1,V(i,j)+1);%here get the results of hypothetical power consumption by using the Hamming weight and intermideate values
        
    end
end
% Calculate the correlation

R=zeros(length(K),1000);%assign a matrix R with size 256x1000
for i=1:length(K)
    for j=1:1000
        temp=corrcoef([double(H(:,i)),double(datapoints(:,j))]);%here we use the matlab function corrcoef to get the correlation coeffcient between the hypothetical power and recorded power consumption.
        
        R(i,j)=temp(1,2);
    end
end

plot(R)%matlab function that prints the matrix R
hold on;



