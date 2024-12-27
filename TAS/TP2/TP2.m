clc; close all; clear all;
% ---- Etude de la Transformee de Fourier Discrete ---- %

% - Question 1 - %
N_VEC = [512 256 128 32 8];
counter = 0;
for N=N_VEC
    M = 512;
    counter = counter + 1;
    A = 1;
    f0 = 200;
    te = 1/M;
    t = 0 : te : 1 - te;
    x = A*cos(2*pi*f0*t);
    subplot(length(N_VEC) + 1,2,counter);plot(t,x);grid on;xlabel('M = 512');
    fe = 1/te;
    F = -fe/2: fe/N: fe/2 - fe/N;
    X = fftshift(abs(fft(x,N)));
    counter = counter + 1;
    subplot(length(N_VEC) + 1,2,counter);plot(F,X);grid on;xlabel(sprintf('N = %d', N));
end


% - Question 2 - %
T = 2;
te = 0.001;
t = -5 : te : 5;
x1 = 2* rectpuls(t,T);
subplot(length(N_VEC) + 1,2,counter+1);plot(t,x1);grid on;

fe = 1/te;
N = length(t);
F = -fe/2 : fe/N : fe/2-fe/N;
X = fftshift(abs(fft(x1)));
subplot(length(N_VEC) + 1,2,counter+2);plot(F,X); grid on;
