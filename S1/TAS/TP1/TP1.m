clc; close all; clear all; 
% ---- Generation de signaux ---- %
 % - Question 1 - %
N = 1001;
f0 = 200;
T = 1;
te = T/N;
A = 2;
t = 0 : te : T - te;
x1 = A * cos(2*pi*f0*t);
subplot(311);
plot(t,x1);

% - Question 2 - %
A = 5;
T = 2;
to = 3;
te = 0.01;
T_TOTAL = 10;
t = 0 : te : T_TOTAL;
x2 = A*rectpuls(t-to,T);
subplot(312);
plot(t,x2);

% - Question 3 - %
A = 5;
T = 2;
to = 4;
te = 0.01;
T_TOTAL = 10;
t = 0 : te : T_TOTAL;
x3 = A*tripuls(t-to,T);
subplot(313);
plot(t,x3);
