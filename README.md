# akatus-demo

Este é exemplo de integração entre uma aplicação Rails de e-commerce e o meio de pagamento [Akatus][1].

A aplicação usa a gem [`akatus-rails`][2].

## Como rodar a aplicação

Copie o código da aplicação para o seu computador:

    $ git clone git@github.com:kauplus/akatus-demo.git

Instale as dependências:

```
$ cd akatus-demo
$ bundle install
```

Altere o arquivo `config/akatus.yml` para inserir as credenciais (email e API key) da sua conta Akatus.

Inicie o servidor:

    $ bundle exec rails server

Acesse a aplicação no seu navegador pelo endereço `http://localhost:3000`.

## Como contribuir

1. Crie um fork da gem
2. Crie uma feature branch (`git checkout -b my-new-feature`)
3. Faça um commit das suas alterações (`git commit -am 'Add some feature'`)
4. Envie para o GitHub (`git push origin my-new-feature`)
5. Crie um novo pull request


  [1]: https://site.akatus.com/
  [2]: https://github.com/kauplus/akatus-rails
