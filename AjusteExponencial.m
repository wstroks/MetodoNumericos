%-----------------------------------------------------------
%AjusteExponencial.m, versão 0.3
%Ajuste de Curva por Exponencial
%input Ax e Ay conjunto de pontos da amostra 
%      Ax = [x0, ..., xn] e Ay = [y0, ..., yn]
%output a e b são os coeficientes da função g(x) = a + bx
%2016. Autores: Lenington, Kayo, Washington, Ian e Daniel
%Universidade Estadual de Feira de Santana - UEFS, Brasil.
%-----------------------------------------------------------
function [a,b] = AjusteExponencial(Ax, Ay)
%clc;
close all;

n = length(Ax); %quantidade de pontos experimentais
lAy = log(Ay); %calcula ln(y) dos dados

Ax2 = Ax.*Ax;
Axy = Ax.*lAy;

disp('***************************************************************************');
fprintf('Iteração\t Xi \t\t\t Yi \t\t\t lnYi \t\t\t Xi^2 \t\t\t XiYi\n');

for i = 1:n
    fprintf('%d\t\t\t %.3f\t\t\t %.3f\t\t\t %.3f\t\t\t %.3f\t\t\t %.3f\n', i, Ax(i), Ay(i), lAy(i), Ax2(i), Axy(i));
end;

%SOMAS
Sx = sum(Ax);
Sy = sum(Ay);
Sx2 = sum(Ax2);
Sxy = sum(Axy);
SlnY = sum(lAy);

fprintf('Soma = \t\t %.3f\t\t\t %.3f\t\t\t %.3f\t\t\t %.3f\t\t %.3f\n', Sx, Sy, SlnY, Sx2, Sxy);
fprintf('***************************************************************************\n\n\n\n');

%SOLUÇÃO
Z1 = SlnY;
Z2 = Sxy;
e11 = n;
e12 = Sx; e21 = e12;
e22 = Sx2;

a = (Z1*e22-Z2*e12)/(e22*e11-e21*e12);
a = exp(a);

b = (Z2*e11-Z1*e21)/(e22*e11-e21*e12);

x = (Ax(1):.01:Ax(n));
figure (1);
hold on;
f=inline('a*exp(b*x)');
plot(Ax,Ay,'o',x,f(a,b,x),'b');
grid;
legend('Amostras','Ajuste da reta', 'Location','southeast');
title('Ajuste de uma reta - Exponencial') ;
