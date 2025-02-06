% ------- TP:5 Résolution Spectrale -------%
clear all; close all; clc;

fe = 2000;
te = 1/fe;

% --- x1/X1 --- %
A1 = 5;
f1 = 100;
T1 = 0.1;
t1 = 0 : te : T1 - te;
x1 = A1 * cos(2*pi*f1*t1);
subplot(3,2,1);plot(t1,x1);grid on;

N1 = length(t1);
F1 = -fe/2 : fe/N1 : fe/2 - fe/N1 ;
X1 = fftshift(abs(fft(x1)));
subplot(3,2,2);plot(F1,X1);grid on;

% --- x2/X2 --- %
A2 = 5;
f2 = input('f2 = ');
T2 = 0.1;
t2 = T1 : te : T1 + T2 - te;
x2 = A2 * cos(2*pi*f2*t2);
subplot(3,2,3);plot(t2,x2);grid on;

N2 = length(t2);
F2 = -fe/2 : fe/N2 : fe/2 - fe/N2 ;
X2 = fftshift(abs(fft(x2)));
subplot(3,2,4);plot(F2,X2);grid on;

% --- x/X --- %
t = 0 : te : T1 + T2 - te;
x = [x1 x2];
subplot(3,2,5);plot(t,x);grid on;

N = length(t);
F = -fe/2 : fe/N : fe/2 - fe/N ;
X = fftshift(abs(fft(x)));
subplot(3,2,6);plot(F,X);grid on;

