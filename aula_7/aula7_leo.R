######################################################
# Introdução Linguagem R
# Vitor Passos Rios
# Universidade Federal da Bahia
# https://github.com/vrios/Intro-Linguagem-R/wiki
#####################################################

#####Usando Git com RStudio#####

#Primeiro, crie sua conta educacional no GitHub e configure o Git com seu nome e email (você já deveria ter feito isso nas Atividades preliminares)

#Clone o repositório https://github.com/vrios/exemplo-curso-r para sua máquina

#Na sua máquina, crie um arquivo chamado chuchu.R, edite, salve, e dê um commit.

#Dê um pull, seguido de um push. O que aconteceu e porque? #O pull retornou que o arquivo já estava atualizado. O push retornou oseguinte erro:
#remote: Permission to vrios/exemplo-curso-r.git denied to LeoArgolo.
#fatal: unable to access 'https://github.com/vrios/exemplo-curso-r.git/': The requested URL returned error: 403   #Isso acontece pois a autorizacao do dono do repositorio é necessaria 


#O que é um pull request? #uma notificação que sinaliza a conclusão das mudanças que você fez e enviou aos outros colaboradores. Permite iniciar discussões sobre as alteracoes antes da mesclagem do codigo por todos. 

#O que é um fork? #uma copia de um repositorio que voce gerencia. Permite fazer mudancas ao projeto sem alterar o repositorio original.

#####Criando seu primeiro repositório no GitHub#####

# Crie um repositório (público ou privado, como queira) chamado BIOC71-CURSO-R-UFBA

# Coloque uma descrição, um arquivo de licença e um .gitignore

# Clone ele para sua máquina, criando um projeto do RStudio

# No diretório do projeto do RStudio, crie Uma pasta para cada aula do curso, com o nome seguindo o padrão aula_1, aula_2, etc

# Dentro de cada pasta, coloque os scripts correspondentes

# Para cada pasta, dê um commit separado, somente com os arquivos correspondentes àquela aula

# Após dar todos os commits, dê um push pro remote

##### Alterando o Repositório e restuarando versões anteriores #####

# No GitHub, na página inicial do repositório, crie um novo arquivo chamado aula_0.R . Nele, salve o script das atividades preliminares do curso (você fez as atvidades preliminares, certo? *certo?*). Salve o arquivo no GitHub com uma commit message descritiva

# verifique o status do seu repositório local, e sincronize seu local com o remote


# Faça alterações em arquivos do repositório local, seguidas vezes, em locais diferentes dos arquivos, sempre dando commit e push. Como reverter para um estado anterior? Como acessar o histórico do arquivo no Github? Restaure somente um dos arquivos para um estado anterior



#Extra: clone o repositório deste curso, sugira uma modificação em um dos arquivos de qualquer aula, de preferência uma melhoria de clareza do exercício ou da aula, e faça um pull request. Se eu fizer o merge vc ganha um chocolate
