clc;
clear all;
close all;
%-----------------------------------------------------------
%Trabalho2.m, versão 1.2
%Script contendo rotinas para resolver Sistemas lineares, 
%interpolação polinomial, splines e mínimos quadrados.
%2016. Autores: Lenington do C. Rios e Washington P. Batista;
%Universidade Estadual de Feira de Santana - UEFS, Brasil.
%-----------------------------------------------------------

%Sistema Linear com linsolve:
disp('SISTEMA LINEAR:');
A = [4 -2 -3 6; -6 7 6.5 -6; 1 7.5 6.25 5.5; -12 22 15.5 -1];
B = [12; -6.5; 16; 17];

X = linsolve(A,B);

fprintf('\nMatriz A =\n');
disp(A);
fprintf('Matriz B =\n');
disp(B);

fprintf('Resultado da equação matricial A*X = B\n');
disp(X);
%-----------------------------------------------------------

%-----------------------------------------------------------
%Interpolação Polinomial e splines:
disp('INTERPOLAÇÃO POLINOMIAL E SPLINES:');
x_real = [1 2 3 4 5 6 7 8 9]; 
y_real = [6 10 14 25 39 44 58 65 71]; 

fprintf('x ='); disp(x_real);
fprintf('y ='); disp(y_real);

xx = (1:.01:9);
yn = interpn(x_real,y_real,xx);
s = spline(x_real,y_real,xx);

figure(1);
plot(x_real,y_real,'o',xx,yn, 'b', xx,s,'r--')
legend('Amostras','Interpolação', 'Spline Cúbica', 'Location','southeast');
title('Interpolação Polinomial e Splines') ;
%-----------------------------------------------------------

%-----------------------------------------------------------
%Polyfit e Polyval para Extrapolação:
disp('EXTRAPOLAÇÃO:');
x_amostra = [1 2 3 4 5 6 7 8];
y_amostra = [6 10 14 25 39 44 58 65];

p = polyfit(x_amostra,y_amostra,7);

fprintf('P(x) ='); disp(p);

lin = linspace(1,9);
pv = polyval(p,lin);

fprintf('Valor da previsão de x = 9 é y =');
disp(polyval(p,9));

figure(2);
plot(x_real,y_real,'o', x_real, y_real,'b', lin, pv, 'r--');
legend('Amostras', 'Curva verdadeira', 'Extrapolação', 'Location','southwest');
title('Extrapolação') ;
%-----------------------------------------------------------

%-----------------------------------------------------------
%Polyfit e Polyval para Minimos Quadrados (Ajustes de curvas):
x_ = x_real';
y_ = y_real';

minQ = polyfit(x_,y_,2);
xQ = linspace(min(xx),max(xx));
yQ = polyval(minQ,xQ);

figure(3);
plot(x_real',y_real','o',xQ, yQ);
legend('Amostras', 'Curva ideal', 'Location','southeast');
title('Mínimos Quadrados (Ajustes de Curvas)');
%-----------------------------------------------------------