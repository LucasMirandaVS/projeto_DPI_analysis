library(tidyverse)
library(readr)

# Importando os dados
data <- read_csv("C:/Users/Lucas/Desktop/projeto/DPI2020.csv")

# Definido o escopo da análise: filtrando os países e o período
df <- data %>%
  arrange(countryname)
  
df <- df[, c('countryname', 'system', 'yrsoffc', 'finittrm',
             'execrlc','execrel', 'reelect', 'prtyin', 'year')] %>%
  rename('Anos de governo' = 'yrsoffc',
         'Religião' = 'execrel',
         'Ideologia' = 'execrlc',
         'Reeleição' = 'reelect',
         'País' = 'countryname',
         'Ano' = 'year',
         'Mandato finito' = 'finittrm',
         'Regime' = 'system',
         'Anos do partido' = 'prtyin') %>%
  mutate(País = recode(País, "FRG/Germany" = "Germany")) %>%
  dplyr :: na_if(-999) %>%
  dplyr :: na_if('')

summary(df)

# Definindo as variáveis categóricas e lidando com os NA's
# Atribuindo nomes as categorias
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


