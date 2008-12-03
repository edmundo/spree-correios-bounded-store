# Correios Loja Vinculada (spree-correios-bounded-store)

Extensão que fornece suporte ao web service de cálculo remoto de frete dos correios, acessível quando o serviço é contratado utilizando uma "loja vinculada".

## Instalação

        script/extension install git://github.com/edmundo/spree-correios-bounded-store.git

## Como funciona

Esta extensão foi baseada na extensão active_shipping (suporte aos métodos de envio fornecidos pelo plugin active_shipping) desenvolvida pelo Sean Schofield, portanto funciona de forma bastante similar acessando o web service dos correios porém a utilização do plugin active_shipping foi removida.

## Configuração

Você pode configurar a sua conta utilizada para acessar o serviço dos correios acessando as configurações da extensão através do módulo administrativo.

## Testes

O sistema tem algumas ações que respondem com respostas pré-definidas imitando o web service dos correios, ... TODO

## Agradecimentos

Ao Sean Schofield por ter publicado a extensão active_shipping e ter me poupado bastante trabalho.
