%Integração numérica pela regra trapezoidal composta

function [resultado, erro_estimado, erro_percentual_relativo] = itp(funcao, limite_inferior, limite_superior, qtd_intervalos, valor_exato)
 
offset = (limite_superior-limite_inferior)/qtd_intervalos;
x_atual = limite_inferior;
 
resultado =funcao(limite_inferior);
for k=2:qtd_intervalos
    x_atual  = x_atual + offset;
    resultado = resultado + 2. * funcao(x_atual);

end
resultado = (resultado + funcao(limite_superior)) * offset * 0.5;

%Cálculo do erro percentual relativo
erro_percentual_relativo = abs(valor_exato - resultado);
erro_percentual_relativo = (erro_percentual_relativo/valor_exato)*100;
h = (limite_superior-limite_inferior)/qtd_intervalos;
%Cálculo do erro estimado
erro_estimado = (limite_superior-limite_inferior)*((h^2)/12);
dd_funcao = (diff(diff(funcao)));
g = dd_funcao*-1;

x_max = fminbnd(matlabFunction(g), limite_inferior, limite_superior);
erro_estimado = erro_estimado * abs(dd_funcao(x_max)) ;
