library(tidyverse)
library(readr)

# Importando os dados
data <- read_csv("C:/Users/Lucas/Desktop/projeto/DPI2020.csv")

# Definido o escopo da análise: filtrando os países e as variáveis
df <- data %>%
  arrange(countryname)
  
df <- df[, c('countryname','execnat', 'system', 'yrsoffc',
             'finittrm','execrlc','execrel', 'reelect', 
             'prtyin', 'year', 'termlimit', 'herfgov', 'herfopp')] %>%
  rename('Anos de governo' = 'yrsoffc',
         'Religião' = 'execrel',
         'Ideologia' = 'execrlc',
         'Reeleição' = 'reelect',
         'País' = 'countryname',
         'Ano' = 'year',
         'Mandato finito' = 'finittrm',
         'Regime' = 'system',
         'Anos de Mandato' = 'prtyin',
         'Nacionalista' = 'execnat',
         'Restrições à reeleição' = 'termlimit',
         'Herfindal(Governo)' = 'herfgov',
         'Herfindal(Oposição)' = 'herfopp') %>%
  mutate(País = recode(País, "FRG/Germany" = "Germany")) %>%
  dplyr :: na_if(-999) %>%
  dplyr :: na_if('')

# Definindo as variáveis categóricas  e atribuindo nomes às categorias
df$Regime <- factor(df$Regime,
                    levels = c('Presidential',
                               'Assembly-Elected President',
                               'Parliamentary'),
                    labels = c('Presedencialismo',
                               'Presidente eleito pelo parlamento',
                               'Parlamentarismo'))

df$`Mandato finito` <- factor(df$`Mandato finito`,
                              levels = c(0, 1),
                              labels = c('Não', 'Sim'))

df$Reeleição <- factor(df$Reeleição,
                       levels = c(0,1),
                       labels = c('Não', 'Sim'))

df$Ideologia <- factor(df$Ideologia,
                       levels = c(0,
                                  'Right',
                                  'Center',
                                  'Left'),
                       labels = c('Sem informação',
                                  'Direita',
                                  'Centro',
                                  'Esquerda'))
df$Religião <- factor(df$Religião,
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
df$Nacionalista <- factor(df$Nacionalista,
                          levels = c(0,1),
                          labels = c('Não', 'Sim'))

df$`Restrições à reeleição` <- factor(df$`Restrições à reeleição`,
                                      levels = c(1,2,3,4,5,6,7,8),
                                      labels = c('Sem limitações',
                                                 'limitação a mandatos consecutivos',
                                                 'Até dois mandatos não consecutivos',
                                                 'Até dois mandatos consecutivos',
                                                 'Proibido se reeleger',
                                                 'Até 3 mandatos consecutivos',
                                                 'Reeleição possível se ficar 2 mandatos fora',
                                                 'Até dois mandatos'))
