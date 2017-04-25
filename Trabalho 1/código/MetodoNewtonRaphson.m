clc;
clear all;
close all;

%Autores: Lenington e Washington
%M�todo de Newton-Raphson

%Menu:
fprintf('M�TODO DE NEWTON-RAPHSON\n');
fprintf('1 - x^2-5\n');
fprintf('2 - x^2-e^(-x)\n');
fprintf('3 - x^5-2x^4-9x^3+22x^2+4x-24\n');
ch=input('Escolha o n�mero da fun��o: ');

%Escolher a fun��o:
stop=1;
while stop==1
    switch ch
        case 1
            x=[0:1:10];
            f1 = x.^2-5;
            f=inline('x^2-5');
            df=inline('2*x'); %derivada de f
            f0=fzero(@(x)x^2-5, 2); 
            figure(1);
            plot(x,f1,f0,0,'o');
            grid;
            stop=0;
            break;
        case 2
            x=linspace(0,1,10);
            f1 = (x.^2)-exp(-x);
            f=inline('x^2-exp(-x)');
            df=inline('2*x+exp(-x)'); %derivada de f
            f0=fzero(@(x)(x^2)-exp(-x), 0);
            figure(1);
            plot(x,f1,f0,0,'o');
            grid;            
            stop=0;
            break;
        case 3
            x=linspace(0,10,10);
            f1 = x.^5 -2*x.^4  -9*x.^3 +22*x.^2 +4*x -24;
            f=inline('x^5 -2*x^4 -9*x^3 +22*x^2 +4*x -24');
            df=inline('5*x^4 -8*x^3 -27*x^2 +44*x +4'); %derivada de f
            f0=fzero(@(x)x.^5 -2*x.^4  -9*x.^3 +22*x.^2 +4*x -24, 2);
            figure(1);
            plot(x,f1,f0,0,'o');
            grid;            
            stop=0;
            break;
        otherwise
            stop=1;
            break;
    end
end

fprintf('Escolha o um ponto como tentativa inicial da solu��o:\n');
a=input('Xa: '); %ponto inicial da solu��o

%
xi = a;

%Ep = crit�rio de parada
Ep=input('Esolha o crit�rio de parada: ');

disp('***************************************************************************************************************');
fprintf('RAIZ exata = %f\nCrit�rio de parada = %.2f\n', f0, Ep);
fprintf('Itera��o\t xi \t\t\t f(xi) \t\t\t df(xi) \t\t |Ea| \t\t\t |Et|\n');

iter=0; %itera��o inicial
Ea = abs(100); %Ea = erro estimado

tic %tempo de execu��o (in�cio)
while Ea>Ep 
    Et=abs((f0-xi)*100/f0); %m�dulo do Erro percentual relativo (verdadeiro)
    
    if iter>0
        Ea=abs((xi-x_old)*100/xi); %m�dulo do Erro percentual estimado
    end
    fprintf('%d\t\t\t %f\t\t %f\t\t %f\t\t %f\t\t %f\t\n', iter, xi, f(xi), df(xi), Ea, Et);
    
    x_old = xi; %x anterior
    xi = xi-(f(xi)/df(xi)); %a pr�xima solu��o obtida pela atual
    x_new = xi; %x atual
    
    iter=iter+1;
end
toc %tempo de execu��o

disp('***************************************************************************************************************');
