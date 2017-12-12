#Atividades preliminares
#Primeiro de tudo, não entre em pânico.
#Estas atividades servem para você se familiarizar com o R. Digite elas diretamente no console do R, sem usar ainda o RStudio. Não se preocupe se não entender tudo que está acontecendo, iremos nos debruçar sobre esses comandos na aula. Se você tiver problemas em executar os códigos abaixo, me envie um email. Por enquanto, preste atenção no que acontece no R quando você digita os comandos abaixo. Como primeira atividade, descreva com suas palavraso que acontece , como no exemplo a seguir:
  
  message("Hello World") #Este comando é uma invocação tradicional dos deuses da informática e traz as bençãos de Murphy para nossas aulas
  
# Digite no console, do lado do símbolo >, e aperte enter depois de cada linha.

letters() #erro  
library(cars)  #erro 
plot(cars)   #grafico com pontos plotados por velocidade (y) e distancia (x)
rep("Oi", 10)  #retorna "oi" 10 vezes 
seq(from = 100, to = 1000, by = 50) #  exibe uma sequencia de 100 a 1000 em intervalos de 50
help(seq)  #exibe a ajuda da funcao help
??NA  #
a = sqrt(2)  #armazena no objeto "a", a raiz quadrada de 2
iris  #exibe o conteudo de "iris"
summary(iris)  #estatisticas sumarias do objeto iris
x = c(1:70)  #armazena no objeto "c", uma sequencia de numeros de 1 a 70 com intervalo de 1 
plot(x) #exibe um graficodo objeto x
mean(x)  #exibe a media de x
mean(x^2)  #exibe a media de x ao quadrado
mean(x)^2#exibe a media de x e a eleva ao quadrado


#Não há problema se você se sentir um pouco perdido ou perdida após fazer esta atividade, pois se você entendeu todo o código abaixo, você já sabe R :) A função deste exercício é lhe familiarizar com a interface, o programa e as mensagens de erro que vão aparecer. Não entre em pânico, nada do que tem no código abaixo vai fazer seu computador bugar ou explodir :)

#Agora vamos simular uma análise estatística.
#Execute os comandos abaixo e tente entender o que acontece. Não se assuste com as funções estatísticas, por enquanto tente entender o que cada linha faz de um modo geral, em termos de manipulação de dados. O que está sendo criado? O que está sendo calculado? Quando tiver dúvida sobre uma função, tente o comando help(nomeDaFuncao).

#Primeiro vamos gerar os dados:
#  Suponha que estamos interessados em saber se há uma relação linear entre o tamanho de um dragão e sua idade. Para isso, enviamos um estagiário de IC para, educadamente, medir os dragões do reino, em metros, e perguntar a eles suas idades, em décadas. Após retornar (um tanto chamuscado), nosso estagiário encontrou os seguintes dados:
  Idade = c(3.0, 4.0, 5.0, 6.0, 8.0, 9.0, 10.0, 11.0, 12.0, 14.0, 15.0, 16.0, 17.0)
TamanhoDaAsa = c(1.4, 1.5, 2.2, 2.4, 3.1, 3.2, 3.2, 3.9, 4.1, 4.7, 4.5, 5.2, 5.0)

#Agora vamos analisar:
 
plot(x = Idade, y = TamanhoDaAsa)  
modelo = lm(TamanhoDaAsa~Idade)  
summary(modelo)  

#Podemos também fazer essa análise na unha. Antes de executar, tente entender o que cada linha quer dizer

media.Idade = mean(Idade)  
media.TamanhoDaAsa = mean(TamanhoDaAsa)  
desvio.quadrado.Idade = (Idade - media.Idade)^2  
desvio.quadrado.TamanhoDaAsa = (TamanhoDaAsa - media.TamanhoDaAsa)^2  
ss.Idade = sum(desvio.quadrado.Idade)  
produto.cruzado = (Idade - media.Idade) * (TamanhoDaAsa - media.TamanhoDaAsa)  
ss.prod.cruz = sum(produto.cruzado)  
b = ss.prod.cruz/ss.Idade  
a = media.TamanhoDaAsa- b * media.Idade  
TamanhoDaAsa.previsto = a + b * Idade  
ss.t = sum(desvio.quadrado.TamanhoDaAsa)  
desvio.quadrado.previsto = (TamanhoDaAsa.previsto - media.TamanhoDaAsa)^2  
ss.regressao = sum(desvio.quadrado.previsto)  
desvio.quadrado.residuo = (TamanhoDaAsa.previsto - TamanhoDaAsa)^2  
ss.residuo = sum(desvio.quadrado.residuo)  
df.regressao = 1  
df.residuo = length(Idade) - 2  
ms.regressao = ss.regressao / df.regressao  
ms.residuo = ss.residuo / df.residuo  
f = ms.regressao/ms.residuo  
r.quad = ss.regressao/ss.residuo  


#E agora, fazendo gráficos
plot(TamanhoDaAsa ~ Idade, xlab = "Idade (décadas)",  
     ylab = "Comprimento (metros)",  
     main = "Tamanho da asa"  
     , bty = "n"  
     , xlim = c(0, 23)  
     , ylim = c(0, max(TamanhoDaAsa))  
     , lwd = 2  
     , yaxt = "n"  
     , xaxt = "n"  
)  
axis(1, pos = 0)  
axis(2, pos = 0)  
abline(a = a, b = b, col = "red", lwd = 2)  
anova(modelo)  
coefficients(modelo)  
plot(modelo)  
summary(modelo)  
plot(Idade, modelo$residuals)  
abline(h = 0)  

#Testando a significância e plotando
test.dist = rnorm(length(TamanhoDaAsa), mean = media.TamanhoDaAsa, sd = sqrt(var(TamanhoDaAsa)))  
qqnorm(TamanhoDaAsa); qqline(TamanhoDaAsa)  
hist(modelo$residuals)  
df <- summary(modelo)$fstatistic  
curve(df(x, df1 = df[2], df2 = df[3]), from = 0, to = 20, xlab = "F", bty = "l", ylab = "")  
abline(v = 12.04, col = "red")  
f.crit = qf(.95, df1 = df[2], df2 = df[3])  
abline(v = f.crit, col = "blue")  
qt(1-0.05/2, df.residuo)  
confint.lm(modelo)  
prd<-predict(modelo, newdata = data.frame(Idade), interval = c("confidence"), level = 0.95, type = "response")  


#NotaR
#Neste curso, usaremos o Notar, um sistema para notas automatizadas em cursos que utilizam a linguagem R desenvolvido por Chalom, A., Prado, P. I. & Adalardo, A.. Você recebeu um email com seu login e senha. Faça seu primeiro acesso, altere sua senha e depois faça o exercício 101.4 para se familiarizar com a plataforma

