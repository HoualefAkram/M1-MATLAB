clc; close all; clear all;
% --- TP3: Transformerr de Fourier a court terme ---- %

fe = 2000;
te = 1/fe;
T = 0.1;
N = T/te;
% -- Graph 1 -- %
% x1
f1 = 100;
t1 = 0 : te : T - te;
x1 = cos(2*pi*f1*t1);
subplot(421); plot(t1,x1);grid on; xlabel('t (s)');ylabel('x1(t)')
% X1
F1 = -fe/2 : fe/N : fe/2 - fe/N;
X1 = fftshift(abs(fft(x1)));
subplot(422); plot(F1,X1);grid on; xlabel('f (Hz)');ylabel('X1(f)')

% -- Graph 2 -- %
% x2
f2 = 300;
t2 = T : te : 2*T - te;
x2 = cos(2*pi*f2*t2);
subplot(423); plot(t2,x2);grid on; xlabel('t (s)');ylabel('x2(t)')
% X2
F2 = -fe/2 : fe/N : fe/2 - fe/N;
X2 = fftshift(abs(fft(x2)));
subplot(424); plot(F2,X2);grid on; xlabel('f (Hz)');ylabel('X2(f)')

% -- Graph 3 -- %
% x3
f3 = 600;
t3 = 2*T : te : 3*T - te;
x3 = cos(2*pi*f3*t3);
subplot(425); plot(t3,x3);grid on; xlabel('t (s)');ylabel('x3(t)')
% X3
F3 = -fe/2 : fe/N : fe/2 - fe/N;
X3 = fftshift(abs(fft(x3)));
subplot(426); plot(F3,X3);grid on; xlabel('f (Hz)');ylabel('X3(f)')

% -- Graph 4 -- %
% x4
t4 = 0 : te : 3*T - te;
x4 = [x1 x2 x3];
subplot(427); plot(t4,x4);grid on; xlabel('t (s)');ylabel('x1 x2 x3');
%X4
N = length(t4);
F4 = -fe/2 : fe/N : fe/2 - fe/N;
X4 = fftshift(abs(fft(x4)));
subplot(428); plot(F4,X4);grid on; xlabel('f (Hz)');ylabel('X4(f)');

figure;
% --  Fourier Discrète à Court Terme (TFCT) -- %
window = 50;
N = length(t4);
counter = 0;
for centre = window/2:window:N
    counter = counter + 1;
    left = centre - window/2;
    right = centre + window /2;
    t_rect = 0:N - 1;
    rect = rectpuls(t_rect-centre,window);
    x_CROP = x4 .* rect .* te;
    F_CROP = - fe/2 : fe/N : fe/2 - fe/N;
    X = fftshift(abs(fft(x_CROP)));
    plot(F_CROP,X); grid on; legend(sprintf('%d msec -> %d msec', left*te*1000, right*te*1000));
    figure;
end

% -- SpectroGram -- %
spectrogram(x4, window, [], [], fe, 'yaxis');