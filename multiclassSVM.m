clear ; close all; clc

fprintf('Loading and Visualizing Data ...\n')

% Load from ex6data1: 
% You will have X, y in your environment
P=load('carTraining.data');
Y = P(:,7);
X = P(:,1:6);
x1 = [1 2 1]; x2 = [0 4 -1];
C =5; sigma = 0.5;
tamY=size(Y);
temp = zeros(tamY,4);
for i =1:tamY
	for j=1:size(temp,2)	
		if Y(i)==j
		      temp(i,j)=1;
		else
		      temp(i,j)=0;
		endif
	endfor
endfor
%C = 10;
%V=[4 4 5 4 1 3 ];

testData= load('carTest.data');
C=1;
for i = 1 : size(temp,2)
     % model=svmTrain(X, temp(:,i), C, @(x1, x2) gaussianKernel(x1, x2, sigma)); 
     model = svmTrain(X, temp(:,i), C, @linearKernel, 1e-3, 20);
      for j=1:size(testData,1)
      	pred = svmPredict(model, testData(j,:))
      end
    
      %error = sum(abs( temp(:,i) - pred))
 
end
    %y = (Y==1);
%    model1 = svmTrain(X, Y, C,  @linearKernel, 1e-3, 20); 
fprintf('\nTraining Linear SVM ...\n')