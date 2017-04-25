%%Axx = [0,1,2,3,4,5,6,7,8];
%%Bxx = [0.1,0.2,0.3,0.4,1,2,3,4,5];
%%[a,b] = AjusteExponencial(Axx,Bxx);
%%[a,b] = RegressaoLinear(Axx,Bxx);

syms x; 
funcao(x) = 0.2 + 25*x - 200*x^2 + 675*x^3 - 900*x^4 + 400*x^5;
limite_inferior = 0;
limite_superior = 0.8   ;
qtd_intervalos = 2;
valor_exato = 1.64053334;


disp('---Solução através da Regra Trapeizodal Simples---')
[resultado_1, erro_estimado_1, erro_percentual_relativo_1] = its(funcao, limite_inferior, limite_superior, qtd_intervalos, valor_exato);
disp(sprintf('Resultado da integração: %f', double(resultado_1)));
disp(sprintf('Valor exato: %f', double(valor_exato)));
disp(sprintf('Erro percentual relativo %f porcento', double(erro_percentual_relativo_1)));
disp(sprintf('Erro estimado: %f', double(erro_estimado_1)));
disp('\n\n')

disp('---Solução através da Regra Trapeizodal Composta---')
[resultado_2, erro_estimado_2, erro_percentual_relativo_2] = itp(funcao, limite_inferior, limite_superior, qtd_intervalos, valor_exato);
disp(sprintf('Resultado da integração: %f', double(resultado_2)));
disp(sprintf('Valor exato: %f', double(valor_exato)));
disp(sprintf('Erro percentual relativo %f porcento', double(erro_percentual_relativo_2)));
disp(sprintf('Erro estimado: %f', double(erro_estimado_2)));
disp('\n\n')

disp('---Solução através de Simpson 1/3 simples---')
[resultado_3, erro_estimado_3, erro_percentual_relativo_3] = simpsontercosimples(funcao, limite_inferior, limite_superior, qtd_intervalos, valor_exato);
disp(sprintf('Resultado da integração: %f', double(resultado_3)));
disp(sprintf('Valor exato: %f', double(valor_exato)));
disp(sprintf('Erro percentual relativo %f porcento', double(erro_percentual_relativo_3)));
disp(sprintf('Erro estimado: %f', double(erro_estimado_3)));
disp('\n\n')

disp('---Solução através de Simpson 1/3 composta---')
[resultado_4, erro_estimado_4, erro_percentual_relativo_4] = simpsontercocomposto(funcao, limite_inferior, limite_superior, qtd_intervalos, valor_exato);
disp(sprintf('Resultado da integração: %f', double(resultado_4)));
disp(sprintf('Valor exato: %f', double(valor_exato)));
disp(sprintf('Erro percentual relativo %f porcento', double(erro_percentual_relativo_4)));
disp(sprintf('Erro estimado: %f', double(erro_estimado_4)));
disp('\n\n')

disp('---Solução através do método de Simpson 3/8---')
[resultado_5, erro_estimado_5, erro_percentual_relativo_5] = simpsonoitavo(funcao, limite_inferior, limite_superior, qtd_intervalos, valor_exato);
disp(sprintf('Resultado da integração: %f', double(resultado_5)));
disp(sprintf('Valor exato: %f', double(valor_exato)));
disp(sprintf('Erro percentual relativo %f porcento', double(erro_percentual_relativo_5)));
disp(sprintf('Erro estimado: %f', double(erro_estimado_5)));
disp('\n\n')

nomes = {'Trapezoidal S', 'Trapezoidal C', 'Simpson 1/3 S', 'Simpson 1/3 C', 'Simpsom 3/8 S'}
resultados = [resultado_1, resultado_2, resultado_3, resultado_4, resultado_5] 
erros_estimados = [erro_estimado_1, erro_estimado_2, erro_estimado_3, abs(erro_estimado_4), abs(erro_estimado_5)]
erros_percentuais = [erro_percentual_relativo_1, erro_percentual_relativo_2, erro_percentual_relativo_3, erro_percentual_relativo_4, erro_percentual_relativo_5]

fprintf('\n\n\n\n\n*******************************************************************************\n');
fprintf('M�todo \t\t\t\t\t Resultado \t\t\tErro Estimado \t\tErro Percentual \t\t\t\n');

for i = 1:5
    fprintf('%s\t\t\t %.8f\t\t\t %.8f\t\t\t %.8f\t\t\t \n', char(nomes(i)), double(resultados(i)), double(erros_estimados(i)), double(erros_percentuais(i)));
end;
fprintf('*******************************************************************************\n');


