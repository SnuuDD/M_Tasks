%Multiple Regression Model%
clear all
%Data
DATA = xlsread('data.xlsx');

means = mean(DATA);
%Mean of variables 1
meanx1 = means(1);
%Mean of variables 2
meanx2 = means(2);

%Mean of dependent variables

meany = means(3);

%Sum of squares of variable 1
SSx1 = 0;
for i = 1:size(DATA,1)
    SSx1 = SSx1 + (DATA(i,1) - meanx1).^2;
end

%Sum of squares of variable 2
SSx2 = 0;
for i = 1:size(DATA,1)
    SSx2 = SSx2 + (DATA(i,2) - meanx2).^2;
end

%Sum of products of variable 1 times dependent variables
SPx1y = 0;
for i = 1:size(DATA,1)
    SPx1y = SPx1y + (DATA(i,1) - meanx1) * (DATA(i,3) - meany);
end

%Sum of products of variable 1 times dependent variables
SPx2y = 0;
for i = 1:size(DATA,1)
    SPx2y = SPx2y + (DATA(i,2) - meanx2) * (DATA(i,3) - meany);
end

%Sum of products of variable 1 times variables 2
SPx1x2 = 0;
for i = 1:size(DATA,1)
    SPx1x2 = SPx1x2 + (DATA(i,2) - meanx2) * (DATA(i,1) - meanx1);
end

%Coefficient 1
b1 = ((SPx1y) * (SSx2) - (SPx1x2) * (SPx2y)) / ((SSx1)*(SSx2) - (SPx1x2)*(SPx1x2));
%Coefficient 2
b2 = ((SPx2y) * (SSx1) - (SPx1x2) * (SPx1y)) / ((SSx1) * (SSx2) - (SPx1x2) * (SPx1x2));

%Coefficient 0 / Intersection with y value
b0 = meany - b1*meanx1 - b2*meanx2;


model = @(x,y) b0 + b1*x + b2*y;
model(3.57,62.33)


APRE = abs((8 - 79.7)/70.69792 * 100)

%Model
z = zeros(size(DATA(:,1)));
for i = 1:size(DATA,1)
    z(i) = model(DATA(i,1),DATA(i,2));
end

scatter3(DATA(:,1),DATA(:,2),DATA(:,3),'filled')
hold on

fsurf(model)
