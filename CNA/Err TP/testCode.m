clc; close all; clear all;

% Parameters        % Desired frequency of 10 Hz
N = 2056;
te = 1 / (N-1);        % Sampling interval, so sampling rate is 1000 Hz
fe = 1 / te;          % Sampling frequency

% Time vector
t = 0:te:1;        % 1 second of data

% Signal
f1 = 25;      
x1 = cos(2 * pi * f1 * t);


f2 = 10;      
x2 = cos(2 * pi * f2 * t);

f3 = 5;      
x3 = cos(2 * pi * f3 * t);

% Fourier Transform and Frequency Vector
X1 = abs(fft(x1));
X1 = fftshift(X1)/N;      % Shift zero frequency to the center

X2 = abs(fft(x2));
X2 = fftshift(X2)/N;

X3 = abs(fft(x3));
X3 = fftshift(X3)/N;

% Frequency vector for plotting
freq = -fe/2 - (fe/(2*N)) : fe/2 - (fe/(2*N));

% Plot
subplot(411);
plot(freq, X1);
xlim([-50 50]);       % Focus on the range around 0 Hz
ylim([-0.1 0.7]); 
title('FFT of the signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

subplot(412);
plot(freq, X2,'r');
xlim([-50 50]);       % Focus on the range around 0 Hz
ylim([-0.1 0.7]); 
title('FFT of the signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;

subplot(413);
plot(freq, X3,'g');
xlim([-50 50]);       % Focus on the range around 0 Hz
ylim([-0.1 0.7]); 
title('FFT of the signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;


subplot(414);
plot(freq, X1);
hold on;
plot(freq, X2,'r');
hold on;
plot(freq, X3,'g');
xlim([-50 50]);       % Focus on the range around 0 Hz
ylim([-0.1 0.7]); 
title('FFT of the signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
grid on;





