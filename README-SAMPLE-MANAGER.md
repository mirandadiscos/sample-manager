# SAMPLE MANAGER

## Uma api para gerenciar amostras e resultados de amostras geradas através de um LIS, e resultados de equipamentos inloco
Uma api que vai armazenar dados da amostra, como codigo de barras, descricao e data da coleta. Irá aplicar verificações nesses resultados a fim de garantir uma experiencia melhor.

## Descricao das tabelas
- sample
Referencia aos dados da amostra: 
Codigo de barras, Descricao e Data de coleta sao dados obrigatorios para essa tabela.

commit: 23 testes escritos, entre unitarios e de request(a opcao de delete e update está implementada devido ao scaffold, posteriormente pensei em criar um painel administrativo que ai sim, possa fazer exclusao de amostras. 

- sample-tests
Referencia aos testes que serao realizados nessa amostra, representados por siglas.
  id_sample será uma chave estrangeira que se conecta
  cada teste é representado com um código alpha numerico e é obrigatorio. 

- sample-results
Será referencia a amostra e aos testes. Cada teste pode ter mais de um resultado.
id_test
id_sample
resultado


