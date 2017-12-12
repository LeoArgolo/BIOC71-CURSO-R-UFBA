# Uma funcao muito simples

media <-function(x) #cria a funcao "media"
{
  soma=sum(x) # cria o objeto "soma" que calcula a soma as observacoes de x
  nobs=length(x) # cria o objeto "nobs" que calcula o comprimento (numero de observa's)
  media=soma/nobs # cria o objeto "media" que divide a soma das observacoes de x ( ou "soma") pelo numero total de observacoes ()
  return(media) #retorna o valor do objeto "media"
}

# Testando a funÃ§Ã£o

ls() # retorna um vetor com uma lista de objetos em seu environment
media # exibe o conteudo da funcao "media"
media() # Executa a funcao "media", porem resulta em erro por nao ter o objeto identificado
dados=rnorm(20,2,1) #cria o objeto "dados" com 20 observacoes com media 2 e desvio padrao 1
media(dados) # executa a funcao recem-criada "media" para calcular a media do objeto "dados"
dados1=rnorm(200,2,1) #cria o objeto "dados1" com 200 observacoes de media 2 e desvio padrao 1 
media(dados1) # calcula a media do objeto "dados1"
dados2=(rnorm(10000,2,1))  #cria o objeto "dados2" com 10000 observacoes de media 2 e desvio padrao 1 
media(dados2) # Executa a funcao "media" para o objeto "dados2"
sd(dados) # Exibe o desvio padrao de "dados"
dados3=rnorm(20,2,0.01) # Cria um conjunto de dados aleatorio com distribuicao normal de tamanho 20 , media 2 e desvio padrao 0.01
media(dados3) # Executa a funcao "media" para o objeto "dados3" 
dados4=rnorm(200,2,0.01) # Cria um conjunto de dados aleatorio com distribuicao normal de tamanho 200 , media 2 e desvio padrao 0.01
media(dados4) # Executa a funcao "media" para o objeto "dados4" 
dados[2]<-NA # insere um NA na segunda posicao do objeto "dados"
dados  # Exibe o conteudo de "dados"
media(dados) # Executa a funcao "media" para o objeto "dados" 

media<-function(x,rmNA=TRUE)  #cria a funcao "media", sobrepondo a anterior
{
  if(rmNA==TRUE) # determina a condicao que se houver NA's
  {
    dados=(na.omit(dados)) # omite os NA's do objeto
    n.NA=length(x)-length(dados) #calcula o numero de NA's removidos
    cat("\t", n.NA," valores NA excluÃ­dos\n") #retorna o numero de nas removidos 
  }
  else #caso o objeto nao contenha NA's, realiza os mesmos comandos da funÃ§Ã£o inicial sobreposta
  {
    dados=x #comentarios do restante da funcao sao iugais ao da funcao sobreposta
  }
  soma=sum(dados) 
  nobs=length(dados)
  media=soma/nobs
  return(media)
}


media(dados) #executa a funcao "media" para o objeto "dados"



var.curso<-function(x) #cria a funcao "var.curso"
{
  media=media(x) #"insere no objeto "media" que calcula a media pela funcao criada anteriormente
  dados=na.omit(x)	# remove os NA's do objeto "x" e  insere no objeto "dados"
  disvquad=(dados-media)^2 # insere no objeto "disvquad" a subtracao da media dos dados e eleva ao quadrado
  var.curso=sum(disvquad)/(length(dados)-1) #calcula a variancia pela soma dos objetos de "disvquad" e divide pelo numero total de observaÃ§Ãµes em "dados" menos 1
  return(var.curso) #retorna a variancia
}

var.curso(dados) #calcula a variancia do objeto pela funcao recem-criada
var(dados)### dica: veja o help dessa funÃ§Ã£o "help(var)" #calcula a variancia pela funcao nativa do R, e retorna NA por conta da presenca de NA nos dados
var(dados,na.rm=TRUE) # recalcula a variancia e retorna o mesmo valor da "var.curso" apÃ³s remover os NAs pelo argumento "na.rm"
var(dados,na.rm=FALSE) # recalcula a variancia e retorna NA, uma vez que os NA's foram mantindos



ID.curso<-function(x) # cria a funcao pra calcular o indice de dispersao 
{
  id=var.curso(x)/media(x) #insere no objeto "id" o resultado da divisÃ£o da variancia pela media dos dados, calculados pelas funcoes criadas
  return(id) # retorna o conteudo do objeto "id"
}



#simulacoes de  dados com diferentes caracteristicas conhecidas:
  
  #Simula Aleatorio

aleat=rpois(200,2) #gera uma sequencia aleatoria de 200 numeros com distribuicao de poisson com lambda 2
aleat # exibe o conteudo do objeto "aleat"


# Uniforme 
unif=runif(200,0,4) #gera uma sequencia aleatorios de 200 numero com distribuicao uniforme de minimo 0 e maximo 4
unif #exibe o conteudo de unif
unif=round(unif,0) #arredonda as casa decimais para o numero de digitos especificado
unif


#Agregado
agreg=round(c(runif(100,0,1),runif(100,5,10))) #gera um conjunto de dados com valores arrendondados "agreg" para o conjunto de duas distribuicoes uniformes 
agreg


ID.curso(aleat) #Calcula o coeficiente de dispersÃ£o


ID.curso(unif) #Calcula o coeficiente de dispersÃ£o

ID.curso(agreg) #Calcula o coeficiente de dispersÃ£o


#FunÃ§Ã£o para criar o teste de signficÃ¢ncia do ID

test.ID <- function(x, nsim=1000) #cria a funcao para testar a significancia do indice de dispersao
{ 
  ID.curso=function(x){var(x)/mean(x)} # essa funÃ§Ã£o precisa das funcoes media e ID.curso 
  dados=na.omit(x) #remove os NA's
  ndados=length(dados)  # armazena o comprimento de "dados"
  med=mean(dados) # armazena a media de "dados"
  id=var(dados)/med #armazena a variancia de "dados"
  simula.aleat=rpois(length(dados)*nsim, lambda=med) 
  sim.dados=matrix(simula.aleat,ncol= ndados)
  sim.ID=apply(sim.dados,1,ID.curso)
  quant.ID=quantile(sim.ID, probs=c(0.025,0.975))
  if(id>=quant.ID[1] & id<=quant.ID[2])
  { 
    cat("\n\n\n\t distribuiÃ§Ã£o aleatÃ³ria para alfa=0.05 \n\t ID= ",id,"\n\n\n") # retorna a mensagem se o alfa for =0.5
  }
  if(id < quant.ID[1]) 
  { 
    cat("\n\n\n\t distribuiÃ§Ã£o uniforme, p<0.025 \n\t ID= ",id,"\n\n\n") # retorna a mensagem se o alfa for =0.5
  }
  if(id>quant.ID[2])
  { 
    cat("\n\n\n\t distribuiÃ§Ã£o agregado, p>0.975 \n\t ID= ",id,"\n\n\n") # retorna a mensagem se o alfa for =0.5
  }
  resulta=c(id,quant.ID)
  names(resulta)<-c("Indice de DispersÃ£o", "critico 0.025", "critico 0.975") # retorna a mensagem se o alfa for =0.5
  return(resulta)
}

test.ID(aleat) #realiza o teste de significancia do indice de dispersao
test.ID(agreg) #realiza o teste de significancia do indice de dispersao
test.ID(unif) #realiza o teste de significancia do indice de dispersao


eda.shape <- function(x)
{
  x11() 
  par(mfrow = c(2,2))	## muda o dispositivo grÃ¡fico para 2x2
  hist(x)                 ## produz histograma de x
  boxplot(x)    #gera o boxplot de x
  iqd <- summary(x)[5] -	summary(x)[2]     ## faz a diferenÃ§a entre o quinto elemento x e o segundo
  plot(density(x,width=2*iqd),xlab="x",ylab="",type="l") #gera o plot da densidade de x
  qqnorm(dados.pois20) #gera o qqplot normal dos valores de x
  qqline(dados.pois20) #insere a linha no qqplot de x
  par(mfrow=c(1,1))
  
}


set.seed(22) ## estabelece uma semente aleatÃ³ria 
dados.pois20<-rpois(20,lambda=6) ## sorteia dados aleatÃ³rios de uma funÃ§Ã£o poisson com mÃ©dia 6
sum(dados.pois20) ## a somatÃ³ria aqui sempre darÃ¡ 131, somente porque a semente Ã© a mesma
set.seed(22)
dados.norm20<-rnorm(20,mean=6, sd=2) ## sorteia 20 dados de uma funÃ§Ã£o normal com mÃ©dia 6 e dp = 1
sum (dados.norm20)               ### aqui o resultado darÃ¡ sempre 130.48

###aplicar eda.shape para dados.dens

eda.shape(dados.pois20)

eda.shape(dados.norm20)

###aumentando a amostra

eda.shape(rpois(500,6))

eda.shape(rnorm(500,6))



eda.shape1 <- function(x) #cria a funcao eda.shape1 modificada essencialmente alterando, em cada um dos graficos, os textos de titulo, e eixos, e parametros visuais como cor vermelha na linha do qqplot
  
{
  x11()
  par(mfrow = c(2,2))
  hist(x,main="Histograma de x")
  boxplot(x, main="BoxPlot de x")
  iqd <- summary(x)[5] -	summary(x)[2]
  plot(density(x,width=2*iqd),xlab="x",ylab="",type="l", main="DistribuiÃ§Ã£o de densidade de x")
  qqnorm(x,col="red",main="GrÃ¡fico Quantil x Quantil",xlab="Quantil TeÃ³rico",ylab="Quantil da Amostra")
  qqline(x)
  par(mfrow=c(1,1))
  
}


eda.shape1(rnorm(500,6)) #aplica eda.shape1 para os dados


x1=rpois(20,1) #gera um conjunto aleatorio com 20 elementos e media em torno de 1 
x2=rpois(20,2) #gera um conjunto aleatorio com 20 elementos e media em torno de 2 
x3=rpois(20,3) #gera um conjunto aleatorio com 20 elementos e media em torno de 3 
x4=rpois(20,1) #gera um conjunto aleatorio com 20 elementos e media em torno de 1 
sp.oc=matrix(c(x1,x2,x3,x4), ncol=4) #armazena uma matriz" "sp.oc" com uma coluna para cada conjunto dos dados gerados acima
colnames(sp.oc)<-c("plot A", "plot B", "plot C", "plot D") #nomeia as colunas criadas
rownames(sp.oc)<-paste("sp", c(1:20)) #nomeia as linhas
str(sp.oc) #exibe a estrutura interna de sp.oc
dim(sp.oc)#exibe a dimensao de sp.oc
head(sp.oc) #exibe as 6 primeiras linhas de sp.oc


n.spp<-function(dados)
{
  nplot=dim(dados)[2]
  resultados=rep(0,nplot)
  names(resultados)<-paste("n.spp", c(1:nplot))
  dados[dados>0]=1
  for(i in 1:(dim(dados)[2]))
  {
    cont.sp=sum(dados[,i])
    resultados[i]=cont.sp
  }
  return(resultados)
}


##### Aplicando a funcao  

n.spp(sp.oc) #aplica a funcao n.spp a sp.oc


sim<-function(dados) #cria a funcao sim
{
  nplot=dim(dados)[2] #armazena em "nplot" a dimensao na coluna 2 de "dados"
  similar=matrix(1,ncol=nplot,nrow=nplot)#armazena uma matriz com  numero de colunas e linhas de "n plot"
  rownames(similar)<-paste("plot", c(1:nplot)) #determina o nome das linhas da matriz "similar", cada linha serÃ¡ plot1, plot2,...
  colnames(similar)<-paste("plot", c(1:nplot))
  dados[dados>0]=1
  for(i in 1:nplot-1)
  {
    m=i+1
    for(m in m:nplot)
    {
      co.oc=sum(dados[,i]>0 & dados[,m]>0)
      total.sp=sum(dados[,i])+sum(dados[,m])-co.oc
      similar[i,m]=co.oc/total.sp 
      similar[m,i]=co.oc/total.sp 
    }
    
  }
  return(similar)
}



sim(sp.oc)

debug(sim)
sim(sp.oc)
undebug(sim)


##### Exercicio 2 - Exercício Análise exploratória simultânea de duas variáveis #####


#Tarefa: Crie uma função para saída gráfica de análises exploratórias de duas variáveis. Essa saída pode ter por exemplo boxplot, histograma, qq norm e y por x. A função deve permitir a entrada de dois objetos vetores de mesmo tamanho (x e y). Caso os valores de x e y forem desenhados em um mesmo gráfico, defina cores diferentes. As legendas devem ser em português e a saída (return) deve apresentar o sumário das duas variáveis e o coeficiente de correlação.

#DICAS:
  
#  Para histogramas com variáveis em um mesmo gráfico pode ser utilizada a função multhist() do pacote "plotrix". Baixe, instale o pacote e veja o help da função.
#Utilize o código do eda.shape, apresentado em aula como ponto de partida.
#Lembre-se que em algumas funções gráficas o argumento add=TRUE, adiciona elementos no gráfico anterior. 

x = rnorm(100, 9, 2) #cria o conjunto de vetor de dados "x"
y = rnorm(100, 12, 1) #cria o conjunto de vetor de dados "y"



analise.exploratoria = function(x, y)
  { 
  par(mfrow = c(2,3), bty = "l")
  
  hist(y
       ,main     = "Histograma de y"
       ,col      = "cyan1"
       , ylab    = "Frequência"
       , xlab    = "y"
  )
  
    hist(x
       ,main     = "Histograma de x"
       ,col      = "darkolivegreen2"
       , ylab    = "Frequência"
       , xlab    = "x"
       )
    
    boxplot(y,x
       ,main = "Boxplot de y e x"
       ,names    = c("y","x")
       ,col      = c("cyan1", "darkolivegreen2")
       ,cex.lab  = 1
       ,pch      = c(1,16)
       )  
  
  qqnorm(y,
         xlab    = "Quantil teórico",
         ylab    = "Quantil da amostra",
         main    = "Gráfico quantil-quantil",
         col     = "cyan1")
  qqline(y)
  
  
  qqnorm(x,
         xlab    = "Quantil teórico",
         ylab    = "Quantil da amostra",
         main    = "Gráfico quantil-quantil",
         col     = "darkolivegreen2")
  qqline(x)
  
  
  sumario.x      = summary(y)
  sumario.y      = summary(x)
  

  coef.cor       = cor(y, x)
  
  saida          = list(sumario.x, sumario.y, coef.cor)
  
  names(saida)   = c("Sumário de y",
                   "Sumário de x",
                   "Coeficiente de correlação entre x e y ")
  return(saida)
}


analise.exploratoria(y,x)