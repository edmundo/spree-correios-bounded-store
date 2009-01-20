# Correios Loja Vinculada (spree-correios-bounded-store)
Extensão que fornece suporte ao web service de cálculo remoto de frete dos correios, acessível quando o serviço é contratado utilizando uma "loja vinculada".

## Instalação
        script/extension install git://github.com/edmundo/spree-correios-bounded-store.git

Para utilizar a extensão é necessário criar os métodos de envio que utilizam a extensão, eles podem ser criados manualmente ou automaticamente utilizando o comando `rake spree:extensions:correios_bounded_store:load_sample_data` o conteúdo referido está disponível em `db/sample`.

## Como funciona
Esta extensão foi baseada na extensão `active_shipping` (suporte aos métodos de envio fornecidos pelo plugin `active_shipping`) desenvolvida pelo Sean Schofield, portanto funciona de forma bastante similar acessando o web service dos correios porém a utilização do plugin `active_shipping` foi removida. Permite a configuração de um serviço e preço padrão para o caso de haver algum problema de comunicação com o serviço dos correios.

## Estado atual
Em desenvolvimento.

## Código mantido dentro do diretório app a ser mixado
Atualmente não estou colocando o código dentro do arquivo `..._extension.rb` utilizando `class_eval`, favor dar uma olhada nos últimos commits aqui `http://github.com/edmundo/spree/tree/app_override` para fazer o código de dentro do `app` ser mixado automaticamente.

## Pendente
* Levar em consideração não só o peso mas também o volume do pedido no cálculo do preço.

## Configuração
Você pode configurar a sua conta utilizada para acessar o serviço dos correios acessando as configurações da extensão através do módulo administrativo.

## Testes

O sistema tem algumas ações que respondem com respostas pré-definidas imitando o web service dos correios.

## Agradecimentos

Ao Sean Schofield por ter publicado a extensão `active_shipping` e ter me poupado bastante trabalho.
