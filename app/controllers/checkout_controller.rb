class CheckoutController < ApplicationController

  def api
    set_api_cart
    @payment_options_with_installments = Rails.cache.fetch('payment') do
      Akatus::Services::PaymentOptions.available_with_installments(@cart)
    end
  end

  def api_pay

    set_api_cart
    @cart.payer = YAML.load_file("#{Rails.root}/data/payers.yml").with_indifferent_access[:payers][:payer1]

    if params[:payment_code] == 'boleto'
      @cart.payment_method = Akatus::BoletoBancario.new
      view = 'boleto'
    elsif params[:payment_code][/\Acartao/]
      opts = { brand: params[:payment_code] }.merge(params[:credit_card])
      @cart.payment_method = Akatus::CreditCard.new(opts)
      view = 'credit_card'
    elsif params[:payment_code][/\Atef/]
      @cart.payment_method = Akatus::ElectronicFundsTransfer.new(brand: params[:payment_code])
      view = 'eft'
    else
      raise "Unknown payment code: #{params[:payment_code]}"
    end

    Akatus::Services::Transaction.create(@cart)

    render "checkout/api/#{view}"

  end

  def form
    @cart = YAML.load_file("#{Rails.root}/data/form_carts.yml").with_indifferent_access[:carts][:default]
  end

  def javascript
  end

  private

  def set_api_cart
    @cart = YAML.load_file("#{Rails.root}/data/api_carts.yml").with_indifferent_access[:carts][:cart1]

    @cart.items.each do |item|
      item.price = BigDecimal.new(item.price)
    end

    @cart.discount = BigDecimal.new(@cart.discount)
    @cart.shipping_cost = BigDecimal.new(@cart.shipping_cost)
  end

end
