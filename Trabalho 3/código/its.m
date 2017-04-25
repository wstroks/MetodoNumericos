%Integra��o num�rica pela regra trapezoidal simples
 
function [resultado, erro_estimado, erro_percentual_relativo] = its(funcao, limite_inferior, limite_superior, qtd_intervalos, valor_exato)

y = limite_inferior:limite_superior:limite_superior;
x=funcao(y);
resultado = trapz(y,x);



%C�lculo do erro percentual relativo
erro_percentual_relativo = abs(valor_exato - resultado)/valor_exato;
erro_percentual_relativo = erro_percentual_relativo*100;
 
%C�lculo do erro estimado
erro_estimado = ((limite_superior-limite_inferior)^3)/12;
dd_funcao = (diff(diff(funcao)));
g = dd_funcao*-1;
x_max = fminbnd(matlabFunction(g), limite_inferior, limite_superior);

erro_estimado =  abs(erro_estimado * dd_funcao(x_max));