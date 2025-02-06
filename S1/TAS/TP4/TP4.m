% ------ TP:4 Quantification ------ %

close all; clear all; clc;
fe = 5000;
te = 1/fe;
A = 5;
t = 0 : te : 0.01;
f0 = 200;

dynamique = 2*A;
CAN = 4;
delta = dynamique/(2^CAN);

% - original - %
x = A * sin(2*pi*f0*t);
subplot(2,1,1);plot(t,x);hold on;grid on;xlabel('t (msec)');ylabel('x(t)');

% - arrondi - %
x_arrondi = delta * round(x/delta);
plot(t,x_arrondi);hold on;

% - troncature -%
x_troncature = delta * floor(x/delta);
plot(t,x_troncature); legend('Original', 'Arrondi', 'Troncature');

% - erreurs - %
erreur_arrondi = abs(x-x_arrondi);
erreur_troncature = abs(x-x_troncature);
subplot(2,1,2);plot(t,erreur_arrondi);hold on;plot(t,erreur_troncature); legend('Erreur arrondi', 'Erreur troncature');grid on;xlabel('t (msec)');ylabel('erreur');

% - erreurs avec CAN = 3,7,11 et 15 - %
figure;
CAN_VEC = [3 7 11 15];
for CAN_VAR = CAN_VEC
    delta = dynamique/(2^CAN_VAR);
    % - original - %
    x_var = A * sin(2*pi*f0*t);
    % - arrondi - %
    x_arrondi_var = delta * round(x/delta);
    % - troncature - %
    x_troncature_var = delta * floor(x/delta);
    % - erreur arrondi - %
    erreur_arrondi_var = abs(x_var - x_arrondi_var);
    erreur_troncature_var = abs(x_var - x_troncature_var);
    plot(t,erreur_arrondi_var);hold on;plot(t,erreur_troncature_var);grid on;
end
