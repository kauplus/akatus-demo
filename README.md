akatus-demo
===========

Este é um demo de integração da Akatus com Rails

Documentação INTEGRAÇÃO + RÁPIDA (para ver todos os campos)
- https://dev.akatus.com/docs/manual_integracao_rapida.pdf

Documentação NIP
- https://dev.akatus.com/docs/manual_integracao_NIP_e_retorno_automatico_de_dados.pdf
- Configurar notificação: https://dev.akatus.com/painel/cart/notifications
- Usar um túnel local: http://progrium.com/localtunnel/

gem install localtunnel

rails s

localtunnel -k ~/.ssh/id_rsa.pub 3000



What you have to know about the store (the receiver of the payment):
- email_cobranca


Tips:
- work with decimal numbers, not with floats


