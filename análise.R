library(ggplot2)
library(psych)
library(cowplot)
library(corrplot)

# Definindo as cores para an�lise
cores_cat <- c('#3498db', '#2ecc71', '#f1c40f',
               '#d35400', '#797d7f', '#17202a',
               '#e74c3c', '#9b59b6')
cores_rgb <-  c('red', 'blue', 'gold')

# Definindo as regi�es
#####
df_AmericaDoSul<- df1 %>%
  filter(Pa�s %in% c("Argentina", "Bolivia",
                     "Brazil", "Chile",
                     "Colombia", "Ecuador",
                     "Guyana", "Paraguay",
                     "Peru", "Suriname",
                     "Uruguay", "Venezuela"))

df_AmericaCentraleNorte <- df1 %>%
  filter(Pa�s %in% c("Bahamas", "Barbados", "Belize",
                     "Canada", "Costa Rica", "Cuba",
                     "Dom. Rep.", "El Salvador", "Grenada",
                     "Guatemala", "Haiti", "Honduras",
                     "Jamaica", "Mexico", "Nicaragua",
                     "Panama", "Trinidad-Tobago", "USA", "St. Lucia" ))
df_europa <- df1 %>%
  filter(Pa�s %in% c("Albania", "Armenia", "Austria",
                     "Azerbaijan", "Belarus", "Belgium",
                     "Bosnia-Herz", "Bulgaria", "Croatia",
                     "Cyprus", "Czech Rep.", "Denmark",
                     "Estonia", "Finland", "France",
                     "Germany", "Georgia", "Greece",
                     "Hungary", "Iceland", "Ireland",
                     "Italy", "Latvia", "Lithuania",
                     "Luxembourg", "North Macedonia", "Malta",
                     "Moldova", "Netherlands", "Norway",
                     "Poland", "Portugal", "Russia", "Romania",
                     "Slovakia", "Slovenia", "Spain",
                     "Sweden", "Switzerland", "Turkey",
                     "Ukraine", "Yugoslavia", "UK")) 

df_Africa <- df1 %>%
  filter(Pa�s %in% c("Algeria" ,"Angola", "Benin", "Botswana",
                     "Burkina Faso", "Burundi", "C. Verde Is.",
                     "Cameroon", "Cent. Af. Rep.", "Chad",
                     "Comoro Is.", "Congo", "Congo (DRC)",
                     "Cote d'Ivoire", "Djibouti", "Egypt",
                     "Eq. Guinea", "Eritrea", "eSwatini",
                     "Ethiopia", "Gabon", "Gambia",
                     "Ghana", "Guinea", "Guinea-Bissau",
                     "Kenya", "Lesotho", "Liberia",
                     "Libya", "Madagascar", "Malawi",
                     "Mali", "Mauritania", "Mauritius",
                     "Morocco", "Mozambique", "Namibia",
                     "Niger", "Nigeria", "Rwanda",
                     "S. Africa", "Senegal", "Sierra Leone",
                     "Solomon Is.", "Somalia", "South Sudan",
                     "Sudan", "Swaziland", "Tanzania",
                     "Togo", "Tunisia","Uganda", 
                     "Zambia", "Zimbabwe"))

df_AsiaOceania <- df1 %>%
  filter(Pa�s %in% c("Afghanistan", "Australia", "Bahrain",
                     "Bangladesh", "Bhutan", "Brunei",
                     "Cambodia", "Fiji", "India",
                     "Indonesia", "Iran", "Iraq", 
                     "Israel", "Japan", "Jordan",
                     "Kazakhstan", "Kuwait", "Kyrgyzstan",
                     "Laos", "Lebanon", "Malaysia",
                     "Maldives", "Mongolia", "Myanmar",
                     "Nepal", "New Zealand", "Oman",
                     "P. N. Guinea", "Pakistan", "Philippines",
                     "Qatar", "Samoa", "Saudi Arabia",
                     "Singapore", "Sri Lanka", "Taiwan",
                     "Tajikistan", "Thailand", "Timor-Leste",
                     "Turkmenistan", "UAE", "Uzbekistan",
                     "Vanuatu", "Vietnam", "Yemen",
                     "Yemen (AR)", "Yemen (PDR)"))
#####

# Am�rica do Sul
#####
df_AmericaDoSul1 <- na.omit(df_AmericaDoSul)

ggplot(df_AmericaDoSul1)+
  aes(`Anos de governo`, fill = Regime)+ 
  geom_histogram(bins = 20, position = 'identity', alpha = 0.5)+
  theme_light()+
  scale_fill_manual(values = cores_cat)
  # Maior parte � presidencialista

# Gr�fico de densidade de probabilidade
ggplot(df_AmericaDoSul1)+
  aes(`Anos de governo`, fill = Regime)+ 
  geom_density(bins = 20, position = 'identity', alpha = 0.5)+
  theme_light()+
  scale_fill_manual(values = cores_cat)
# Houveram tamb�m mais experiencias presidencialistas com parlamento do que parlamentarismo
# As tres experiencias duraram 10 anos (esperan�a)

ggplot(df_AmericaDoSul1)+
  aes(`Anos de governo`, fill = Religi�o)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+
  theme_light()+ 
  scale_fill_manual(values = cores_rgb) 
# Nao h� uma maioria de apenas uma relig�o na america do sul
# evidentemente os governos crist�os n�o chegaram a durar mais de 5 anos, mas s�o o maior grupo

ggplot(df_AmericaDoSul1)+
  aes(`Anos de governo`, fill = Ideologia)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+
  theme_light()+
  scale_fill_manual(values = cores_cat) 
# Houveram mais governos de centro e esquerda que duraram at� 5 anos
# mas os de direita foram mais duradouros, com alguns durando 3 d�cadas

ggplot(df_AmericaDoSul)+
  aes(`Anos de governo`, fill = `Mandato finito`)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+ # A maior parte era mandato finito
  theme_light()+
  scale_fill_manual(values = cores_rgb) 
# a maior parte dos mandatos "sem limita��o" duraram menos de 10 anos
# houveram relativamente mais governos de "mandato infinito" e curtas dura��es que mandatos mais longos

ggplot(df_AmericaDoSul1)+
  aes(`Anos de governo`, fill = Nacionalista)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+
  theme_light()+ 
  scale_fill_manual(values = cores_rgb)
# A maioria dos governos n�o era nacionalista, mas mas costumam ser de menor dura��o
# Os regimes declaradamente nacionalistas tendem a permanecer mais tempo no poder

ggplot(df_AmericaDoSul1)+
  aes(`Anos de governo`, fill = `Restri��es � reelei��o`)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+
  theme_light()+
  scale_fill_manual(values = cores_cat) 
# Hoveram alguns mandatos sem limita��o que duraram 3 d�cadas 
# No geral a maioria dos governos sem restri��o chegou a uma d�cada de mandato, possivelmente por conta das restri��es constitucionais

# Criando um gr�fico de barras para vari�veis categ�ricias
ggplot(df_AmericaDoSul1) + 
  aes(`Restri��es � reelei��o`, fill = Regime) + 
  geom_bar() + 
  theme_light() +
  scale_fill_manual(values = cores_cat)+
  coord_flip()
# Os regimes parlamentaristas na americana latina ocorreram em pa�sessem restri��es a reelei��o

ggplot(df_AmericaDoSul1) + 
  aes(Ideologia, fill = Regime) + 
  geom_bar() + 
  theme_light() +
  scale_fill_manual(values = cores_cat)+
  coord_flip()
# N�o houveram regimes parlamentaristas de direita na america latina

ggplot(df_AmericaDoSul1) + 
  aes(`Restri��es � reelei��o`, fill = Ideologia) + 
  geom_bar() + 
  theme_light() +
  scale_fill_manual(values = cores_cat)+
  coord_flip()
# Houveram mais governos de esquerda em pa�ses com restri��o ate dois mandatos consecutivos
# Houveram mais governos de direita em pa�ses sem limita��es a reelei��o

# An�lise multifacetada
ggplot(df_AmericaDoSul1) +
  aes(x = `Anos de governo`, y = Regime , color = Nacionalista) +
  geom_point(alpha = 0.7, size = 3) +
  theme_light() +
  scale_color_manual(values = cores_cat) +
  facet_grid(Ideologia ~ `Restri��es � reelei��o`)
# N�o temos regimes de centro nacionalistas
# O unico regime presidencialista nacionalista era de direita
#####

# Am�rica do Norte e Central
#####
df_amn1 <- na.omit(df_AmericaCentraleNorte)

ggplot(df_amn1)+
  aes(`Anos de governo`, fill = Regime)+ 
  geom_histogram(bins = 20, position = 'identity', alpha = 0.5)+
  theme_light()+
  scale_fill_manual(values = cores_cat)
# Maior parte � presidencialista, seguida por parlamentarismo
# Regimes presidencialistas com parlamento foram mais longos 

ggplot(df_amn1)+
  aes(`Anos de governo`, fill = Religi�o)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+
  theme_light()+ 
  scale_fill_manual(values = cores_rgb) 
# Houveram somente governos declaradamente religiosos que fossem crist�os na america do norte e central

ggplot(df_amn1)+
  aes(`Anos de governo`, fill = Ideologia)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+
  theme_light()+
  scale_fill_manual(values = cores_cat) 
# Houveram mais governos de direita que duraram pouco
# Houveram mais governos de centro 
# O governo mais longevo era de esquerda e se estende por todo o per�odo da amostra

ggplot(df_amn1)+
  aes(`Anos de governo`, fill = Nacionalista)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+
  theme_light()+ 
  scale_fill_manual(values = cores_rgb)
# Os governos n�o nacionalistas duraram mais tempo
# H� uma concentra��o de governos nacionalistas que duraram at� 10 anos

ggplot(df_amn1)+
  aes(`Anos de governo`, fill = `Restri��es � reelei��o`)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+
  theme_light()+
  scale_fill_manual(values = cores_cat) 
# Hoveram alguns mandatos sem limita��o que duraram 4 d�cadas 
# H� indicios para acreditar que os governos seguem as constitui��es e n�o estendem al�m do permitido, slvo uma exce��o

# Criando um gr�fico de barras para vari�veis categ�ricias
ggplot(df_amn1) + 
  aes(`Restri��es � reelei��o`, fill = Regime) + 
  geom_bar() + 
  theme_light() +
  scale_fill_manual(values = cores_cat)+
  coord_flip()
# Os regimes parlamentaristas ocorreram em pa�ses sem restri��es a reelei��o

ggplot(df_amn1) + 
  aes(Ideologia, fill = Regime) + 
  geom_bar() + 
  theme_light() +
  scale_fill_manual(values = cores_cat)+
  coord_flip()
# As unicas experiencias presidencialistas com parlamento foram de esquerda

ggplot(df_amn1) + 
  aes(`Restri��es � reelei��o`, fill = Ideologia) + 
  geom_bar() + 
  theme_light() +
  scale_fill_manual(values = cores_cat)+
  coord_flip()
# A maior parte dos regimes sem limta��o de reelei��o eram de esquerda ou de direita

# An�lise multifacetada
ggplot(df_amn1) +
  aes(x = `Anos de governo`, y = Regime , color = Nacionalista) +
  geom_point(alpha = 0.7, size = 3) +
  theme_light() +
  scale_color_manual(values = cores_cat) +
  facet_grid(Ideologia ~ `Restri��es � reelei��o`)
# Os unicos regimes parlamentaristas e nacionalistas foram de direita
#####

# Europa
#####
df_europa1 <- na.omit(df_europa)

ggplot(df_europa1)+
  aes(`Anos de governo`, fill = Regime)+ 
  geom_histogram(bins = 20, position = 'identity', alpha = 0.5)+
  theme_light()+
  scale_fill_manual(values = cores_cat)
# Maioria esmagadora � parlamentarista

# Gr�fico de densidade de probabilidade
ggplot(df_europa1)+
  aes(`Anos de governo`, fill = Regime)+ 
  geom_density(position = 'identity', alpha = 0.5)+
  theme_light()+
  scale_fill_manual(values = cores_cat)
# HA maior parte das experiencias parlamentristas durou ate 10 anos
# As presidencialistas com parlamento foram as mais longas

ggplot(df_europa1)+
  aes(`Anos de governo`, fill = Religi�o)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+
  theme_light()+ 
  scale_fill_manual(values = cores_cat) 
# Os governos declaradamente cat�licos foram mais longevos 
# Os governos isl�micos duraram mais tempo que crist�os

ggplot(df_europa1)+
  aes(`Anos de governo`, fill = Ideologia)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+
  theme_light()+
  scale_fill_manual(values = cores_cat) 
# Os governos de esquerda foram os mais longos
# Houveram mais governos de centro

ggplot(df_europa1)+
  aes(`Anos de governo`, fill = `Mandato finito`)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+ # A maior parte era mandato finito
  theme_light()+
  scale_fill_manual(values = cores_rgb) 
# a maior parte dos mandatos "sem limita��o" duraram menos de 10 anos
# houveram relativamente mais governos de "mandato infinito" e curtas dura��es que mandatos mais longos
# a maior parte dos governos sem restri��es a reelei��o duraram mais tempo

ggplot(df_europa1)+
  aes(`Anos de governo`, fill = Nacionalista)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+
  theme_light()+ 
  scale_fill_manual(values = cores_rgb)
# A maioria dos governos n�o era nacionalista, e foram de maiordura��o
# Os governos nacionalistas duraram no m�ximo 15 anos

ggplot(df_europa1)+
  aes(`Anos de governo`, fill = `Restri��es � reelei��o`)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+
  theme_light()+
  scale_fill_manual(values = cores_rgb) 
# Hoveram alguns mandatos sem limita��o que duraram 3 d�cadas 
# No geral a maioria dos governos sem restri��o chegou a uma d�cada de mandato, possivelmente por conta das restri��es constitucionais

# Criando um gr�fico de barras para vari�veis categ�ricias
ggplot(df_europa1) + 
  aes(Ideologia, fill = Regime) + 
  geom_bar() + 
  theme_light() +
  scale_fill_manual(values = cores_rgb)+
  coord_flip()
# houveram mais experiencias parlamentaristas c presediente  de esquerda que de direita

ggplot(df_europa1) + 
  aes(Ideologia, fill = Regime) + 
  geom_bar() + 
  theme_light() +
  scale_fill_manual(values = cores_cat)+
  coord_flip()
# N�o houveram regimes presidencialistas com parlamento de centro na europa

ggplot(df_europa1) + 
  aes(`Restri��es � reelei��o`, fill = Ideologia) + 
  geom_bar() + 
  theme_light() +
  scale_fill_manual(values = cores_cat)+
  coord_flip()
# Houveram mais governos de esquerda em pa�ses com restri��o ate dois mandatos consecutivos
# Houveram mais governos de direita em pa�ses sem limita��es a reelei��o

# An�lise multifacetada
ggplot(df_europa1) +
  aes(x = `Anos de governo`, y = Religi�o , color = Ideologia) +
  geom_point(alpha = 0.7, size = 3) +
  theme_light() +
  scale_color_manual(values = cores_cat) +
  facet_grid(Regime ~ `Restri��es � reelei��o`)
# N�o hoveram experiencias de esquerda cat�licas, crist�s ou islamicas na europa
# A maior parte das experiencias de direita era catolica ou crist�
#####

# Africa
#####
df_africa1 <- na.omit(df_Africa)

ggplot(df_africa1)+
  aes(`Anos de governo`, fill = Regime)+ 
  geom_histogram(bins = 20, position = 'identity', alpha = 0.5)+
  theme_light()+
  scale_fill_manual(values = cores_cat)
# Maioria esmagadora � presidencialista
# Governos presidencialistas foram os mais longos

# Gr�fico de densidade de probabilidade
ggplot(df_africa1)+
  aes(`Anos de governo`, fill = Regime)+ 
  geom_density(position = 'identity', alpha = 0.5)+
  theme_light()+
  scale_fill_manual(values = cores_cat)
# HA maior parte das experiencias parlamentristas durou ate 20 anos
# As presidencialistas foram as mais longas

ggplot(df_africa1)+
  aes(`Anos de governo`, fill = Religi�o)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+
  theme_light()+ 
  scale_fill_manual(values = cores_cat) 
# Os governos declaradamente Hindus foram mais longevos 
# Os governos isl�micos duraram menos tempo, mas foram mais numerosos 

ggplot(df_africa1)+
  aes(`Anos de governo`, fill = Ideologia)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+
  theme_light()+
  scale_fill_manual(values = cores_cat) 
# Os governos de esquerda foram os mais longos
# Houveram mais governos de centro

ggplot(df_africa1)+
  aes(`Anos de governo`, fill = `Mandato finito`)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+ # A maior parte era mandato finito
  theme_light()+
  scale_fill_manual(values = cores_rgb) 
# houveram relativamente mais governos de "mandato finito" 
# a maior parte dos governos sem restri��es a reelei��o duraram mais tempo
# Ha uma quantidade consider�vel de governos sem limita��es que duraram d�cadas

ggplot(df_africa1)+
  aes(`Anos de governo`, fill = Nacionalista)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+
  theme_light()+ 
  scale_fill_manual(values = cores_rgb)
# Ser nacionalista n�o influenciou muito na dura��o de governo
# Houveram mais governos n�o nacionalistas

ggplot(df_africa1)+
  aes(`Anos de governo`, fill = `Restri��es � reelei��o`)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+
  theme_light()+
  scale_fill_manual(values = cores_cat) 
# Hoveram alguns mandatos longos por�m com limita��es 
# Houve uma quantidade consider�vel de regimes com at� 3 mandatos consecutivos

# Criando um gr�fico de barras para vari�veis categ�ricias
ggplot(df_africa1) + 
  aes(Ideologia, fill = Regime) + 
  geom_bar() + 
  theme_light() +
  scale_fill_manual(values = cores_rgb)+
  coord_flip()
# A maior parte dos regimes presidencialistas era declaradamente de esquerda
# Houveram poucas experiencias parlamentaristas na africa

ggplot(df_africa1) + 
  aes(`Restri��es � reelei��o`, fill = Ideologia) + 
  geom_bar() + 
  theme_light() +
  scale_fill_manual(values = cores_cat)+
  coord_flip()
# O unico regime com 3 mandatos consecutivos era de esquerda

# An�lise multifacetada
ggplot(df_africa1) +
  aes(x = `Anos de governo`, y = Religi�o , color = Ideologia) +
  geom_point(alpha = 0.7, size = 3) +
  theme_light() +
  scale_color_manual(values = cores_cat) +
  facet_grid(Regime ~ `Restri��es � reelei��o`)
# Como no caso da europa, n�o houveram regimes de esquerda declarademnete hindus ou islamicos

#####

# Asia e Oceania
#####
df_asia1 <- na.omit(df_AsiaOceania)

ggplot(df_asia1)+
  aes(`Anos de governo`, fill = Regime)+ 
  geom_histogram(bins = 20, position = 'identity', alpha = 0.5)+
  theme_light()+
  scale_fill_manual(values = cores_cat)
# Maioria parlamentarista, seguida por presidencialista
# Governos presidencialistas foram os mais longos

ggplot(df_asia1)+
  aes(`Anos de governo`, fill = Religi�o)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+
  theme_light()+ 
  scale_fill_manual(values = cores_cat) 
# A maior parte dos governos era delcaradamente islamica, seguida por hindu
# Tanto os governos islamicos quanto hindus e cristaos duraram ate 10 anos, os n�o delcarados foram mais longevos

ggplot(df_asia1)+
  aes(`Anos de governo`, fill = Ideologia)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+
  theme_light()+
  scale_fill_manual(values = cores_cat) 
# Houveram mais governos de direita, por�m mais curtos, chegando a no m�ximo 10 anos
# Governos de centro e esquerda duraram mais

ggplot(df_asia1)+
  aes(`Anos de governo`, fill = `Mandato finito`)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+ # A maior parte era mandato finito
  theme_light()+
  scale_fill_manual(values = cores_rgb) 
# houveram relativamente mais governos de "mandato infinito" 
# a maior parte dos governos sem restri��es a reelei��o duraram de 10 a 20 anos
# Ha uma quantidade consider�vel de governos sem limita��es que duraram d�cadas

ggplot(df_asia1)+
  aes(`Anos de governo`, fill = Nacionalista)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+
  theme_light()+ 
  scale_fill_manual(values = cores_rgb)
# Ser nacionalista influenciou na dura��o de governo, os nacionalistas foram mais longos
# Houveram mais governos n�o nacionalistas

ggplot(df_asia1)+
  aes(`Anos de governo`, fill = `Restri��es � reelei��o`)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+
  theme_light()+
  scale_fill_manual(values = cores_cat) 
# Hoveram alguns mandatos longos por�m com limita��es 
# Apesar de n�o haverem limita��es, os governos sem limita��es duraram at� 10 anos

# Criando um gr�fico de barras para vari�veis categ�ricias
ggplot(df_asia1) + 
  aes(Ideologia, fill = Regime) + 
  geom_bar() + 
  theme_light() +
  scale_fill_manual(values = cores_rgb)+
  coord_flip()
# A maior parte dos regimes presidencialistas com parlamento era declaradamente de esquerda

# An�lise multifacetada
ggplot(df_asia1) +
  aes(x = `Anos de governo`, y = Religi�o , color = Ideologia) +
  geom_point(alpha = 0.7, size = 3) +
  theme_light() +
  scale_color_manual(values = cores_cat) +
  facet_grid(Regime ~ `Restri��es � reelei��o`)
# Houveram governos islamicos de esquerda
# houveram governos hindus de direita
# houveram governos crist�os de direita e de centro
# religi�o nao parece ser o definidor da dura��o do mandato na Asia e oceania
#####