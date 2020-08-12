# frozen_string_literal: true

module InvoiceManager
  module Web
    Router = Hanami::Router.new do
      post '/invoices', to: Controllers::Invoices::Create
      get  '/invoices', to: Controllers::Invoices::Index
    end
  end
end
