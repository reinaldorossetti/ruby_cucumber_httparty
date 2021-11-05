# Projeto usando o Httparty e Cucumber.

A configuração (importe das gems) está dentro do **suport/env.rb** e a instância do Httparty está dentro do módulo Http, com isso eu elimino muito código desnecessário.

# PASSO A PASSO

**1 - Faça um clone no projeto no seu PC.**

git clone https://github.com/reinaldorossetti/ruby_cucumber_httparty.git

**2 - Passo de entre na pasta do projeto**
```
cd ruby_cucumber_httparty
```
**3 - Passo instale as dependências**
```
bundle install
```
** Precisa instalar a gem, comando "gem install bundle", sem aspas duplas.

**4- Passo rode o nosso projeto, abrar o terminal em tests e envie o comando abaixo:**

```
bundle exec cucumber
bundle exec cucumber features/specs/verbo_get.feature
```
Para visualizar o relatório gerado do allure report, segue o link abaixo:
```
https://reinaldorossetti.github.io/ruby_cucumber_httparty/
```
Vídeos curtos do nosso projeto, somente pra explicar a lógica e execução:
https://www.loom.com/share/f82c0068aae147dc8f0220570a0687fa
https://www.loom.com/share/0d81599eeda64b47ba0a26d170a378d8

** Obs:
- Precisa atualizar a session pegando o valor do site e adicionando no arquivo abaixo:
https://github.com/reinaldorossetti/ruby_cucumber_httparty/blob/main/features/support/headers/cookie.json

Para adiciona compatibilidade com linux x86 e x64 na esteira, rode esse comando local.
```
bundle lock --add-platform x86_64-linux
```
Referências:  
https://github.com/ruby-json-schema/json-schema/tree/master  
https://github.com/jnunemaker/httparty  
