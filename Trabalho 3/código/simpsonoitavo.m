%Integração numérica pela regra Simpsom 3/8 composta

function [resultado, erro_estimado, erro_percentual_relativo] = simpsonoitavo(funcao, limite_inferior, limite_superior, qtd_intervalos, valor_exato)

a = limite_inferior;
b = limite_superior;
n=qtd_intervalos;

hs=(b-a)/(3);

x_atual= funcao(a) + funcao(b) + 3*funcao(a+hs) + 3*funcao(b-hs);

resultado=((3*hs)/8)*x_atual;

%calculo do erro percentual relativo
erro_percentual_relativo = abs(valor_exato - resultado)/valor_exato;
erro_percentual_relativo = erro_percentual_relativo*100;


%calculo do erro estimado
erro_estimado = valor_exato-resultado;