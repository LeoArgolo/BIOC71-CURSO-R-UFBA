######################################################
# Introdu√ß√£o Linguagem R
# Vitor Passos Rios
# Universidade Federal da Bahia
# https://github.com/vrios/Intro-Linguagem-R/wiki
#####################################################

#quando possÌvel, sua resposta deve ser um c√≥digo do 

#####Trabalhando com dados#####
# o que √© um dataframe? Qual a diferen√ßa entre um dataframe e um list? 
# Lista È conjunto de objetos independente do tipo, dataframe È uma tabela com colunas do mesmo tipo.
# o que as fun√ß√µes abaixo fazem? O que elas retornam?
is.vector(aves.c) # Pergunta se o objeto especificado È um vetor. Retorna FALSE (caso o objeto seja um vetor) ou TRUE, caso o objeto seja um vetor.
is.numeric(aves.c) # Pergunta se o objeto especificado È um n˙mero. Retorna TRUE ou FALSE.
is.character(aves.c) # Pergunta se o objeto especificado È um caractere. Retorna TRUE ou FALSE.
is.matrix(peso) # Pergunta se o objeto especificado È uma matriz. Retorna TRUE ou FALSE.
is.na(aves.c) # Pergunta se os valores que est„o no objeto s„o NA. Retorna TRUE ou FALSE.
is.data.frame(aves.c) #Pergunta se o objeto especificado È um Dataframe. Retorna TRUE ou FALSE.


#O que queremos dizer quando dizemos uma fun√ß√£o "retorna" alguma coisa?
# Que ela exibe um resultado do comando executado 

#o que a funÁ„o summary() faz?
#Exibe resultados de v·rias estatÌsticas sum·rias para o objeto especificado


#TrÍs ·reas foram submetidas aplicaÁ„o de trÍs adubos diferentes, e uma foi
#mantida como controle. A biomassa seca (kg) por parcela foi medida para
#verificar se houve efeito do adubo. Os dados obtidos foram:

#(Controle)	A	37	34	36	42	31  33
#B	62	54	57	64	60
#C	63	58	60	62	61 44
#D	41	37	38	49	35 49
#Crie um dataframe com estes dados

biomassa = c(37,34 ,36, 42, 31, 33, 62, 54, 57, 64, 60, 63, 58, 60, 62, 61, 44, 41, 37, 38, 49, 35, 49)
tratamentos = c(rep("A", 6), rep("B", 5), rep("C", 6), rep("D", 6))
adubo = data.frame(tratamentos, biomassa)
adubo

#Calcule a m√©dia de cada tipo de adubo, sem usar summary(), usando o dataframe
#que voc√™ criou acima
media.a = mean(adubo$biomassa[adubo$tratamentos == "A"])
media.b = mean(adubo$biomassa[adubo$tratamentos == "B"])
media.c = mean(adubo$biomassa[adubo$tratamentos == "C"])
media.d = mean(adubo$biomassa[adubo$tratamentos == "D"])

#que problemas voc√™ teve ao fazer o exerc√≠cio acima?

# O que a fun√ß√£o unique() faz?
# Exibe uma lista apenas com os objetos ˙nicos, removendo elementos ou colunas duplicados

#Usando o conjunto de dados caixeta.csv, disponivel em
#http://ecologia.ib.usp.br/bie5782/doku.php?id=dados:dados-caixeta, calcule
#quantas esp√©cies est√£o presentes na coluna especie. Para ler o arquivo, execute
#o c√≥digo abaixo
caixeta = read.table("caixeta.csv", header=T, sep=",", as.is=T)
# o arquivo deve estar no seu diret√≥rio de trabalho
unique(caixeta$especie) # 43 esp√©cies
str(caixeta) #o que este comando faz?
#Exibe a estrutura interna resumida do objeto 

summary(caixeta)

#podemos criar uma coluna a mais no nosso dataframe apenas dizendo ao R o que
#colocar l·. Por exemplo, criamos uma coluna com o nome do coletor do dado
caixeta$coletor = "Darwin" #regra da reciclagem
str(caixeta)
caixeta
#agora adicione no objeto caixeta uma coluna chamada "desvio" com o quanto a
#altura de cada √°rvore difere da m√©dia de todas as √°rvores
media.alt = mean(caixeta$h)

caixeta$desvio = (caixeta$h - media.alt)

#Usando a fun√ß√£o table(), conte quantos indiv√≠duos de cada esp√©cie existem
table(caixeta$especie) 
#A fun√ß√£o table() tamb√©m pode contar por esp√©cie em cada local, depois por local
#em cada esp√©cie). Como?
table(caixeta$especie, caixeta$local)
#crie um objeto chamado pequenas que contenha todas as √°rvores com altura (h)
#menor que um metro.(Os dados no arquivo est√£o em cent√≠metros)
pequenas = caixeta[caixeta$h < 100,]
pequenas
#crie um objeto chamado grandes que contenha todas as √°rvores acima de 3 metros
grandes = caixeta[caixeta$h > 300,]
grandes
#crie um objeto chamado medias que todas as √°rvores com alturas entre um metro e
#tres metros
medias = caixeta[caixeta$h >= 100 & caixeta$h <= 300,]
medias
#agora em uma linha de comando, crie um objeto que contenha a quantidade de
#√°rvores pequenas, m√©dias e grandes, separadamente
summary(pequenas) #584
summary(medias) #306
summary(grandes) #1

tamanhos = list(pequenas$h, medias$h, grandes$h) # O que eu tinha feito

tamanhos = c(length(pequenas$local), length(medias$local), length(grandes$local)) #A resoluÁ„o na aula

#Crie um objeto chamado obj somente com os individuos de "Alchornea
#triplinervia" Em quantas localidades esta esp√©cie ocorre? Qual comando para
#encontrar essa informa√ß√£o?
obj = caixeta[caixeta$especie == "Alchornea triplinervia",]
table(obj$local) #a esp√©cie ocorre em duas localidades

#podemos remover dados de um dataframe, usando o sinal de menos

caixeta.sem.tabebuia = caixeta[ -which(caixeta$especie == "Tabebuia cassinoides"),]
sort(unique(caixeta.sem.tabebuia$especie))

#agora crie um objeto removendo todas as "Tabebuia cassinoides" do local retiro
#(somente do local retiro)

caixeta.tabebuia.retiro=caixeta[!(caixeta$especie == "Tabebuia cassinoides" & caixeta$local == "retiro"),] #ExclamaÁ„o significa "n„o". Tudo que for TRUE para essas condiÁıes n„o vai ser mantido no objeto.
unique(caixeta$especie)


#crie os objetos abaixo, junte eles num dataframe de duas colunas chamado comNA,
#depois crie um novo objeto chamado semNA, removendo todas as linhas que
#contenham NA, usando a nota√ß√£o acima (dica: sÛ se usa "" para valores do tipo
#character)
id = 1:80
a = c(121.72355, 103.79754, 130.15442, 98.29305, 103.43365, 102.44998,
      NA, 111.07215, 113.74047, 103.16081, 80.87149, 98.66692,
      65.09549, 155.74965, 88.30168, 147.43610, 114.60806, 109.87433,
      149.54772, 83.54137
)
b = c(77.91352, 78.07251, 81.95604, 75.64862, 78.45213, 79.11058,
      79.98952, 79.18127, 840.1635, 74.86860, 82.01886, 78.26936,
      77.94691, 78.75372, 77.64901, NA, 77.19803, 72.48175,
      83.45336, 78.99681
)
c = c(127.9366, 201.7158, NA, 136.5880, 131.7213, 118.1486,
      125.7534, 139.6544, 163.5890, 139.7455, NA, 141.4450, 110.7311,
      157.5921, 176.8437, 102.8659, 121.8286, 134.7097, 157.1392, 166.7133
)
d = c(191.3721, 216.1671, 165.4380, 196.2730, 172.6565, 178.2955,
      193.6687, NA, 160.2968, 208.4400, 204.0934, 208.1798,
      186.6380, 193.9446, NA, 198.6853, 213.8838, 210.1881,
      209.9109, 210.9228
)

semNA = comNA[!is.na(comNA$y),]

#Abaixo temos dados de tamanho de mandÌbula de chacal dourado. Crie um dataframe
#com esses dados. Qual a m√©dia por sexo? E para a esp√©cie? Guarde estes valores
#em tres objetos diferentes.
#machos: 120 107 110 116 114 111 113 117 114 112
#femeas: 110 111 107 108 110 105 107 106 111 111 Quantos machos t√™m a mandÌbula
#maior do que a mÈdia das fÍmeas?

machos = c(120, 107, 110, 116, 114, 111, 113, 117, 114, 112)
femeas = c(110, 111, 107, 108, 110, 105, 107, 106, 111, 111)
media.m = mean(machos)
media.f = mean(femeas)
chacais = data.frame(machos, femeas)
media.sp = mean(c(machos,femeas))
machos.grandes = machos[(machos > media.f)]
machos.grandes
machos.grandes2 = chacais$machos[chacais$machos > media.f] #mesma media agora com dataframe


#escreva **uma** linha de cÛdigo que testa se um n˙mero È par, e caso seja,
#manda uma mensagem dizendo "par". dica: use a funÁ„o %% (resto da divis„o, ou
#remainder em inglÍs) e a funÁ„o message()

if(10 %% 2 == 0){message("par")}else{message("impar")}

if(x > 4*mean(dados)){dados[-x]}else{}

dragoes$x = factor(dragoes$x)
if(teste.de.normalidade$p.value >= 0.5){
  fit = lm(dragoes$y ~ dragoes$x)
  summary(fit)
  plot(dragoes, main = "normal")
}  else {kruskal.test(dragoes)
  plot(dragoes, main = "kruskal")
  }


#agora crie um c√≥digo  como acima, mas que diga "par" se for par e "impar" se
#for impar. Dica: leia sobre as funÁıes else e ifelse





for (i in 1:10){
  a = i^2 
  message(a)
}

cx = caixeta[,-1]
cx = cx[, -6]


for(i in 1:length(cx)+1){
  x11()
  plot(cx[,i])
}

for(i in 10:1)# coloque aqui uma sequencia com quantas vezes voce quer repetir seu codigo abaixo { 
  message(i) #insira seu codigo repetitivo aqui
  }

#crie um ciclo (for) que mostre o console todos os inteiros de 1 ate 10, um por
#um

for (i in 1:10){
    message(i)
  }

#crie um ciclo (for) que some todos os inteiros de 25 ate 43, guardando esses
#valores num objeto soma (dica: crie o objeto soma com valor zero antes do
#codigo do ciclo)

soma = 0
for(i in 25:43){
  soma = soma+i
  message(soma)
}


#####Desafio level Hard#####
#Escreva um codigo que escreva os numeros de um a 100, com as seguintes
#condicoes: Se o numero for multiplo de 3, ao inv√©s do digito, escreva "Fu". Se
#o numero for multiplo de 5, ao inves do digito, escreva "b√°". Para n√∫meros que
#forem multiplos tanto de 3 quanto de 5, escreva "Fuba". A melhor solucao ganha
#um chocolate