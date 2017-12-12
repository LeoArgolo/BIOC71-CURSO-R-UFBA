######################################################
# Toroidal distance calculator                    ####
# Vitor Passos Rios                               ####
# Universidade Federal da Bahia                   ####
# https://github.com/vrios/Intro-Linguagem-R/wiki#####
######################################################
#mudanca3
#                    (Aula 3)                     #### 
# Disciplina - Introducao ao R                    ####
# Discente: Leandro Araujo Argolo                 ####
#                                                 ####
######################################################

#diferencie a funcao source da funcao load()
#A funcao source() ? utilizada para executar todo o conteudo de um arquivo de codigo. Especialmente util para carregar funcoes especificas ou scripts de analise.
#a funcao load(), por sua vez, ? utilizada para carregar arquivos criados com as funcoes save() e save.image().

#baixe para seu diretorio de trabalho o arquivo toroidal.distance.R, disponivel
#em https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/toroidal.distance.R, e o arquivo distancias.csv, disponivel em https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/distancias.csv

#Abra toroidal.distances.R no R
# O que voce precisa fazer para que as funcoes contidas nesse arquivo estejam disponiveis para uso no R?

#utilizar a funcao source(). Apos carregar o codigo, as funcoes estarao disponiveis para uso no R.

# Faca o procedimento que voce descreveu acima
#mudanca3.2
source("toroidal.distance.R")
toroidal.distance()
toroidal.distances()

# dentro do script toroidal.distance.R, altere o nome da funcao toroidal.distances para distance.matrix (substitua o nome dentro do arquivo) e salve o arquivo

source("toroidal.distance.R") 

# Carregue o arquivo distancias.csv para dentro do objeto distancias
#chame a funcao distance.matrix() com o objeto distancias, e o argumento tam = 10

distancias = read.table("distancias.csv", header = T, sep = ",", dec = ".")
distance.matrix(distancias, tam = 10)

# o que aconteceu?
#retornou uma matriz de distancias onde o resultado da matriz depende do valor inserido no argumento "tam"

# O que voce precisa fazer para que voce possa usar a funcao distance.matrix?
#carregar novamete o codigo da arquivo "toroidal.distance.R" pela funcao source() apos modificar o nome da funcao dentro do arquivo.

# Usando a linha de comando, importe o arquivo dragoes.xsls para o objeto DnD

install.packages("writexl")
install.packages("readxl")
library(writexl)
library(readxl)
DnD = read_xlsx("dragoes.xlsx")

# Confira a estrutura do arquivo

str(DnD)

# Ha algum NA? houve algum problema com o cabecalho? 

#Sim. Alem do NA da observacao faltante, tambem existem NA's na primeira coluna que especifica dados de coleta e deve ser removida para as an?lises dos dados. Desconsiderando a primeira coluna, o cabecalho foi lido corretamente mas possui caracteres (parenteses e til) que causar?o problemas em an?lises posteriores. 

colnames(DnD) = c("peso em centenas de kg", "dragao identidade", "vacas", "fazendeiros", "virgens", "aventureiros") # para substituir os caracteres problematicos do cabecalho


# Refaca o script da aula 2, salvando o objeto caixeta com a coluna coletor e desvio em um arquivo chamado caixeta_com_desvio.csv

caixeta = read.table("caixeta.csv", header=T, sep=",", as.is=T)
head(caixeta)
caixeta$coletor = "Darwin" 
caixeta$desvio = (caixeta$h - mean(caixeta$h))
write.csv(x = caixeta, file = "caixeta_com_desvio.csv")

verificando = read.table("caixeta_com_desvio.csv", header = T, sep = ",", dec = ".")
