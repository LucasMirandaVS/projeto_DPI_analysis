# Investigando a relação entre política e religão

#### Motivação, Dados utilizados e ferramentas implementadas
 O departamento de pesquisa do Banco Inter Americano divulgou em 2020 a versão atualizada de sua base de dados com informações sobre todos os países das Nações Unidas(DPI2020 Database of Political Institutions). Tendo em vista a disponibilidade de dados confiáveis sobre a maioria dos países do mundo e com grande variedade, decidi agrupar os países por região geográfica e investiguar as possíveis relações entre a duração dos mandatos dos governantes e sua inclinação política, sua ideologia e características dos governos como tipo de sistema implementado, se o governante pode se reeleger ou não. 

O projeto foi realizado na linguagem R. Mais especificamente, foram utilizadas as funções do pacote tidyverse, assim como do ggpl2, cowplot e psych para visualização de dados. Por simplificação, os países foram agrupados por regiões geográficas para a realização das análises gráficas. As informações sobre os critérios para formulação das variáveis pode ser encontrada no endereço na parte de refeências. 

#### Variáveis analisadas
Tendo em vista o objetivo do projeto em analisar as relações entre s tipos de mandatos, sua duração e características como inclinação ideológica e religiosa, as variáveis escolhidas foram as seguintes:
* Anos de governo
* Religião (Católico, Cristão, Hindu, Judeu ou Islãmico)
* Ideologia (Esquerda, direita ou centro)
* Reeleição (Se o governante pode se reeleger ou não)
* Mandato Finito (Se existe alguma limitação no mandato do governante ou não)
* Regime de governo (Presidencialista, Parlamentarista ou Presidente eletio por parlamento) 
* Nacionalista (Se é nacionalista ou não)
* Restrições à reeleição ( Se existe alguma restrição à reeleição ou não)

#### Conclusão
Como esperado, as análises mostraram que as durações dos governos podem ser atribuídas à diferentes fatores nas diferentes regiões do mundo. Em algumas delas a ideologia pareceu estar relacionada a duração dos mandatos, em outras regiões a durações dos governos estavam mais relacionadas à aspectos constitucionais e religiosos. As análises de cada região estão nos arquivos Jupyter Notebook.

## Referências
<a id="1">[1]</a> 
Cruz, Cesi, Philip Keefer, and Carlos Scartascini. 2021. Database of Political Institutions 2020.
Washington, DC: Inter-American Development Bank Research Department.
Distributed by Washington, DC: Inter-American Development Bank Numbers for Development.
http://dx.doi.org/10.18235/0003049
