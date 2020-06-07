clear ; close all; clc
%loading dataset
data = load('dataset.txt');
X = data(:, [1:17]); y = data(:, 18);
[m, n] = size(X);
X = [ones(m, 1) X];
theta = zeros(n + 1, 1);

alpha=0.0001;

for i=1:400
    z=X*theta;
    %basic equation
    h=1./(1+exp(-z));
    %cost function
    J=sum(y.*log(h)+(1-y).*log(h))/(-m);
    %gradient descent
    grad=(X'*(h-y))/m;
    theta=theta-alpha*grad;
end 
%loading features of the person
x=load('entryfeatures.txt');
g=x*theta;
 h=1./(1+exp(g));
 %printing percentage probability of being infected
 disp(h*100);


