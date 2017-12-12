###########################################
###              (Aula 5)               ### 
###   Disciplina - Introducao ao R      ###
###   Discente: Leandro Araujo Argolo   ###
###########################################




read.csv("dragoes_completo.csv")

vermelhos.grandes = subset(
  x=dragoes_completo
  ,subset = tamanho_asa >= 15 & cor == "vermelho" #subconjunto somente com vermelhos acima de 15 metros
  , select=n_chifres:idade #manter apenas a coluna n_chifres
)
vermelhos.grandes


numericos= data.frame(dragoes_completo$peso,dragoes_completo$n_chifres,dragoes_completo$tamanho_asa,dragoes_completo$idade)
somas = apply(numericos, MARGIN = 2, FUN =  sum, na.rm=T)


lista.somas = lapply(numericos, FUN =  sum, na.rm=T)
lista.somas


lista.log = lapply(numericos, FUN =  log)

vetor.somas = sapply(numericos, FUN =  sum, na.rm=T)
vetor.somas


vetor.log = sapply(numericos, FUN =  log)


x <- 1:20
y <- factor(rep(letters[1:5], each = 4))
tapply(x, INDEX=y, FUN = sum)



media.por.cor2=tapply(dragoes_completo$n_chifres, INDEX = dragoes_completo$cor, FUN = mean)
class(media.por.cor2)



str(dragoes_completo)


head(dragoes_completo)


sum(is.na(dragoes_completo))


summary(dragoes_completo)


unique(dragoes_completo$cor)


dragoes_limpo = dragoes_completo #copie seus dados para um outro objeto
dragoes_limpo=dragoes_limpo[,-1] #coluna 1 é inútil
dragoes_limpo$cor[dragoes_limpo$cor =="dorado" ] = "dourado"
dragoes_limpo$cor[dragoes_limpo$cor =="vremelho" ] = "vermelho"
dragoes_limpo$cor[dragoes_limpo$cor =="banco" ] = "branco"
dragoes_limpo$cor = tolower(dragoes_limpo$cor) # maiúsculas para minusculas
unique(dragoes_limpo$cor)



dragoes_limpo$cor = factor(dragoes_limpo$cor)#transformando novamente em fator
dragoes_limpo = dragoes_limpo[!is.na(dragoes_limpo$peso),]
unique(dragoes_limpo$cor)


summary(dragoes_limpo)



erro.padrao.media = function(x) {
  #erro padrão da média, é igual ao desvio padrão dividido pela raiz do número de amostras
  sd(x)/sqrt(length(x))
}
erros = aggregate(dragoes_limpo$idade
                  ,by=list(dragoes_limpo$dieta)
                  ,FUN = erro.padrao.media
)

erros