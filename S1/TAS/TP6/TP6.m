% ------ TP:6  Filtrage Numérique (Filtre RII) ------ %
clear all; close all; clc;

% - Premiere manipulation - %
te = 0.001;
T = 0.05;
t = -T:te:T;
N = length(t);
B = [1 0.5];
A = [1 -1.7654 0.81];
X = [zeros(1,floor(N/2)) 1  zeros(1,floor(N/2))];
Y = filter(B,A,X);
stem(t,Y);


figure;
% - Deuxieme manipulation - %
Fp = 3500;               
Wp = Fp * 2 * pi;       
Rp = -1;                

Fs = 4500;              
Ws = Fs * 2 * pi;        
Rs = -40;                

[N, Wn] = buttord(Wp, Ws, Rp, Rs, 's');
[B, A] = butter(N, Wn, 's');
[H, W] = freqs(B, A);

plot(W / (2*pi), 20*log10(abs(H))); 