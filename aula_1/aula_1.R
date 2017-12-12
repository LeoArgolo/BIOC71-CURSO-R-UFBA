######################################################
# Introdu??o Linguagem R
# Vitor Passos Rios
# Universidade Federal da Bahia
# https://github.com/vrios/Intro-Linguagem-R/wiki
#####################################################
#mudanca1
#####Usando o R como calculadora#####

#Digite no R os c?digos abaixo.
#Dica: escreva neste arquivo, ao lado do comando, o que ele faz,
#como no exemplo abaixo

1 + 1 #soma os valores 

# O s?mbolo # representa um coment?rio, isto ?, tudo que vier ? direita
# dele ser? ignorado quando o R ler o arquivo

34 - 72.3 #Subtrai 72.3 de 34. O resultado ? -38.3

# use pontos como separador de decimal. O que acontece se voc? usar virgula? 
# Por n?o reconhecer v?rgula como separador de decimais, resulta na mensagem "Error: unexpected ',' in "34 - 72,""


78 / 3 #Divide 78 por 3. Resulta em 26
2 ^ 3 #Eleva 2 ao cubo. Resulta em 8
3 * 2 #Multiplica 3 por 2. Resulta em 6
sqrt(2) #Calcula a raiz quadrada de 2. Resulta em 1.414214
pi # Exibe o valor de pi em seis casas decimais (3.141593)
log(x = 3,base = 10) #Calcula o log de 3 na base 10. Resulta em 0.4771213
exp(x = 1) #Computa a fun??o exponencial de 1. Resulta em 2.718282
#o que querem dizer estes valores dentro do par?ntese? porque usamos o = aqui?
#"x" e "base" s?o os argumentos da fun??o log para vetor num?rico e base logaritmica. O s?mbolo "=" ? usado para atribuir valores aos objetos.

#####Atribui??o de valores e cria??o de objetos#####
#O que os comandos abaixo fazem?
objeto1=3 #Cria o objeto1 que cont?m o elemento 3
objeto1 #Exibe o conte?do de objeto1
objeto = 42 #Cria outro objeto nomeado "objeto" que cont?m o elemento 42
objeto #Exibe o conte?do de "objeto"
objeto.2 <- 42 #Cria um novo objeto nomeado "objeto.2" contendo o valor 42
objeto.2 #Exibe o conte?do de objeto.2
# Os s?mbolos = e <- fazem basicamente a mesma coisa. Que coisa?
# Estes s?mbolos s?o operadores de atribui??o utilizados para inserir elementos no objeto especificado.
objeto.cubico <- objeto^3 #Cria o "objeto.cubico" que cont?m o valor resultante da opera??o 42 elevado ao cubo.
resultado.1 <- (objeto.cubico / 3) + 7 #Cria o objeto "resultado.1", que representa valor esultante da opera??o (74088 / 3) + 7
objeto.texto <- "texto sempre vem entre aspas" #Cria um objeto de texto com a frase entre as aspas
objeto.texto #Exibe o texto do objeto
objeto.texto.2 <- "42" #Cria um objeto contendo o n?mero 42 como texto

objeto.vetor.1 = 1:34 #Cria um objeto com a sequ?ncia de n?meros de 1 a 34 com intervalo de 1
objeto.vetor.1 #Exibe o conte?do do objeto.vetor.1
objeto.vetor2 = c(1, 74.5, 48) #Cria o "objeto.vetor2" com o conjunto de elementos indicados entre par?nteses
objeto.vetor2 #Exibe o conte?do do objeto.vetor2

?seq #Exibe a ajuda para a fun??o seq no canto direito inferior da tela dentro da aba "help"
objeto.vetor3 = seq(from = 20, to = 32, by = 0.5) #Cria um objeto com valores entre 20 e 32 com intervalo de 0.5

#podemos calcular estat?sticas com o r
mean(objeto.vetor3) #media 
var(objeto.vetor3) #variancia
median(objeto.vetor3) #mediana
min(objeto.vetor3) #menor elemento dentro de "objeto.vetor3"
max(objeto.vetor3) #maior elemento dentro de "objeto.vetor3"
diff(objeto.vetor3) #calcula a diferen?a entre os elementos sucessivos do vetor

# R tamb?m faz compara??es entre objetos
42 > 7 #Verifica se o n?mero 42 ? maior que o n?mero 7
objeto == objeto.2 #Verifica se o conte?do de "objeto" ? exatamente igual a "objeto.2"
objeto == objeto.texto.2 #O mesmo que a linha acima, por?m os dois objetos diferem no tipo de elemento (n?mero e texto, respectivamente)
# o que aconteceu acima?
# Todos os comandos resultaram em "TRUE"
7.1 <= 7.001 #Verifica se o primeiro valor ? menor ou igual ao segundo. Resulta em "FALSE"
?"<" #Exibe a ajuda para operadores de rela??o, incluindo "<"
#pedindo ajuda
?pi #Exibe a ajuda para a funcao Constant, que inclui o valor de pi
?log #Exibe a ajuda para a funcao log, sobre logaritmos e exponenciais 
??lm #Exibe todas as p?ginas de ajuda que cont?m a expressao desejada, no caso "lm"
help(log) #Maneira alternativa para exibir a ajuda da fun??o log 
help.search("anova") #Maneira alternativa de exibir todas as p?ginas de ajuda que cont?m uma palavra-chave, no caso "anova"

#####Arquivos e diretorios#####
# Como voc? descobre o diret?rio de trabalho?
#Usando fun??o getw()
# Como voc? lista o conte?do do diret?rio de trabalho?
#Usando a fun??o dir()
# Como voc? define o diret?rio de trabalho?
#Usando a fun??o setwd()
# Como voc? carrega um arquivo de script?
#Por meio dos menus File>Open File ou do atalho Ctrl + O
# Como voc? salva os objetos que criou?
#Utilizando o comando "save". (Ex: save(luz, file = "nomedoarquivo.RData"))
# Como voc? carrega os objetos que criou?
#Utilizando o comando "load". (Ex: load(file="nomedoarquivo.RData"))
# Como ver quais objetos est?o na sua ?rea de trabalho?
#Usando o comando ls()
# Como remover objetos da ?rea de trabalho?
#Usando o comando rm()

##### Lidando com erros#####
# O que acontece quando voc? digita os comandos abaixo? Como consertar cada erro?
objetol #Retorna a mensagem "Error: object 'objetol' not found". Para consertar basta remover o "l" do comando
objeto .texto # Retorna a mensagem "Error: unexpected symbol in "objeto .texto", por conta de um espaco entre objeto e .texto. Basta remover o espa?o
Objeto #O R diferencia letras maiusculas e minusculas e por isso "Objeto" n?o ? encontrado. Para consertar, deve-se escrever "objeto" com a letra "o" em min?sculo .
source("chuchu.R") #L? um c?digo a partir de um arquivo externo. N?o funciona pois o arquivo com este nome n?o existe.
source(chuchu.R) #O mesmo que o comando anterior, por?m falta as aspas no nome do arquivo
setwd("C:/CavernaDoDrag?o") #Altera a pasta de trabalho atual para o caminho entre par?nteses. Consertar definindo um diret?rio v?lido
getwd #Exibe o diret?rio de trabalho atual. Consertar incluindo os par?nteses
Getwd() #Mesmo comando acima, porem tambem nao funciona por conta da inicial maiuscula. Consertar colocando a inicial min?scula
#dica: quando o R der erro, copie e cole a mensagem de erro no google
