clc;
clear all;
close all;

%Autores: Lenington e Washington
%M�todo da Falsa Posi��o

%Menu:
fprintf('M�TODO DA FALSA POSI��O\n');
fprintf('1 - x^2-5\n');
fprintf('2 - x^2-e^(-x)\n');
fprintf('3 - x^5-2x^4-9x^3+22x^2+4x-24\n');
ch=input('Escolha o n�mero da fun��o: ');

%Escolher a fun��o:
stop=1;
while stop==1
    switch ch
        case 1
            x=[0:.1:20];
            f1 = x.^2-5;
            f=inline('x^2-5');
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
            f0=fzero(@(x)(x^2)-exp(-x), 0);
            figure(1);
            plot(x,f1,f0,0,'o');
            grid;
            stop=0;
            break;
        case 3
            x=linspace(0,10,10);
            f1 = x.^5 -2*x.^4  -9*x.^3 +22*x.^2 +4*x -24;
            f=inline('x^5 -2*x^4  -9*x^3 +22*x^2 +4*x -24');
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

fprintf('Escolha o intervalo da solu��o:\n');
a=input('Xa: ');%ou Xl
b=input('Xb: ');%ou Xu

%primeira estimativa da solu��o num�rica
xo = b - (f(b)*(a-b))/(f(a)-f(b));

%Ep = crit�rio de parada
Ep=input('Esolha o crit�rio de parada: ');

disp('***************************************************************************************************************');
fprintf('RAIZ exata = %f\nCrit�rio de parada = %.2f\n', f0, Ep);
fprintf('Itera��o\t a \t\t\t b \t\t\t Xr \t\t f(Xr) \t\t\t f(a) \t\t\t |Ea| \t\t\t |Et|\n');

iter=0; %itera��o inicial
Ea = abs(100); %Ea = erro estimado

tic %tempo de execu��o (in�cio)
while Ea>Ep
    iter=iter+1;
    
    Et=abs((f0-xo)*100/f0); %m�dulo do Erro percentual relativo (verdadeiro)
    
    if iter>1
        Ea=abs((x_new-x_old)*100/x_new); %m�dulo do Erro percentual estimado
    end
    
    fprintf('%d\t\t\t %.3f\t\t %.3f\t\t %.3f\t\t %f\t\t %f\t\t %f\t\t %f\t\t\n', iter, a, b, xo, f(xo), f(a), Ea, Et);
    
    
    if (f(a)*f(xo))<0 %solu��o exata est� entre a e xo
        b=xo;
    else %solu��o exata est� entre xo e b
        a=xo;
    end
    
    x_old = xo; %x anterior
    xo = b - (f(b)*(a-b))/(f(a)-f(b));
    x_new = xo; %x atual
end
toc %tempo de execu��o

disp('***************************************************************************************************************');
