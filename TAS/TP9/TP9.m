clear all; close all; clc;

% --- filtre hamming pass bas --- %
n=60;
h=fir1(n-1,0.3);
figure;
freqs(h,1,512)

% --- filtre hanning pass haut --- %
n1=50;
b1=fir1(n1-1,0.7,'high',hann(n1+1));
figure;
freqz(b1,1,512)

% --- filtre chebychec pass bande --- %
n2=50;
b2=fir1(n2-1,[0.3 0.7],'band',chebwin(n2,100));
figure;
freqz(b2,1,512)

% --- filtre rectangulaire stop band --- %
n3=50;
b3=fir1(n3-1,[0.4 0.9],'stop',rectwin(n3+1));
figure;
freqz(b3,1,512)

% --- filtre RIF passe bande --- %
fc1=500;
fc2=1000;
fe=4000;
fc1n=fc1/(fe/2);
fc2n=fc2/(fe/2);
nbcoeff=60;
N=nbcoeff-1;
h=fir1(N,[fc1n fc2n],'band',rectwin(nbcoeff),'scale');
[H,F]=freqz(h,1,512,fe);

figure;
subplot(221);hold on;stem(h,'b');legend('h(n)');grid on
subplot(222);hold on;plot(F,abs(H));legend('H(f)');grid on
subplot(223);hold on;plot(F,20*log10(abs(H)));legend('G(f)');grid on
subplot(224);hold on;zplane(h,1);legend('zeros','poles');grid on

