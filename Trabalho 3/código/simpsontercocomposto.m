%Integração numérica pela regra Simpsom 1/3 composta

function [resultado, erro_estimado, erro_percentual_relativo] = simpsontercocomposto(funcao, limite_inferior, limite_superior, qtd_intervalos, valor_exato)
a = limite_inferior;
b = limite_superior;
n=qtd_intervalos;

hs=(b-a)/(2*n);
x= a:hs:b;
y= funcao(x);
x_atual=0;
    for i=1:n
        x_atual = x_atual + y(2*i-1) + 4*y(2*i) +y(2*i+1);
    end

resultado=(hs/3)*x_atual;

%calculo do erro percentual relativo
erro_percentual_relativo = abs(valor_exato - resultado)/valor_exato;
erro_percentual_relativo = erro_percentual_relativo*100;


%calculo do erro estimado
h = (limite_superior-limite_inferior);
primeira_derivada= diff(diff(diff(diff(funcao))));
g = primeira_derivada*-1;

x_max = fminbnd(matlabFunction(g), limite_inferior, limite_superior);
%erro_estimado= ((h^4)*(limite_superior-limite_inferior)/180)*primeira_derivada(x_max);
erro_estimado= (((h)^5)/(180*(4^4))) * primeira_derivada(x_max);
%erro_estimado=valor_exato-resultado;
disp (primeira_derivada);
disp(x_max);