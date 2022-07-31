# Data Visualization: Dados Geopolíticos

#### Dados utilizados e ferramentas implementadas
 O departamento de pesquisa do Banco Inter Americano divulgou em 2020 a versão atualizada de sua base de dados com informações sobre todos os países das Nações Unidas (DPI2020 Database of Political Institutions). Esta base cataloga os anos de 1975 a 2020 e contém informações acerca da situação política local (número de cadeiras no congresso por partido, qual partido tem maioria no senado, etc). Tendo em vista a disponibilidade de dados confiáveis sobre a maioria dos países do mundo e com grande variedade, decidi agrupar os países por região geográfica e investiguar as possíveis relações entre a duração dos mandatos dos governantes e sua inclinação política, sua ideologia e características dos governos como tipo de sistema implementado, se o governante pode se reeleger ou não. 

O projeto foi realizado com a linguagem R. Mais especificamente, foram utilizadas as funções do pacote tidyverse, assim como do ggplot2, cowplot e psych para visualização de dados. Por simplificação, os países foram agrupados por regiões geográficas para a realização das análises gráficas. Os dados utilizados encontram-se no csv disponibilizado neste repositório. As informações sobre os critérios para formulação das variáveis pode ser encontrada no endereço na parte de referências. 

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

No continente africano o que pôde se observar era que ao longo da amostra houve uma prevalencia de regimes presidencialistas. Esses governos também costumavam ser os mais duradouros. Quanto à religião, os governos declaradamente Hindus foram os mais longevos da amostra. Contudo, os governos islãmicos foram mais numerosos, apesar de durarem menos tempo. Quanto à idologia, dos países analisados os governos classificados como de esquerda duraram mais tempo, conforme mostra o gráfico abaixo. Vale observar que para o continente africano, há uma quantidade considerável de governos sem limitações que duraram décadas. Quanto à duração, houve uma quantidade considerável de regimes com até 3 mandatos consecutivos. No geral, houveram poucas experiencias parlamentaristas na África.

![africa](https://user-images.githubusercontent.com/77032413/182041486-5c16291f-dfe8-4192-bda6-8e6ae1fe1dc4.png)

#### América do Norte e América Central

Em relação as américas do norte e central, foi constatado que a maior partes dos regimes analisados era presidencialista. Entretando, em se tratando do número de anos de governo, os regimes presidencialistas. Quanto à religião, houveram somente governos declaradamente religiosos que fossem cristãos na america do norte e central, mas esses governos não duraram mais de 10 anos. Em relação à ideologia, houveram mais regimes de direita, mas esses duraram menos tempo que alguns regimes de esquerda que chagaram a durar décadas. O curioso dessa amostra é que é possivel identificar que este governo em questão ocorreu em um país sem restrições constitucionais para reeleição, o que em parte explica a dua duração. Este fato pode ser confirmado analisando os dois gráficos. 

![image](https://user-images.githubusercontent.com/77032413/182042058-40b63fe0-6756-4311-ad6d-ebb0e60f69d0.png)
![image](https://user-images.githubusercontent.com/77032413/182041994-59887f0e-9113-4aeb-a265-305fa06bc8b6.png)

No mais, observou-se que os regimes parlamentaristas ocorreram em países sem restrições a reeleição, e que além disso, as unicas experiencias presidencialistas com parlamento foram de esquerda. Outro fato notável é que os unicos regimes parlamentaristas e nacionalistas foram de direita.

#### América do Sul

No caso do subcontinente sulamericano, a maior parte dos regimes analisados era presidencialista. Houveram também mais experiencias presidencialistas com parlamento do que parlamentarismo, e as tres experiencias duraram 10 anos (em média). Nao há uma maioria de apenas uma religão na America do Sul. Além disso, os governos cristãos não chegaram a durar mais de 5 anos, mas são o maior grupo. Quanto à ideologia, houveram mais governos de centro e esquerda que duraram até 5 anos, mas os de direita foram mais duradouros, com alguns durando 3 décadas. A maior parte dos mandatos "sem limitação" duraram menos de 10 anos. Também foi possível observar que houveram relativamente mais governos de "mandato infinito" e curtas durações que mandatos mais longos. Outra descoberta notável é a de que os regimes declaradamente nacionalistas tendem a permanecer mais tempo no poder. No geral a maioria dos governos sem restrição chegou a uma década de mandato, possivelmente por conta das restrições constitucionais.

![image](https://user-images.githubusercontent.com/77032413/182042267-efa6b400-0b53-479e-84c1-77da3843fad2.png)

#### Europa

Em relação ao continente europeu, a maioria esmagadora dos países da amostra tinha regimes parlamentaristas. Também foi possível observar que a maior parte das experiencias parlamentristas durou ate 10 anos. Contudo, as experiências presidencialistas com parlamento foram as mais longas em termos de anos de governo. Quanto à religião, os governos islámicos duraram mais tempo que cristãos. Em relação à ideologia, constatou-se que os governos de equerda foram os mais longos, mas houveram mais governos de centro de forma geral. A maioria dos governos não era classifica como nacionalista, e foram de maior duração. Contudo, houveram governos classificados como nacionalistas que duraram 15 anos. Também foi possível constatar que a maior parte das experiencias de direita era católica ou cristã.

![image](https://user-images.githubusercontent.com/77032413/182042489-edaf4d21-e986-4961-b652-65182d34ee3e.png)

#### Asia e Oceania

Apesar da amostra analisada comportar mais de uma região geográfica, foi possível constatar que dos países incluídos, a maioria  era parlamentarista, seguida por presidencialista. Também observou-se que os governos presidencialistas foram os mais longos. Quanto à relgião a maior parte dos governos era delcaradamente islamica, seguida por hindu Tanto os governos islamicos quanto hindus e cristaos duraram ate 10 anos, os não delcarados foram mais longevos, conforme mostra opo gráfico abaixo.
Quanto a ideologia, pôde-se observar que houveram mais governos de direita, chegando a no máximo 10 anos. Entretanto, os governos de centro e esquerda duraram mais.
Vale salientar que para os dados analisados há uma quantidade considerável de governos sem limitações que duraram décadas. Por fim, observou-se que houveram governos islamicos de esquerda e governos hindus de direita. Também houveram governos cristãos de direita e de centro.

![image](https://user-images.githubusercontent.com/77032413/182042555-7c2cabb8-63d0-4539-a4a6-d5dad5f9ee5d.png)

#### Conclusão
Como esperado, as análises mostraram que as durações dos governos podem ser atribuídas à diferentes fatores nas diferentes regiões do mundo. Em algumas delas a ideologia pareceu estar relacionada a duração dos mandatos, em outras regiões a durações dos governos estavam mais relacionadas à aspectos constitucionais e religiosos. As análises completas de cada região, junto com o código estão nos arquivos Jupyter Notebook. 

## Referências
<a id="1">[1]</a> 
Cruz, Cesi, Philip Keefer, and Carlos Scartascini. 2021. Database of Political Institutions 2020.
Washington, DC: Inter-American Development Bank Research Department.
Distributed by Washington, DC: Inter-American Development Bank Numbers for Development.
http://dx.doi.org/10.18235/0003049
