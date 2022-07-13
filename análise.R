library(ggplot2)
library(psych)
library(cowplot)
library(corrplot)

# Definindo as cores para análise
cores_cat <- c('#3498db', '#2ecc71', '#f1c40f',
               '#d35400', '#797d7f', '#17202a',
               '#e74c3c', '#9b59b6')
cores_rgb <-  c('red', 'blue', 'gold')

# Definindo as regiões
#####
df_AmericaDoSul<- df1 %>%
  filter(País %in% c("Argentina", "Bolivia",
                     "Brazil", "Chile",
                     "Colombia", "Ecuador",
                     "Guyana", "Paraguay",
                     "Peru", "Suriname",
                     "Uruguay", "Venezuela"))

df_AmericaCentraleNorte <- df1 %>%
  filter(País %in% c("Bahamas", "Barbados", "Belize",
                     "Canada", "Costa Rica", "Cuba",
                     "Dom. Rep.", "El Salvador", "Grenada",
                     "Guatemala", "Haiti", "Honduras",
                     "Jamaica", "Mexico", "Nicaragua",
                     "Panama", "Trinidad-Tobago", "USA", "St. Lucia" ))
df_europa <- df1 %>%
  filter(País %in% c("Albania", "Armenia", "Austria",
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
  filter(País %in% c("Algeria" ,"Angola", "Benin", "Botswana",
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
  filter(País %in% c("Afghanistan", "Australia", "Bahrain",
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

# América do Sul
#####
df_AmericaDoSul1 <- na.omit(df_AmericaDoSul)

ggplot(df_AmericaDoSul1)+
  aes(`Anos de governo`, fill = Regime)+ 
  geom_histogram(bins = 20, position = 'identity', alpha = 0.5)+
  theme_light()+
  scale_fill_manual(values = cores_cat)
  # Maior parte é presidencialista

# Gráfico de densidade de probabilidade
ggplot(df_AmericaDoSul1)+
  aes(`Anos de governo`, fill = Regime)+ 
  geom_density(bins = 20, position = 'identity', alpha = 0.5)+
  theme_light()+
  scale_fill_manual(values = cores_cat)
# Houveram também mais experiencias presidencialistas com parlamento do que parlamentarismo
# As tres experiencias duraram 10 anos (esperança)

ggplot(df_AmericaDoSul1)+
  aes(`Anos de governo`, fill = Religião)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+
  theme_light()+ 
  scale_fill_manual(values = cores_rgb) 
# Nao há uma maioria de apenas uma religão na america do sul
# evidentemente os governos cristãos não chegaram a durar mais de 5 anos, mas são o maior grupo

ggplot(df_AmericaDoSul1)+
  aes(`Anos de governo`, fill = Ideologia)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+
  theme_light()+
  scale_fill_manual(values = cores_cat) 
# Houveram mais governos de centro e esquerda que duraram até 5 anos
# mas os de direita foram mais duradouros, com alguns durando 3 décadas

ggplot(df_AmericaDoSul)+
  aes(`Anos de governo`, fill = `Mandato finito`)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+ # A maior parte era mandato finito
  theme_light()+
  scale_fill_manual(values = cores_rgb) 
# a maior parte dos mandatos "sem limitação" duraram menos de 10 anos
# houveram relativamente mais governos de "mandato infinito" e curtas durações que mandatos mais longos

ggplot(df_AmericaDoSul1)+
  aes(`Anos de governo`, fill = Nacionalista)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+
  theme_light()+ 
  scale_fill_manual(values = cores_rgb)
# A maioria dos governos não era nacionalista, mas mas costumam ser de menor duração
# Os regimes declaradamente nacionalistas tendem a permanecer mais tempo no poder

ggplot(df_AmericaDoSul1)+
  aes(`Anos de governo`, fill = `Restrições à reeleição`)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+
  theme_light()+
  scale_fill_manual(values = cores_cat) 
# Hoveram alguns mandatos sem limitação que duraram 3 décadas 
# No geral a maioria dos governos sem restrição chegou a uma década de mandato, possivelmente por conta das restrições constitucionais

# Criando um gráfico de barras para variáveis categóricias
ggplot(df_AmericaDoSul1) + 
  aes(`Restrições à reeleição`, fill = Regime) + 
  geom_bar() + 
  theme_light() +
  scale_fill_manual(values = cores_cat)+
  coord_flip()
# Os regimes parlamentaristas na americana latina ocorreram em paísessem restrições a reeleição

ggplot(df_AmericaDoSul1) + 
  aes(Ideologia, fill = Regime) + 
  geom_bar() + 
  theme_light() +
  scale_fill_manual(values = cores_cat)+
  coord_flip()
# Não houveram regimes parlamentaristas de direita na america latina

ggplot(df_AmericaDoSul1) + 
  aes(`Restrições à reeleição`, fill = Ideologia) + 
  geom_bar() + 
  theme_light() +
  scale_fill_manual(values = cores_cat)+
  coord_flip()
# Houveram mais governos de esquerda em países com restrição ate dois mandatos consecutivos
# Houveram mais governos de direita em países sem limitações a reeleição

# Análise multifacetada
ggplot(df_AmericaDoSul1) +
  aes(x = `Anos de governo`, y = Regime , color = Nacionalista) +
  geom_point(alpha = 0.7, size = 3) +
  theme_light() +
  scale_color_manual(values = cores_cat) +
  facet_grid(Ideologia ~ `Restrições à reeleição`)
# Não temos regimes de centro nacionalistas
# O unico regime presidencialista nacionalista era de direita
#####

# América do Norte e Central
#####
df_amn1 <- na.omit(df_AmericaCentraleNorte)

ggplot(df_amn1)+
  aes(`Anos de governo`, fill = Regime)+ 
  geom_histogram(bins = 20, position = 'identity', alpha = 0.5)+
  theme_light()+
  scale_fill_manual(values = cores_cat)
# Maior parte é presidencialista, seguida por parlamentarismo
# Regimes presidencialistas com parlamento foram mais longos 

ggplot(df_amn1)+
  aes(`Anos de governo`, fill = Religião)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+
  theme_light()+ 
  scale_fill_manual(values = cores_rgb) 
# Houveram somente governos declaradamente religiosos que fossem cristãos na america do norte e central

ggplot(df_amn1)+
  aes(`Anos de governo`, fill = Ideologia)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+
  theme_light()+
  scale_fill_manual(values = cores_cat) 
# Houveram mais governos de direita que duraram pouco
# Houveram mais governos de centro 
# O governo mais longevo era de esquerda e se estende por todo o período da amostra

ggplot(df_amn1)+
  aes(`Anos de governo`, fill = Nacionalista)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+
  theme_light()+ 
  scale_fill_manual(values = cores_rgb)
# Os governos não nacionalistas duraram mais tempo
# Há uma concentração de governos nacionalistas que duraram até 10 anos

ggplot(df_amn1)+
  aes(`Anos de governo`, fill = `Restrições à reeleição`)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+
  theme_light()+
  scale_fill_manual(values = cores_cat) 
# Hoveram alguns mandatos sem limitação que duraram 4 décadas 
# Há indicios para acreditar que os governos seguem as constituições e não estendem além do permitido, slvo uma exceção

# Criando um gráfico de barras para variáveis categóricias
ggplot(df_amn1) + 
  aes(`Restrições à reeleição`, fill = Regime) + 
  geom_bar() + 
  theme_light() +
  scale_fill_manual(values = cores_cat)+
  coord_flip()
# Os regimes parlamentaristas ocorreram em países sem restrições a reeleição

ggplot(df_amn1) + 
  aes(Ideologia, fill = Regime) + 
  geom_bar() + 
  theme_light() +
  scale_fill_manual(values = cores_cat)+
  coord_flip()
# As unicas experiencias presidencialistas com parlamento foram de esquerda

ggplot(df_amn1) + 
  aes(`Restrições à reeleição`, fill = Ideologia) + 
  geom_bar() + 
  theme_light() +
  scale_fill_manual(values = cores_cat)+
  coord_flip()
# A maior parte dos regimes sem limtação de reeleição eram de esquerda ou de direita

# Análise multifacetada
ggplot(df_amn1) +
  aes(x = `Anos de governo`, y = Regime , color = Nacionalista) +
  geom_point(alpha = 0.7, size = 3) +
  theme_light() +
  scale_color_manual(values = cores_cat) +
  facet_grid(Ideologia ~ `Restrições à reeleição`)
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
# Maioria esmagadora é parlamentarista

# Gráfico de densidade de probabilidade
ggplot(df_europa1)+
  aes(`Anos de governo`, fill = Regime)+ 
  geom_density(position = 'identity', alpha = 0.5)+
  theme_light()+
  scale_fill_manual(values = cores_cat)
# HA maior parte das experiencias parlamentristas durou ate 10 anos
# As presidencialistas com parlamento foram as mais longas

ggplot(df_europa1)+
  aes(`Anos de governo`, fill = Religião)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+
  theme_light()+ 
  scale_fill_manual(values = cores_cat) 
# Os governos declaradamente católicos foram mais longevos 
# Os governos islámicos duraram mais tempo que cristãos

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
# a maior parte dos mandatos "sem limitação" duraram menos de 10 anos
# houveram relativamente mais governos de "mandato infinito" e curtas durações que mandatos mais longos
# a maior parte dos governos sem restrições a reeleição duraram mais tempo

ggplot(df_europa1)+
  aes(`Anos de governo`, fill = Nacionalista)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+
  theme_light()+ 
  scale_fill_manual(values = cores_rgb)
# A maioria dos governos não era nacionalista, e foram de maiorduração
# Os governos nacionalistas duraram no máximo 15 anos

ggplot(df_europa1)+
  aes(`Anos de governo`, fill = `Restrições à reeleição`)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+
  theme_light()+
  scale_fill_manual(values = cores_rgb) 
# Hoveram alguns mandatos sem limitação que duraram 3 décadas 
# No geral a maioria dos governos sem restrição chegou a uma década de mandato, possivelmente por conta das restrições constitucionais

# Criando um gráfico de barras para variáveis categóricias
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
# Não houveram regimes presidencialistas com parlamento de centro na europa

ggplot(df_europa1) + 
  aes(`Restrições à reeleição`, fill = Ideologia) + 
  geom_bar() + 
  theme_light() +
  scale_fill_manual(values = cores_cat)+
  coord_flip()
# Houveram mais governos de esquerda em países com restrição ate dois mandatos consecutivos
# Houveram mais governos de direita em países sem limitações a reeleição

# Análise multifacetada
ggplot(df_europa1) +
  aes(x = `Anos de governo`, y = Religião , color = Ideologia) +
  geom_point(alpha = 0.7, size = 3) +
  theme_light() +
  scale_color_manual(values = cores_cat) +
  facet_grid(Regime ~ `Restrições à reeleição`)
# Não hoveram experiencias de esquerda católicas, cristâs ou islamicas na europa
# A maior parte das experiencias de direita era catolica ou cristâ
#####

# Africa
#####
df_africa1 <- na.omit(df_Africa)

ggplot(df_africa1)+
  aes(`Anos de governo`, fill = Regime)+ 
  geom_histogram(bins = 20, position = 'identity', alpha = 0.5)+
  theme_light()+
  scale_fill_manual(values = cores_cat)
# Maioria esmagadora é presidencialista
# Governos presidencialistas foram os mais longos

# Gráfico de densidade de probabilidade
ggplot(df_africa1)+
  aes(`Anos de governo`, fill = Regime)+ 
  geom_density(position = 'identity', alpha = 0.5)+
  theme_light()+
  scale_fill_manual(values = cores_cat)
# HA maior parte das experiencias parlamentristas durou ate 20 anos
# As presidencialistas foram as mais longas

ggplot(df_africa1)+
  aes(`Anos de governo`, fill = Religião)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+
  theme_light()+ 
  scale_fill_manual(values = cores_cat) 
# Os governos declaradamente Hindus foram mais longevos 
# Os governos islámicos duraram menos tempo, mas foram mais numerosos 

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
# a maior parte dos governos sem restrições a reeleição duraram mais tempo
# Ha uma quantidade considerável de governos sem limitações que duraram décadas

ggplot(df_africa1)+
  aes(`Anos de governo`, fill = Nacionalista)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+
  theme_light()+ 
  scale_fill_manual(values = cores_rgb)
# Ser nacionalista não influenciou muito na duração de governo
# Houveram mais governos não nacionalistas

ggplot(df_africa1)+
  aes(`Anos de governo`, fill = `Restrições à reeleição`)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+
  theme_light()+
  scale_fill_manual(values = cores_cat) 
# Hoveram alguns mandatos longos porém com limitações 
# Houve uma quantidade considerável de regimes com até 3 mandatos consecutivos

# Criando um gráfico de barras para variáveis categóricias
ggplot(df_africa1) + 
  aes(Ideologia, fill = Regime) + 
  geom_bar() + 
  theme_light() +
  scale_fill_manual(values = cores_rgb)+
  coord_flip()
# A maior parte dos regimes presidencialistas era declaradamente de esquerda
# Houveram poucas experiencias parlamentaristas na africa

ggplot(df_africa1) + 
  aes(`Restrições à reeleição`, fill = Ideologia) + 
  geom_bar() + 
  theme_light() +
  scale_fill_manual(values = cores_cat)+
  coord_flip()
# O unico regime com 3 mandatos consecutivos era de esquerda

# Análise multifacetada
ggplot(df_africa1) +
  aes(x = `Anos de governo`, y = Religião , color = Ideologia) +
  geom_point(alpha = 0.7, size = 3) +
  theme_light() +
  scale_color_manual(values = cores_cat) +
  facet_grid(Regime ~ `Restrições à reeleição`)
# Como no caso da europa, não houveram regimes de esquerda declarademnete hindus ou islamicos

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
  aes(`Anos de governo`, fill = Religião)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+
  theme_light()+ 
  scale_fill_manual(values = cores_cat) 
# A maior parte dos governos era delcaradamente islamica, seguida por hindu
# Tanto os governos islamicos quanto hindus e cristaos duraram ate 10 anos, os não delcarados foram mais longevos

ggplot(df_asia1)+
  aes(`Anos de governo`, fill = Ideologia)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+
  theme_light()+
  scale_fill_manual(values = cores_cat) 
# Houveram mais governos de direita, porém mais curtos, chegando a no máximo 10 anos
# Governos de centro e esquerda duraram mais

ggplot(df_asia1)+
  aes(`Anos de governo`, fill = `Mandato finito`)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+ # A maior parte era mandato finito
  theme_light()+
  scale_fill_manual(values = cores_rgb) 
# houveram relativamente mais governos de "mandato infinito" 
# a maior parte dos governos sem restrições a reeleição duraram de 10 a 20 anos
# Ha uma quantidade considerável de governos sem limitações que duraram décadas

ggplot(df_asia1)+
  aes(`Anos de governo`, fill = Nacionalista)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+
  theme_light()+ 
  scale_fill_manual(values = cores_rgb)
# Ser nacionalista influenciou na duração de governo, os nacionalistas foram mais longos
# Houveram mais governos não nacionalistas

ggplot(df_asia1)+
  aes(`Anos de governo`, fill = `Restrições à reeleição`)+ 
  geom_density(position = 'identity', alpha = 0.5, color = NA)+
  theme_light()+
  scale_fill_manual(values = cores_cat) 
# Hoveram alguns mandatos longos porém com limitações 
# Apesar de não haverem limitações, os governos sem limitações duraram até 10 anos

# Criando um gráfico de barras para variáveis categóricias
ggplot(df_asia1) + 
  aes(Ideologia, fill = Regime) + 
  geom_bar() + 
  theme_light() +
  scale_fill_manual(values = cores_rgb)+
  coord_flip()
# A maior parte dos regimes presidencialistas com parlamento era declaradamente de esquerda

# Análise multifacetada
ggplot(df_asia1) +
  aes(x = `Anos de governo`, y = Religião , color = Ideologia) +
  geom_point(alpha = 0.7, size = 3) +
  theme_light() +
  scale_color_manual(values = cores_cat) +
  facet_grid(Regime ~ `Restrições à reeleição`)
# Houveram governos islamicos de esquerda
# houveram governos hindus de direita
# houveram governos cristãos de direita e de centro
# religião nao parece ser o definidor da duração do mandato na Asia e oceania
#####