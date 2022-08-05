# Data Visualization: Dados Geopolíticos

#### Dados utilizados e ferramentas implementadas
 O departamento de pesquisa do Banco Inter Americano divulgou em 2020 a versão atualizada de sua base de dados com informações sobre todos os países das Nações Unidas (DPI2020 Database of Political Institutions). Esta base cataloga os anos de 1975 a 2020 e contém informações acerca da situação política local (número de cadeiras no congresso por partido, qual partido tem maioria no senado, etc). 

Tendo em vista a disponibilidade de dados confiáveis sobre a maioria dos países do mundo e com grande variedade, decidi agrupar os países por região geográfica e investiguar as possíveis relações entre a duração dos mandatos dos governantes e sua inclinação política, sua ideologia e características dos governos como tipo de sistema implementado.
 
Como ferramentas de visualização foram escolhidos os gráficos de densidade e histograma. Essa escolha foi feita levando em consideração a heterogeneidade dos dados analisados, a medida que leva a frequencia dos dados em consideração: No caso do gráfico de densidade quanto maior a curva, maior a frequencia de ocorrencias de uma observação. 

O projeto foi realizado com a linguagem R. Mais especificamente, para a etapa de limpeza e manipulação dos dados foram utilizadas as funções dos pacotes tidyverse. Já os gráficos foram gerados usando o pacote ggplot2. Os dados utilizados encontram-se no csv disponibilizado neste repositório. As informações sobre os critérios para formulação das variáveis pode ser encontrada no endereço na parte de referências. 

#### Perguntas orientadoras da análise

* Existe relação entre a duração do mandato dos governos e sua inclinação política?
* E quanto à religião? Existe relação entre a duração do mandato dos governos e a sua inclinação religiosa?
* Quais são os sistemas de governo mais prevalentes de acordo com cada continente? Isso tem alguma relação com sua ideologia politca?
* Existe alguma correlação entre a ideologia dos governos com possíveis restrições constitucionais à reeleição? E com relação à religião?

#### Variáveis analisadas
Tendo em vista o objetivo do projeto em analisar as relações entre os tipos de mandatos, sua duração e características como inclinação ideológica e religiosa, as variáveis escolhidas foram as seguintes:

* Anos de governo
* Religião (Católico, Cristão, Hindu, Judeu ou Islãmico)
* Ideologia (Esquerda, direita ou centro)
* Reeleição (Se o governante pode se reeleger ou não)
* Mandato Finito (Se existe alguma limitação no mandato do governante ou não)
* Regime de governo (Presidencialista, Parlamentarista ou Presidente eleito por parlamento) 
* Nacionalista (Se é nacionalista ou não)
* Restrições à reeleição ( Se existe alguma restrição à reeleição ou não)

### Resultados:

#### África: 

O que pôde se observar a partir dos dados do continente africano era que ao longo da amostra houve uma prevalencia de regimes parlamentaristas. Entretanto, os governos presidencialistas foram os mais longevos. Como pode ser observado a partir do gráfico de densidade no canto esquerdo abaixo: À medida que as curvas percorrem o eixo dos anos, a curva que representa os anos de regimes presidenciais permanece por cima. 

O gráfico da direita por sua vez mostra a relação dos anos de governo com as religiões dos regimes na África: Houveram mais governos Islãmicos no continente. Entretanto, os governos Hindus pareceram durar mais tempo de forma geral.
 
![image](https://user-images.githubusercontent.com/77032413/182972550-d5d9f09e-4ae3-4fe1-b403-e85882b4f6fe.png) ![image](https://user-images.githubusercontent.com/77032413/182973387-664c4831-ec98-48b6-9e62-13ab5de7444c.png)


#### América do Norte e América Central

Em relação as américas do norte e central, foi constatado que a maior partes dos regimes analisados era presidencialista. Em relação à ideologia, houveram mais regimes de direita, mas esses duraram menos tempo que alguns regimes de esquerda que chagaram a durar décadas. 

O curioso dessa amostra é que é possivel identificar que este governo em questão ocorreu em um país sem restrições constitucionais para reeleição, o que em parte explica a dua duração. Este fato pode ser confirmado analisando os dois gráficos: O comportamento desse governo se reproduz nos dois gráficos na forma das linhas se achatarem de forma similar e percorrerem todo o tempo da amostra

![image](https://user-images.githubusercontent.com/77032413/182042058-40b63fe0-6756-4311-ad6d-ebb0e60f69d0.png)
![image](https://user-images.githubusercontent.com/77032413/182041994-59887f0e-9113-4aeb-a265-305fa06bc8b6.png)
#### América do Sul

No caso do subcontinente sulamericano, a maior parte dos regimes analisados era presidencialista. Houveram também mais experiencias presidencialistas com parlamento do que parlamentarismo, e as tres experiencias duraram 10 anos (em média). Essa maioria esmagadora de regimes presidenciais pode ser observada no gráfico abaixo ao canto esquerdo.

Quanto à ideologia, houveram mais governos de centro e esquerda que duraram até 5 anos, mas os de direita foram mais duradouros, com alguns durando 3 décadas. Através do histograma abaixo é possível observar que as experiencias "não presidencialistas" não ocorreram em governos de centro, apenas direita e esquerda.

![image](https://user-images.githubusercontent.com/77032413/182972242-90bb5215-ccff-4740-8992-9a0a1bd1fcb6.png) ![image](https://user-images.githubusercontent.com/77032413/182972381-247dc054-42dd-427a-b95c-bc728f58a50e.png)



#### Europa

Em relação ao continente europeu, a maioria esmagadora dos países da amostra tinha regimes parlamentaristas. Também foi possível observar que a maior parte das experiencias parlamentristas durou ate 10 anos. Contudo, as experiências presidencialistas com parlamento foram as mais longas em termos de anos de governo, conforme mostra o gráfico de densidade.

O histograma mostra a disposição das ideologias dos mandatários de acordo com o regime de governo. Nele é possível observar que ao contrário da América do sul, os regimes de esquerda e direita ocorrerem em sua maioria em regimes parlamentaristas.

![image](https://user-images.githubusercontent.com/77032413/182042489-edaf4d21-e986-4961-b652-65182d34ee3e.png) ![image](https://user-images.githubusercontent.com/77032413/182972741-94fed5d5-1ef8-478d-a5fd-200ee332884b.png)


#### Asia e Oceania

Apesar da amostra analisada comportar mais de uma região geográfica, foi possível constatar que dos países incluídos, a religião da maior parte dos governos religiosos era delcaradamente islamica, seguida por hindu. Tanto os governos islamicos quanto hindus e cristãos duraram até 10 anos. Esse padrão pode ser observado no g´rafico da esquerda: As curvas caem vertiginosamente na marca dos 10 anos de governo.

Outro ponto notável dessa amostra é que há uma quantidade considerável de governos sem limitações que duraram décadas. Isso pode ser contstado analisando o gráfico da direita: A partir dos 10 anos de governo, há uma prevalencia de regimes sem limitações à reeleição.

![image](https://user-images.githubusercontent.com/77032413/182042555-7c2cabb8-63d0-4539-a4a6-d5dad5f9ee5d.png) ![image](https://user-images.githubusercontent.com/77032413/182973108-d80a8ff5-fd1b-4105-a5c0-b4f66d149ec1.png)


### Conclusão
Como esperado, as análises mostraram que as durações dos governos podem ser atribuídas à diferentes fatores nas diferentes regiões do mundo. Não há um fator comum à todas as regiões que parece ser determinante na duração dos governos. Em algumas delas a ideologia pareceu estar relacionada a duração dos mandatos, em outras regiões a durações dos governos estavam mais relacionadas à aspectos constitucionais e religiosos. 

As durações dos mandatos dos governantes parecem estar associadas à uma série de fatores, alguns deles não estão incluídos nos dados dispinibilizados pelos pesquisadores do Banco Interamericano, outros não podem ser facilmente quantificados para este tipo de análise. Entretanto, fica a sugestão de inclusão de outras variáveis para a amostra, a fim de averiguar se estes resultados persistem. Finalmente, as análises completas de cada região, junto com o código estão nos arquivos Jupyter Notebook. 

## Referências
<a id="1">[1]</a> 
Cruz, Cesi, Philip Keefer, and Carlos Scartascini. 2021. Database of Political Institutions 2020.
Washington, DC: Inter-American Development Bank Research Department.
Distributed by Washington, DC: Inter-American Development Bank Numbers for Development.
http://dx.doi.org/10.18235/0003049
