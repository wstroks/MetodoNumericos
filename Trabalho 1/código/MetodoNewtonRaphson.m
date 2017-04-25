clc;
clear all;
close all;

%Autores: Lenington e Washington
%Método de Newton-Raphson

%Menu:
fprintf('MÉTODO DE NEWTON-RAPHSON\n');
fprintf('1 - x^2-5\n');
fprintf('2 - x^2-e^(-x)\n');
fprintf('3 - x^5-2x^4-9x^3+22x^2+4x-24\n');
ch=input('Escolha o número da função: ');

%Escolher a função:
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

fprintf('Escolha o um ponto como tentativa inicial da solução:\n');
a=input('Xa: '); %ponto inicial da solução

%
xi = a;

%Ep = critério de parada
Ep=input('Esolha o critério de parada: ');

disp('***************************************************************************************************************');
fprintf('RAIZ exata = %f\nCritério de parada = %.2f\n', f0, Ep);
fprintf('Iteração\t xi \t\t\t f(xi) \t\t\t df(xi) \t\t |Ea| \t\t\t |Et|\n');

iter=0; %iteração inicial
Ea = abs(100); %Ea = erro estimado

tic %tempo de execução (início)
while Ea>Ep 
    Et=abs((f0-xi)*100/f0); %módulo do Erro percentual relativo (verdadeiro)
    
    if iter>0
        Ea=abs((xi-x_old)*100/xi); %módulo do Erro percentual estimado
    end
    fprintf('%d\t\t\t %f\t\t %f\t\t %f\t\t %f\t\t %f\t\n', iter, xi, f(xi), df(xi), Ea, Et);
    
    x_old = xi; %x anterior
    xi = xi-(f(xi)/df(xi)); %a próxima solução obtida pela atual
    x_new = xi; %x atual
    
    iter=iter+1;
end
toc %tempo de execução

disp('***************************************************************************************************************');
