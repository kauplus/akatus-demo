jQuery ->

  if $('.checkout.form').length > 0

    $('#show-form-fields-btn').click ->

      if $(this).hasClass('active')
        $(this).removeClass('active')
        $(this).html('Mostrar formulário')
        $('#akatus-form input[type=text]').attr('type', 'hidden')
        $('span.field').remove()
      else
        $(this).addClass('active')
        $(this).html('Esconder formulário')
        $('#akatus-form input[type=hidden]').attr('type', 'text')
        $('#akatus-form input[type=text]').each (idx, item) ->
          $(item).before("<span class='field'>#{item.name}</span>")

  if $('.checkout.api').length > 0

    $('.close').click -> $('.credit-card-form').hide()

    $('.show-credit-card-form').click (event) ->

      $('fieldset.installments').hide()
      $("#installments-#{$(this).data('code')}").show()
      $('#card-name').html($(this).data('name'))
      $('.credit-card-form input[name=payment_code]').val($(this).data('code'))

      $('.credit-card-form').show()
      event.preventDefault()

    $('.fill-in').click (event) ->

      form = $(this).closest('form')

      form.find('#credit_card_number').val('4012001038443335')
      form.find('#credit_card_security_code').val('123')
      form.find('#credit_card_expiration').val('05/2018')
      form.find('#credit_card_holder_name').val('MARIO A M MOURA')
      form.find('#credit_card_holder_cpf').val('28361230874')
      form.find('#credit_card_holder_phone').val('1199999999')
      $('fieldset.installments:visible input.parcelas:first').attr('checked', 'true')

      event.preventDefault()
