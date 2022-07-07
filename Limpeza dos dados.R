library(tidyverse)
library(readr)

# Importando os dados
data <- read_csv("C:/Users/Lucas/Desktop/projeto/DPI2020.csv")

# Definido o escopo da an�lise: filtrando os pa�ses e o per�odo
df <- data %>%
  arrange(countryname)
  
df <- df[, c('countryname', 'system', 'yrsoffc', 'finittrm',
             'execrlc','execrel', 'reelect', 'prtyin', 'year')] %>%
  rename('Anos de governo' = 'yrsoffc',
         'Religi�o' = 'execrel',
         'Ideologia' = 'execrlc',
         'Reelei��o' = 'reelect',
         'Pa�s' = 'countryname',
         'Ano' = 'year',
         'Mandato finito' = 'finittrm',
         'Regime' = 'system',
         'Anos do partido' = 'prtyin') %>%
  mutate(Pa�s = recode(Pa�s, "FRG/Germany" = "Germany")) %>%
  dplyr :: na_if(-999) %>%
  dplyr :: na_if('')

summary(df)

# Definindo as vari�veis categ�ricas e lidando com os NA's
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
                              labels = c('N�o', 'Sim'))

df$Reelei��o <- factor(df$Reelei��o,
                       levels = c(0,1),
                       labels = c('N�o', 'Sim'))

df$Ideologia <- factor(df$Ideologia,
                       levels = c(0,
                                  'Right',
                                  'Center',
                                  'Left'),
                       labels = c('Sem informa��o',
                                  'Direita',
                                  'Centro',
                                  'Esquerda'))
df$Religi�o <- factor(df$Religi�o,
                      levels = c(0,
                                 'Christian',
                                 'Catholic',
                                 'Islamic',
                                 'Hindu'),
                      labels = c('Outro',
                                 'Crist�o',
                                 'Cat�lico',
                                 'Isl�',
                                 'Hindu'))

