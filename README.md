# MetodoNumericos
# trabalho feito por Washington e Hugo
Crie um programa que faça a leitura de uma definição de Gramática Livre de Contexto em arquivo e analise a entrada do usuário. Após a leitura do arquivo, o programa deve solicitar uma string ao usuário e informar se ela faz parte da gramática ou não.

O arquivo da gramática terá o formato abaixo:

1
2
VARIAVEL1:PRODUCAO1|PRODUCAO2|...
VARIAVEL2:=PRODUCAO3|PRODUCAO4|...
Cada linha contém uma variável (não-terminal), seguido de ”:=” e as regras de produção, que podem ser separadas por um ”|”. Todas as variáveis serão identificadas por letras maiúsculas enquanto que os terminais poderão ser letras minúsculas (exceto a letra ”e”), operadores (+, -, *, /), números e parênteses. A produção vazia é representada por um ”e”. Veja o exemplo abaixo:

Não é preciso se preocupar com outros caracteres. Apenas os citados acima serão usados nos testes.

Veja três exemplos de arquivos de gramática:

1
S:=(S)|0
1
2
3
4
S:=if E then S else S|if E then S|comando
E:=NON
N:=0|1|2|3|4|5|6|7|8|9
O:=+|-|*|/
1
2
3
4
S:=AB|e
A:=Aa
A:=e
B:=Bb|e
