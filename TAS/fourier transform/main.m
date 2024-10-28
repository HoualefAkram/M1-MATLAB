clc  ; clear all ; close all;
fe = 2000;
te = 1/fe;
% graph 1
T1 = 0.1;
t1 = 0 : te : T1 - te;
f1 = 100;
x1 = cos(2*pi*f1*t1);
subplot(4,2,1);
plot(t1,x1);
xlabel('t (s)');
ylabel('x1(t)');
grid on;

N1 = T1/te;
X1 = fftshift(abs(fft(x1)));
fv1 = -fe/2 :fe/N1: fe/2 - fe/N1; 
subplot(4,2,2);
plot(fv1,X1);
xlabel('freq (Hz)');
ylabel('X1(f)');
grid on;

% graph 2
T2 = 0.1;
t2 = T1 : te : T1 + T2 - te;
f2 = 300;
x2 = cos(2*pi*f2*t2);
subplot(4,2,3);
plot(t2,x2);
xlabel('t (s)');
ylabel('x2(t)');
grid on;

N2 = T2/te;
X2 = fftshift(abs(fft(x2)));
fv2 = -fe/2 :fe/N2: fe/2 - fe/N2; 
subplot(4,2,4);
plot(fv2,X2);
xlabel('freq (Hz)');
ylabel('X2(f)');
grid on;

% graph 3
T3 = 0.1;
t3 = T1+T2 : te :T1+T2+T3 - te;
f3 = 600;
x3 = cos(2*pi*f3*t3);
subplot(4,2,5);
plot(t3,x3);
xlabel('t (s)');
ylabel('x3(t)');
grid on;

N3 = T3/te;
X3 = fftshift(abs(fft(x3)));
fv3 = -fe/2 :fe/N3: fe/2 - fe/N3; 
subplot(4,2,6);
plot(fv3,X3);
xlabel('freq (Hz)');
ylabel('X3(f)');
grid on;


% graph 4

T4 = T1 + T2 + T3;
t4 = 0: te :T4 - te;
x4 = [x1 x2 x3];
subplot(4,2,7);
plot(t4,x4);
xlabel('t (s)');
ylabel('x4(t)');
grid on;

N4 = T4/te;
X4 = fftshift(abs(fft(x4)));
fv4 = -fe/2 :fe/N4: fe/2 - fe/N4; 
subplot(4,2,8);
plot(fv4,X4);
xlabel('freq (Hz)');
ylabel('X4(f)');
grid on;

