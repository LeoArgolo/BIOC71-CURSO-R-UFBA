                                      ###########################################
                                      ###              (Aula 4)               ### 
                                      ###   Disciplina - Introducao ao R      ###
                                      ###   Discente: Leandro Araujo Argolo   ###
                                      ###########################################
#mudanca4
                                      
riqueza <- c(15,18,22,24,25,30,31,34,37,39,41,45)
area <- c(2,4.5,6,10,30,34,50,56,60,77.5,80,85)
area.cate <- rep(c("pequeno", "grande"), each=6)

plot(riqueza~area) #Exibe um grafico de dispersao de acordo com os objetos criados (riqueza e area) 
plot(area,riqueza) # Exibe o mesmo grafico que o comando acima
boxplot(riqueza~area.cate) # Exibe um boxplot dos dados. Este tipo de grafico ? utilizado quando as vari?veis s?o categ?ricas
barplot(riqueza) # Exibe um grafico de barras dos dados. 

#### Exerc?cio 1 - Fazendo os Primeiros Gr?ficos ####
## Construa "plot", boxplot e barplot usando as vari?veis do conjunto de dados Conjunto de Dados: Dados de Biomassa de ?rvores de 
## Eucalyptus Saligna, para explorar rela??es entre:
##  
## dap e ht  
## ht e tronco
## dap e classe
## dap e talhao
## dap
## ht
## Note: barplot s? aceita uma vari?vel


eucalipto <- read.csv("esaligna.csv", head=T, sep=",", dec=".")


eucalipto

plot(eucalipto$dap~eucalipto$ht)  
plot(eucalipto$ht~eucalipto$tronco) 
plot(eucalipto$dap~eucalipto$classe) 
plot(eucalipto$dap~eucalipto$talhao) 


boxplot(eucalipto$dap~eucalipto$ht) 
boxplot(eucalipto$ht~eucalipto$tronco) 
boxplot(eucalipto$dap~eucalipto$classe)
boxplot(eucalipto$dap~eucalipto$talhao)


barplot(eucalipto$dap)
barplot(eucalipto$ht)


par(las=1)
plot(riqueza~area, las=3) 

par(cex=2)
plot(riqueza~area, cex=2) 

#####Exerc?cio 2 - Aprendendo a Editar Gr?ficos####
##Entre no R e digite:
  
?plot #exibe a ajuda da funcao plot

##Agora, usando as vari?veis:
  
riqueza <- c(15,18,22,24,25,30,31,34,37,39,41,45)
area <- c(2,4.5,6,10,30,34,50,56,60,77.5,80,85)

##Mude:
 
## O nome do eixo x para "Tamanho da Ilha (ha)"

plot(riqueza~area, xlab = "Tamanho da Ilha (ha)")

## O nome do eixo y para "Riqueza de Esp?cies"

plot(riqueza~area, xlab = "Tamanho da Ilha (ha)", ylab = "Riqueza de Esp?cies")

## O t?tulo do gr?fico para "Aves das Ilhas Samoa"

plot(riqueza~area, xlab = "Tamanho da Ilha (ha)", ylab = "Riqueza de Esp?cies", main = "Aves das Ilhas Samoa")

##Agora entre no:
  
?par #exibe a ajuda da funcao par

## Usando o mesmo gr?fico anterior, mude:

## O tipo de ponto (numero de 0 a 25)

plot(riqueza~area, xlab = "Tamanho da Ilha (ha)", ylab = "Riqueza de Esp?cies", main = "Aves das Ilhas Samoa", cex = 1.2)
     
## O tamanho dos pontos e legendas

par(cex = 1) 
plot(riqueza~area, xlab = "Tamanho da Ilha (ha)", ylab = "Riqueza de Esp?cies", main = "Aves das Ilhas Samoa", cex = 1.2)

## A dire??o da escala do gr?fico (para ficar tudo na horizontal)

plot(riqueza~area, xlab = "Tamanho da Ilha (ha)", ylab = "Riqueza de Esp?cies", main = "Aves das Ilhas Samoa", las = 3)

## O tipo de fonte das legendas (para ficar tudo como em Times New Roman - dica= "serif")

plot(riqueza~area, xlab = "Tamanho da Ilha (ha)", ylab = "Riqueza de Esp?cies", main = "Aves das Ilhas Samoa", family = "serif")

par()

#Exemplos de par(mfrow=c())

par(mfrow=c(2,1), bg="gray93") # o argumento mfrow determina o numero de graficos ou figuras serao exibidas em um dispositivo de forma similar a uma tabela controlada por (x,y) ou, explicitamente, (numero de linhas, numero de colunas).

plot(riqueza~area)
boxplot(riqueza~area.cate)

par(mfrow=c(1,2))
plot(riqueza~area)
boxplot(riqueza~area.cate)

#Exemplos de par(mar=c())

par(mfrow=c(2,1))
par(mar=c(4,14,2,6))
plot(riqueza~area)
boxplot(riqueza~area.cate)

par(mfrow=c(1,2))
par(mar=c(14,4,8,2))
plot(riqueza~area)
boxplot(riqueza~area.cate)

par(mfrow=c(1,2))
par(mar=c(8,4,8,1))
plot(riqueza~area)
par(mar=c(14,2,4,0.5))
boxplot(riqueza~area.cate)

####Exerc?cio 3 - Mudando diferentes gr?ficos####
## Com as vari?veis:

riqueza <- c(15,18,22,24,25,30,31,34,37,39,41,45)
area <- c(2,4.5,6,10,30,34,50,56,60,77.5,80,85)
area.cate <- rep(c("pequeno", "grande"), each=6)

## crie

plot(riqueza~area)

##E agora:

plot(riqueza~area, bty="l", tcl=0.3)

#Perecebeu o que mudou? # As linhas superior e direita foram removidas e os tra?os de cada valor foram movidos para o interior do grafico

#Agora tente:

boxplot(riqueza~area.cate, bty="l", tcl=0.3)

#O que aconteceu? # mudou para um boxplot


#E agora?

par(bty="l")
par(tcl=0.3)
boxplot(riqueza~area.cate) #mesmas mudancas da remocao das linhas e direcao dos tracos


# Viu so?

?lines


####Exerc?cio 4####

#Usando as variaveis:

riqueza <- c(15,18,22,24,25,30,31,34,37,39,41,45)
area <- c(2,4.5,6,10,30,34,50,56,60,77.5,80,85)
abundancia <- rev(riqueza)

#Crie graficos inserindo os par?metros abaixo.
#lines() Para inserir linhas retas ou curvas nao-param?tricas (como lowess, loess, gam, etc)

plot(riqueza~area)
lines(lowess(area, riqueza))

#abline() Para inserir linhas de tendencia criadas a partir de um modelo linear. Para isso ? primeiro necessario criar o modelo, para depois criar a linha

model <-  lm(riqueza~area)
plot(riqueza~area)
abline(model)

#Com a funcao abline voce pode tambem inserir uma linha reta com intercepto e inclinacao definidos por voce, com os dois primeiros argumentos:

plot(riqueza~area)
abline(15,0.4)

#A funcao abline tambem serve para acrescentar linhas verticais e horizontais, com os argumentos v e h. No codigo abaixo tracamos estas linhas passando pelas medias das duas variaveis do diagrama de dispersao:

plot(riqueza~area)
abline(v=mean(area))
abline(h=mean(riqueza))

#text() Para inserir texto dentro do grafico. O texto pode ser uma letra, um simbolo (muito usado para mostrar diferenciar classes no gr?fico), uma palavra ou ate mesmo uma frase

plot(riqueza~area)
text(20,40,"texto")

#mtext() Adiciona texto nas margens do grafico ou da janela grafica

plot(riqueza~area)
mtext("legenda no lado errado", side=4, line=0.9, at=20,cex=2, family="serif")

#par(new=TRUE) sobrep?e um grafico ja existente 

plot(riqueza~area)
par(new=TRUE)
plot(abundancia~area)

#axis() insere um novo eixo

plot(riqueza~area)
par(new=TRUE)
plot(abundancia~area, axes=FALSE, ann=FALSE, pch=16)
axis(4)

#Aqui no caso ser? necess?rio usar axes=F para suprimir a cria??o dos eixos do gr?fico inicial de abund?ncia e ann=F para suprimir a legenda de abund?ncia do lado direito. Para para diferenciar os pontos entre os dois plots usar pch=16, ou qualquer outro n?mero. Para inserir a legenda de abund?ncia do lado direito ser? necess?rio usar mtext(), mas da? ser? necess?rio mudar outros par?metros como dist?ncia da margem.

#arrows(), rect(), polygon()

plot(riqueza~area)
rect(20,20,40,40) # para inserir um retangulo de acordo com os limites indicados entre parenteses

jpeg(filename = "Algumnome.jpg") # funcao para criar arquivo jpeg. filename indica o nome do arquivo a ser salvo 

jpeg(filename = "Rplotaula.jpg", width = 480, height = 480, 
     units = "px", pointsize = 12, quality = 100,
     bg = "white",  res = NA, restoreConsole = TRUE)

par(mfrow=c(1,2))
par(mar=c(14,4,8,2))
plot(riqueza~area)
boxplot(riqueza~area.cate)

dev.off()

#png("meugrafico%02d.png") grava uma sequencia de graficos com ate 2 digitos, ou seja, at? 99 graficos.


                                          

                                               #######################
                                               ####  Exercicio 2  ####
                                               #######################



#Exerc?cios 5 - Cria??o de Gr?ficos

#Usando o conjunto de dados Conjunto de Dados: Dados de Biomassa de ?rvores de Eucalyptus Saligna, construa os seguintes gr?ficos:

eucalipto  = read.table("esaligna.csv", header=T, sep=",", dec=".")

####5.1 Editando alguns par?metros gr?ficos####

#Crie um gr?fico de dispers?o entre "dap"1) e "ht"2) com:

plot(eucalipto$dap~eucalipto$ht)

#Legendas dos eixos com nomes das vari?veis e suas unidades
#Marca??es do eixos (ticks) para dentro da ?rea do gr?fico
#Apenas dois eixos (formato "L")
#T?tulo informativo
#Tamanho das fontes maiores que o padr?o


plot(eucalipto$dap~eucalipto$ht, xlab="Altura (m)", ylab="Di?metro ? altura do peito (cm)", cex.lab=1.3, tcl=0.3, bty="l", cex.axis=1.3, main="Rela??o entre DAP e altura", cex.main=1.3)


####5.2 Dois gr?ficos juntos####

#Use as vari?veis "dap" e "talhao" para construir dois gr?ficos, colocando-os lado a lado. O primeiro deve ser um gr?fico de desenho de caixa (boxplot) da vari?vel "dap" em fun??o do fator "talh?o". O segundo deve ter apenas a m?dia e uma barra de desvio-padr?o do dap, para cada talh?o.

#Insira tamb?m uma letra para dizer qual ? o gr?fico "a" e qual ? o "b" (tanto faz, quem ? um e quem ? outro).

#Dica: voc?s ter?o que calcular a m?dia e os desvios-padr?o do dap das ?rvores em cada talh?o. Depois crie uma matriz com estes valores e crie o plot destes valores.

boxplot(eucalipto$dap~eucalipto$talhao) #boxplot de dap em fun??o de talhao

eucalipto$talhao=as.factor(eucalipto$talhao)

media.ldap = aggregate(x=eucalipto$dap,by = list(eucalipto$talhao), FUN = mean, na.rm=T)
desvio.ldap = aggregate(x=eucalipto$dap,by = list(eucalipto$talhao), FUN = sd, na.rm=T)

(matriz.ldap = matrix(c(media.ldap$x, desvio.ldap$x),ncol=2))


# Grafico a
par(mfrow = c(1,2))
boxplot(eucalipto$dap~eucalipto$talhao, ylab="DAP", xlab="Talh?o")
mtext("a")

# Grafico b
(y0=media.ldap$x-desvio.ldap$x)
(y1=media.ldap$x+desvio.ldap$x)
(limite=range(max(y1),min(y0)))

plot(media.ldap$x, ylab="DAP (m?dia)", xlab="Talh?o",  ylim = limite)
arrows(x0=1:6, y0=media.ldap$x-desvio.ldap$x, x1=1:6, y1=media.ldap$x+desvio.ldap$x, length = 0.05, angle = 90, code = 3)
mtext("b")



#####5.3 Adivinhando o c?digo####
#Leia os dados deste arquivo e usando as vari?veis "x1" e "y1" e "x2" e "y2" tente reproduzir esta figura:

exercicio3 = read.csv("exercicio3.csv", header=T, sep=",", dec=".")

par(mfrow=c(1,2)) # determina o numero de graficos poss?veis no espaco do dispositivo
par(bty="l", tcl=0.2, family="serif") # remove as linhas superior e direita e indica a fonte
par(mar=c(4,4,2,2)) #ajusta o tamanho das margens
dados = lm(y1~x1,data=exercicio3) #salva dentro do objeto "dados", um modelo linear que contem as informacoes para plotar a linha no primeiro grafico

#Grafico a

plot(exercicio3$x1,exercicio3$y1
     ,ylim=c(0,3)
     ,ylab= expression(bold("Euclidean distances"))
     ,xlim = c(0.5,2.2)
     ,cex.lab=1
     ,cex.axis=0.75 
     ,xlab="Log(Patch size) (ha)"
     ,pch=17 
     ,cex=1
     ,mgp=c(1.5,0.6,0)) 
#abline(dados,lwd=2.5, col="green") #apesar de plotar, a linha de modelo linear nao se parece com a do grafico que temos que reproduzir 
segments(x0=0.5, y0=2.2, x1=2.2, y1=1, lwd=2.5)
text(2.5,3,"a",cex=1.5)
#mudanca4.2
#Grafico b
par(mgp=c(0.9,0.7,0))
boxplot(x2~y2, data=exercicio3
        ,ylim=c(0,3) 
        ,names=c("Small", "Medium \n Edge","Medium \n Interior", "Large \n Edge", "Large\n Interior", "Control")
        ,ylab=NULL 
        ,xlab=NULL
        ,cex.lab=0.85 
        ,cex.axis=0.75
        ,outline=F)
text(6,3,"b",cex=1.5) 
text(x=1:5, y=3, labels=c("*", "*","**","*","***"), cex=1.5)