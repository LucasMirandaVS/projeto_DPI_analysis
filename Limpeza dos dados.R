library(tidyverse)
library(readr)

# Importando os dados
data <- read_csv("C:/Users/Lucas/Desktop/projeto/DPI2020.csv")

# Definido o escopo da análise: filtrando os países e o período
df1 <- data %>%
  arrange(countryname)
  
df1 <- df1[, c('countryname','execnat', 'system', 'yrsoffc',
             'finittrm','execrlc','execrel', 'reelect', 
             'year', 'termlimit')] %>%
  rename('Anos de governo' = 'yrsoffc',
         'Religião' = 'execrel',
         'Ideologia' = 'execrlc',
         'Reeleição' = 'reelect',
         'País' = 'countryname',
         'Ano' = 'year',
         'Mandato finito' = 'finittrm',
         'Regime' = 'system',
         'Nacionalista' = 'execnat',
         'Restrições à reeleição' = 'termlimit') %>%
  mutate(País = recode(País, "FRG/Germany" = "Germany")) %>%
  dplyr :: na_if(-999) %>%
  dplyr :: na_if('')

summary(df1)

# Definindo as variáveis categóricas  e atribuindo nomes às categorias
df1$Regime <- factor(df1$Regime,
                    levels = c('Presidential',
                               'Assembly-Elected President',
                               'Parliamentary'),
                    labels = c('Presedencialismo',
                               'Presidente eleito pelo parlamento',
                               'Parlamentarismo'))

df1$`Mandato finito` <- factor(df1$`Mandato finito`,
                              levels = c(0, 1),
                              labels = c('Não', 'Sim'))

df1$Reeleição <- factor(df1$Reeleição,
                       levels = c(0,1),
                       labels = c('Não', 'Sim'))

df1$Ideologia <- factor(df1$Ideologia,
                       levels = c(0,
                                  'Right',
                                  'Center',
                                  'Left'),
                       labels = c('Sem informação',
                                  'Direita',
                                  'Centro',
                                  'Esquerda'))
df1$Religião <- factor(df1$Religião,
                      levels = c(0,
                                 'Christian',
                                 'Catholic',
                                 'Islamic',
                                 'Hindu'),
                      labels = c('Outro',
                                 'Cristão',
                                 'Católico',
                                 'Islã',
                                 'Hindu'))
df1$Nacionalista <- factor(df1$Nacionalista,
                          levels = c(0,1),
                          labels = c('Não', 'Sim'))

df1$`Restrições à reeleição` <- factor(df1$`Restrições à reeleição`,
                                      levels = c(1,2,3,4,5,6,7,8),
                                      labels = c('Sem limitações',
                                                 'limitação a mandatos consecutivos',
                                                 'Até dois mandatos não consecutivos',
                                                 'Até dois mandatos consecutivos',
                                                 'Proibido se reeleger',
                                                 'Até 3 mandatos consecutivos',
                                                 'Reeleição possível se ficar 2 mandatos fora',
                                                 'Até dois mandatos'))

# Salvando os dados
save(df1, file = 'saved.dt1.RData')
