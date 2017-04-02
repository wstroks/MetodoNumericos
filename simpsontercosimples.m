%Integração numérica pela regra Simpsom 1/3 simples

function [resultado, erro_estimado, erro_percentual_relativo] = simpsontercosimples(funcao, limite_inferior, limite_superior, qtd_intervalos, valor_exato)

f = funcao;
a = limite_inferior;
b = limite_superior;

n = 2;
hs = (b-a)/n;
x = a: hs: b;
y = f(x);
resultado = hs/3 * sum([1 4 1].*y);

erro_estimado = valor_exato-resultado;
erro_percentual_relativo = abs(valor_exato - resultado)/valor_exato;
erro_percentual_relativo= erro_percentual_relativo*100;