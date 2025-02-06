

%-------signaux aleartoire loi normal ------------ %
clear all ; close all ; clc ;
mx=0;    
var=1;   
Te=0.001;

x = (mx - 3 * var):Te:(mx + 3 * var);
p = (1 / (sqrt(2 * pi) * var)) * exp(-((x - mx).^2) / (2 * var));  %Gaussien

%----------- manipulation 1 -------------- %
Nt=1000;     
Nc=10;     
z = randn(1, Nt);      % loi normal
[N,X]=hist(z, Nc);     % histogramme
figure;
bar(X,N/Nt);  % Normalized histogram
hold on 
plot(x,p,'r')


%----------- manipulation 2 -------------- %

figure;

mx=0;
sigma=1;

x = mx-3*sigma:0.001:mx+3*sigma ;
y = exp(-0.5*((x-mx)/sigma).^2)/(sqrt(2*pi*sigma^2));

plot(x,y); hold on; grid on;
aire1_sum = sum(y);
aire1_trapz =trapz(y);

mx=2; sigma=2;
x = mx-3*sigma:0.001:mx+3*sigma;
y = exp(-0.5*((x-mx)/sigma).^2)/(sqrt(2*pi*sigma^2));
plot(x,y); hold on;
aire2_sum = sum(y);
aire2_trapz = trapz(y);

mx=4; sigma=5;
x = mx-3*sigma:0.001:mx+3*sigma;
y = exp(-0.5*((x-mx)/sigma).^2)/(sqrt(2*pi*sigma^2));
plot(x,y); grid on;
legend('Loi N(0,1)','Loi N(2,2)','Loi N(4,5)');
aire3_sum = sum(y);
aire3_trapz = trapz(y);

Surface_SUM = [aire1_sum aire2_sum aire3_sum];
Surface_TRAPZ = [aire1_trapz aire2_trapz aire3_trapz];
